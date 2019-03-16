package TNBN_TL.Clustering;

import LIPS.IntervalSet;
import java.util.ArrayList;
import weka.clusterers.SimpleKMeans;
import weka.core.Instances;

public interface ClusterAnalysis{
	public double evaluate(SimpleKMeans c, Instances i);
        
        public double evaluate(IntervalSet intervals, ArrayList<Object> k);
}