/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL.Clustering;

import LIPS.Interval;
import LIPS.IntervalSet;
import TNBN_TL.Distance;
import TNBN_TL.EuclideanDistance;
import java.util.ArrayList;

/**
 *
 * @author lfiedlerc
 */
public class IntervalAnalysis {
   
        public static double evaluate(IntervalSet intervals, ArrayList<Object> k){
            double avgDistToMean = 0.0;
            double clustDist = 0.0;
            Cluster intervalA;
            Cluster [] clusters = getClusters(intervals,k);
            Distance dist = new EuclideanDistance();
            int numClusters = intervals.size();
            
            for (int i = 0; i < numClusters; i++) {
                intervalA = clusters[i];
                //avgDistToMean += intervalA.intraClusterDistanceMeanCentroid(dist);
                //avgDistToMean += intervalA.maxIntraClusterDistance(dist);
                avgDistToMean += intervalA.intraClusterDistanceMean(dist);
                
                if(i < numClusters - 1){
                    clustDist += interClusterDistanceAllPoints(dist, clusters[i], clusters[i+1]);
                }
                //double range = intervals.getIntervalAtIndex(i).getEnd() - intervals.getIntervalAtIndex(i).getStart();
                //System.out.println("Range " + range);
                //clustDist += intervalA.getNumElements()/range;
                    
            }
            
            avgDistToMean /= numClusters;
            //System.out.println(intervals.toString());
            //System.out.println("avgDistMean: " + avgDistToMean);
            clustDist /= (numClusters - 1);
            //clustDist /= numClusters;
            return clustDist / avgDistToMean;
        }
        
        //Stable because it uses an average of the data being generated
        private static double interClusterDistanceCentroid(Distance d, Cluster a, Cluster b){
            return d.calculate(a.getCentroid(), b.getCentroid());
	}
        
        //Stable because it uses an average of the data being generated
        private static double interClusterDistanceAllPoints(Distance d, Cluster a, Cluster b){
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
        
        //Unstable behavoir because it depends on the data being generated
        private static double interClusterDistanceMinPoints(Distance d, Cluster a, Cluster b){
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
        
        //Unstable behavoir because it depends on the data being generated
        private static double interClusterDistanceMaxPoints(Distance d, Cluster a, Cluster b){
            double point1, point2, tempDist;
            Double dist = 0.0;
           
            for(int i = 0; i < a.getNumElements(); ++i){
                point1 = a.getInstance(i);
                for(int j = 0; j < b.getNumElements(); ++j){
                    point2 = b.getInstance(j);
                    tempDist = d.calculate(point1, point2);
                    if(tempDist > dist){
                        dist = tempDist;
                    }
                }
            }
            return dist;
        }
        
        private static Cluster [] getClusters(IntervalSet intervals, ArrayList<Object> k){
            Cluster [] clusters = new Cluster[intervals.size()];
            double centroid;
            double value;
            int index;
            
            for(int i = 0; i < clusters.length; ++i){
                clusters[i] = new Cluster();
            }
            
            for(int i = 0; i < k.size(); ++i){
                value = Double.parseDouble(k.get(i).toString());
                index = intervals.getIndexOfValue(value);
                if(index < clusters.length){
                    clusters[index].addInstance(value);
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
