package alarm;

import alarm.bolt.AlarmBolt;
import alarm.bolt.AverageCalcBolt;
import alarm.spout.ConsumptionSpout;
import backtype.storm.Config;
import backtype.storm.LocalCluster;
import backtype.storm.topology.TopologyBuilder;
import backtype.storm.utils.Utils;

public class LocalClusterMain {
	private static final long TEN_MIN = 10*60*1000;

	public static void main(String[] args) throws Exception {
		TopologyBuilder tb = new TopologyBuilder();

		tb.setSpout("source", new ConsumptionSpout(1000));
		tb.setBolt("average", new AverageCalcBolt()).shuffleGrouping("source");
		tb.setBolt("alarm", new AlarmBolt()).shuffleGrouping("average").shuffleGrouping("source");

		Config conf = new Config();
		conf.setNumWorkers(4);

		LocalCluster cluster = new LocalCluster();
		cluster.submitTopology("test", conf, tb.createTopology());
		Utils.sleep(TEN_MIN);
		cluster.killTopology("test");
		cluster.shutdown();
	}
}