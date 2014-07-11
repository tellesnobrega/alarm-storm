package main.alarm.bolt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import main.alarm.Event;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

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
	private List<Integer> measurements = new ArrayList<>();
	public OutputCollector _collector;
	static Logger log = Logger.getLogger(AverageCalcBolt.class);

	@Override
	public void prepare(@SuppressWarnings("rawtypes") Map stormConf, TopologyContext context, OutputCollector collector) {
		_collector = collector;
		PropertyConfigurator.configure("log4j.properties");
	}

	@Override
	public void execute(Tuple input) {
		Integer key = input.getIntegerByField("key");
		Integer value = input.getIntegerByField("value");
		addMeasurement(value);
		Event average = new Event(calcAverage(), value);
		_collector.emit(new Values(average));
		_collector.ack(input);
		log.info("Key: " + key + " Value: " + value);
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