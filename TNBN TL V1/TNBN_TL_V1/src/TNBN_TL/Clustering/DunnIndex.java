package TNBN_TL.Clustering;

import LIPS.IntervalSet;
import TNBN_TL.Distance;
import TNBN_TL.EuclideanDistance;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import weka.clusterers.SimpleKMeans;
import weka.core.Instance;
import weka.core.Instances;

public class DunnIndex implements ClusterAnalysis{
	
        @Override
	public double evaluate(SimpleKMeans c, Instances data){
            try {
                double maxIntraClusterdist = 0;
                Double minClusterDistance = null;
                double temp;
                double clustDist;
                Cluster clusterA, clusterB;
                Cluster [] clusters = getClusters(c,data);
                Distance dist = new EuclideanDistance();
                int numClusters = c.numberOfClusters();

                for (int i = 0; i < numClusters; i++) {
                    clusterA = clusters[i];
                    temp = clusterA.intraClusterDistanceMean(dist);
                    //temp = clusterA.maxIntraClusterDistance(dist);
                    //temp = clusterA.intraClusterDistanceMeanCentroid(dist);
                    if (temp > maxIntraClusterdist) {
                        maxIntraClusterdist = temp;
                    }
                    for (int j = i + 1; j < numClusters; j++) {
                        clusterB = clusters[j];
                        //clustDist = interClusterDistanceCentroid(dist, clusterA, clusterB);
                        clustDist = interClusterDistanceAllPoints(dist, clusterA, clusterB);
                        if (minClusterDistance == null || clustDist < minClusterDistance){
                            minClusterDistance = clustDist;
                        }
                    }
                }

                if (minClusterDistance == null){
                    return Float.NaN; //This normaly means we have only one cluster
                                 // and can therefore not calculate anything
                }
                /*System.out.println("minClusterDistance " + minClusterDistance);
                System.out.println("maxIntraClusterdist: " + maxIntraClusterdist);*/
                System.out.println(minClusterDistance / maxIntraClusterdist);
                return   minClusterDistance / maxIntraClusterdist;
            } catch (Exception ex) {
                Logger.getLogger(DunnIndex.class.getName()).log(Level.SEVERE, null, ex);
                return Double.NaN;
            }
	}
        
        @Override
        public double evaluate(IntervalSet intervals, ArrayList<Object> k){
            double maxIntraClusterdist = 0;
            Double minClusterDistance = null;
            double temp;
            double clustDist;
            Cluster clusterA, clusterB;
            Cluster [] clusters = getClusters(intervals,k);
            Distance dist = new EuclideanDistance();
            int numClusters = intervals.size();
            
            for (int i = 0; i < numClusters; i++) {
                clusterA = clusters[i];
                temp = clusterA.intraClusterDistanceMean(dist);
                //temp = clusterA.maxIntraClusterDistance(dist);
                //temp = clusterA.intraClusterDistanceMeanCentroid(dist);
                if (temp > maxIntraClusterdist) {
                    maxIntraClusterdist = temp;
                }
                for (int j = i + 1; j < numClusters; j++) {
                    clusterB = clusters[j];
                    //clustDist = interClusterDistanceCentroid(dist, clusterA, clusterB);
                    clustDist = interClusterDistanceAllPoints(dist, clusterA, clusterB);
                    if (minClusterDistance == null || clustDist < minClusterDistance){
                        minClusterDistance = clustDist;
                    }
                }
            }
            /*System.out.println("minClusterDistance " + minClusterDistance);
            System.out.println("maxIntraClusterdist: " + maxIntraClusterdist);*/
            if (minClusterDistance == null){
                return Float.NaN; //This normaly means we have only one cluster
                                 // and can therefore not calculate anything
            }
            return   minClusterDistance / maxIntraClusterdist;
        }
	
	private double interClusterDistanceCentroid(Distance d, Cluster a, Cluster b){
            return d.calculate(a.getCentroid(), b.getCentroid());
	}
        
        private double interClusterDistanceMinPoints(Distance d, Cluster a, Cluster b){
            double point1, point2, tempDist;
            Double dist = Double.MAX_VALUE;
           
            for(int i = 0; i < a.getNumElements(); ++i){
                point1 = a.getInstance(i);
                for(int j = 0; j < b.getNumElements(); ++j){
                    point2 = b.getInstance(j);
                    tempDist = d.calculate(point1, point2);
                    if(tempDist < dist){
                        dist = tempDist;
                    }
                }
            }
            return dist;
        }
        
        private double interClusterDistanceAllPoints(Distance d, Cluster a, Cluster b){
            double point1, point2, tempDist = 0.0;
            double div = 0.0;
           
            for(int i = 0; i < a.getNumElements(); ++i){
                point1 = a.getInstance(i);
                for(int j = 0; j < b.getNumElements(); ++j){
                    point2 = b.getInstance(j);
                    tempDist += d.calculate(point1, point2);
                    div++;
                }
            }
            return tempDist / div;
        }
	
	private Cluster [] getClusters(SimpleKMeans c, Instances data) throws Exception{
            Cluster [] clusters = new Cluster[c.numberOfClusters()];
            Instance inst;
		
            for(int i = 0; i < clusters.length; ++i){
                //System.out.println("Centroid > " + c.getClusterCentroids().instance(i).value(0));
                clusters[i] = new Cluster(c.getClusterCentroids().instance(i));
            }
		
            for(int i = 0; i < data.numInstances(); ++i){
                inst = data.instance(i);
                clusters[c.clusterInstance(inst)].addInstance(inst);
            }
            return clusters;
	}
        
        private Cluster [] getClusters(IntervalSet intervals, ArrayList<Object> k){
            Cluster [] clusters = new Cluster[intervals.size()];
            double centroid;
            double value;
            int index;
            String val;
            
            for(int i = 0; i < clusters.length; ++i){
                clusters[i] = new Cluster();
            }
            
            for(int i = 0; i < k.size(); ++i){
                val = k.get(i).toString();
                if(!val.equals("Default")){
                    value = Double.parseDouble(val);
                    index = intervals.getIndexOfValue(value);
                    if(index < clusters.length){
                        clusters[index].addInstance(value);
                    }
                }
            }
            
            for(int i = 0; i < clusters.length; ++i){
               centroid = clusters[i].calculateCentroid();
               //System.out.println("Centroid> " + centroid);
               clusters[i].setCentroid(centroid);
            }
            return clusters;
        }
}