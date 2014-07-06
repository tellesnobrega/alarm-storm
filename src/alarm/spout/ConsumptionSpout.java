package alarm.spout;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.GregorianCalendar;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import backtype.storm.spout.SpoutOutputCollector;
import backtype.storm.task.TopologyContext;
import backtype.storm.topology.IRichSpout;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Values;

public class ConsumptionSpout implements IRichSpout {
	private static final long serialVersionUID = 1L;
	private static final long ONE_SEC = 1*1000;
	private Random rand; 
	private int INCREASE_LOAD_TIME_INTERVAL = 10 * 1000;
	private int loadPerSecond = 100;
	private Long initialTenSeconds;
	public SpoutOutputCollector _collector;
    static Logger log = Logger.getLogger(ConsumptionSpout.class);
	

	@Override
	public void open(@SuppressWarnings("rawtypes") Map conf, TopologyContext context, SpoutOutputCollector collector) {
		rand = new Random();
		_collector = collector;
		PropertyConfigurator.configure("log4j.properties");
	}

	@Override
	public void close() { }

	@Override
	public void activate() { }

	@Override
	public void deactivate() { }

	@Override
	public void nextTuple() {
		log.info("NEXT_TUPLE");
		initialTenSeconds = new GregorianCalendar().getTimeInMillis();
		long initialOneSecond = new GregorianCalendar().getTimeInMillis();
		long currentTime = new GregorianCalendar().getTimeInMillis();
		int counter = 0;
		int loop = 0;
		while(currentTime - initialTenSeconds < this.INCREASE_LOAD_TIME_INTERVAL) {
			loop++;
			while(currentTime - initialOneSecond < ConsumptionSpout.ONE_SEC) {
				int key = rand.nextInt(10);
				int value = rand.nextInt(100);
				if(counter < this.loadPerSecond) {
					counter++;
					String id = "ID" + counter + ";" + loop; 
					_collector.emit(new Values(key, value), id);	
					String output = "Event Sent - key: " + key + " value: " + value;
					log.info(output);
				}
				currentTime = new GregorianCalendar().getTimeInMillis();
				log.info("COUNTER: " + counter);
			}
			counter = 0;
			if(currentTime - initialTenSeconds >= this.INCREASE_LOAD_TIME_INTERVAL) {
				this.loadPerSecond *= 10;
				this.initialTenSeconds = new GregorianCalendar().getTimeInMillis();
				currentTime = new GregorianCalendar().getTimeInMillis();
			}
			initialOneSecond = new GregorianCalendar().getTimeInMillis();
			currentTime = new GregorianCalendar().getTimeInMillis();
		}
	}

	@Override
	public void ack(Object msgId) {
		log.info("ACK: " + msgId.toString());
	}

	@Override
	public void fail(Object msgId) { }

	@Override
	public void declareOutputFields(OutputFieldsDeclarer declarer) {
		declarer.declare(new Fields("key","value"));
		
	}

	@Override
	public Map<String, Object> getComponentConfiguration() { return null; }
}