package alarm.bolt;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import alarm.Event;
import alarm.Type;
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
		Properties props = new Properties();
		try {
			props.load(new FileInputStream("log4j.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PropertyConfigurator.configure(props);
	}

	@Override
	public void execute(Tuple input) {
		Integer value = input.getIntegerByField("value");
		addMeasurement(value);
		Event average = new Event(calcAverage(), value);
		_collector.emit(new Values(average));
		log.info("Value: " + value);
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