package alarm;

import alarm.bolt.AlarmBolt;
import alarm.bolt.AverageCalcBolt;
import alarm.spout.ConsumptionSpout;
import backtype.storm.Config;
import backtype.storm.StormSubmitter;
import backtype.storm.topology.TopologyBuilder;
import backtype.storm.utils.Utils;

public class Main {
	private static final long TEN_MIN = 10*60*1000;

	public static void main(String[] args) throws Exception {
		
		TopologyBuilder builder = new TopologyBuilder();
		builder.setSpout("source", new ConsumptionSpout());
		builder.setBolt("average", new AverageCalcBolt(), 2).shuffleGrouping("source");
		builder.setBolt("alarm", new AlarmBolt()).shuffleGrouping("average").shuffleGrouping("source"); //shuffleGrouping(?)

		Config conf = new Config();
		conf.setNumWorkers(3);

		StormSubmitter.submitTopology("sg-app-storm", conf, builder.createTopology());
		
		sleep();
	}
	
	private static void sleep() {
		System.out.println("Going to sleep...");
		Utils.sleep(TEN_MIN);
		System.out.println("Finished!!!");
	}
}