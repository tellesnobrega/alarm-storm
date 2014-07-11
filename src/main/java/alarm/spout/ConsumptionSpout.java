package main.java.alarm.spout;

import backtype.storm.spout.SpoutOutputCollector;
import backtype.storm.task.TopologyContext;
import backtype.storm.topology.IRichSpout;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Values;
import backtype.storm.utils.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;
import java.util.Random;

public class ConsumptionSpout implements IRichSpout {
	private static final long serialVersionUID = 1L;
	private static final long ONE_SEC = 1*1000;
	private Random rand; 
	private int[] loadPerSecond = {100,500,1000,1500,2000,2500};
	public SpoutOutputCollector _collector;
    private static final Logger log = LoggerFactory.getLogger(ConsumptionSpout.class);
    private long sleepTime;
	

    public ConsumptionSpout(int measuresPerSec) {
		this.sleepTime = ONE_SEC/measuresPerSec;
		rand = new Random();
	}
    
	@Override
	public void open(@SuppressWarnings("rawtypes") Map conf, TopologyContext context, SpoutOutputCollector collector) {
		_collector = collector;
	}

	@Override
	public void close() { }

	@Override
	public void activate() { }

	@Override
	public void deactivate() { }

	@Override
	public void nextTuple() {
		Utils.sleep(this.sleepTime);
		
		int key = rand.nextInt(10);
		int value = rand.nextInt(100);
		String id = key+";"+value;
		_collector.emit(new Values(key, value), id);	
		String output = "Event Sent - key: " + key + " value: " + value;
		log.info(output);
	}

	@Override
	public void ack(Object msgId) {
//		log.info("ACK: " + msgId.toString());
	}

	@Override
	public void fail(Object msgId) {
		log.info("FAIL: " + msgId.toString());
	}

	@Override
	public void declareOutputFields(OutputFieldsDeclarer declarer) {
		declarer.declare(new Fields("key","value"));
		
	}

	@Override
	public Map<String, Object> getComponentConfiguration() { return null; }
}
