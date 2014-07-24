package main.java.alarm;

import backtype.storm.Config;
import backtype.storm.StormSubmitter;
import backtype.storm.topology.TopologyBuilder;
import backtype.storm.tuple.Fields;
import backtype.storm.utils.Utils;
import main.java.alarm.bolt.AlarmBolt;
import main.java.alarm.bolt.AverageCalcBolt;
import main.java.alarm.spout.ConsumptionSpout;

public class Main {
	private static final long TEN_MIN = 10*60*1000;

	public static void main(String[] args) throws Exception {
		
		int messagesPerSecond = Integer.parseInt(args[0]);
		int numOfWorkers;
		try{
			numOfWorkers = Integer.parseInt(args[1]);
		}catch(Exception e) {
			numOfWorkers = 1;
		}
		
		TopologyBuilder builder = new TopologyBuilder();
		builder.setSpout("source", new ConsumptionSpout(messagesPerSecond), numOfWorkers);
		builder.setBolt("average", new AverageCalcBolt(), 4).setNumTasks(16).fieldsGrouping("source", new Fields("key"));
		builder.setBolt("main/alarm", new AlarmBolt()).shuffleGrouping("average"); //shuffleGrouping(?)

		Config conf = new Config();
		conf.put(Config.TOPOLOGY_DEBUG, false);
		conf.setNumWorkers(7);

		StormSubmitter.submitTopology("sg-app-storm", conf, builder.createTopology());
		
	}
	
	private static void sleep() {
		System.out.println("Going to sleep...");
		Utils.sleep(TEN_MIN);
		System.out.println("Finished!!!");
	}
}
