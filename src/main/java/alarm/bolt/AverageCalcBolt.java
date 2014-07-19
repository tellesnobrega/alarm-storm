package main.java.alarm.bolt;

import java.util.*;

import main.java.alarm.Event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import backtype.storm.task.OutputCollector;
import backtype.storm.task.TopologyContext;
import backtype.storm.topology.IRichBolt;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Tuple;
import backtype.storm.tuple.Values;

public class AverageCalcBolt implements IRichBolt {
	private static final long serialVersionUID = 1L;
	public static final int MAX_SIZE = 10;
	private List<Integer> measurements = new ArrayList<Integer>();
	public OutputCollector _collector;
	private static final Logger log = LoggerFactory.getLogger(AverageCalcBolt.class);

	@Override
	public void prepare(Map stormConf, TopologyContext context, OutputCollector collector) {
		_collector = collector;
	}

	@Override
	public void execute(Tuple input) {
		Integer key = input.getIntegerByField("key");
		Integer value = input.getIntegerByField("value");
		addMeasurement(value);
        Date timestamp = new GregorianCalendar().getTime();
        Event average = new Event(calcAverage(), value, timestamp);
		_collector.emit(new Values(average));
        log.info("ACK: " + key + ";" + value + ";" + timestamp);
        _collector.ack(input);
    }

	@Override
	public void cleanup() { }

	@Override
	public void declareOutputFields(OutputFieldsDeclarer declarer) {
		declarer.declare(new Fields("event"));
	}	

	@Override
	public Map<String, Object> getComponentConfiguration() { return null; }

	private void addMeasurement(Integer measurement) {
		if (measurements.size() == MAX_SIZE) {
			measurements.remove(0);
		}
		measurements.add(measurement);
	}
	
	private int calcAverage() {
		int average = 0;
		for (int measurement : measurements) {
			average += measurement;
		}
		return average/measurements.size();
	}
}