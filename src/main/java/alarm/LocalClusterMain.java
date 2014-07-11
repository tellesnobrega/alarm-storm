package main.java.alarm;

import backtype.storm.Config;
import backtype.storm.LocalCluster;
import backtype.storm.topology.TopologyBuilder;
import backtype.storm.utils.Utils;
import main.java.alarm.bolt.AlarmBolt;
import main.java.alarm.bolt.AverageCalcBolt;
import main.java.alarm.spout.ConsumptionSpout;

public class LocalClusterMain {
	private static final long TEN_MIN = 10*60*1000;

	public static void main(String[] args) throws Exception {
		TopologyBuilder tb = new TopologyBuilder();

		tb.setSpout("source", new ConsumptionSpout(1000));
		tb.setBolt("average", new AverageCalcBolt()).shuffleGrouping("source");
		tb.setBolt("main/alarm", new AlarmBolt()).shuffleGrouping("average").shuffleGrouping("source");

		Config conf = new Config();
		conf.setNumWorkers(4);

		LocalCluster cluster = new LocalCluster();
		cluster.submitTopology("test", conf, tb.createTopology());
		Utils.sleep(TEN_MIN);
		cluster.killTopology("test");
		cluster.shutdown();
	}
}