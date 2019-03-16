/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import LIPS.IntervalSet;
import TNBN_TL.Clustering.DunnIndex;
import TNBN_TL.Clustering.IntervalAnalysis;
import TNBN_TL.Clustering.Kmeans;

/**
 *
 * @author lfiedlerc
 */
public class testKmeans {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Kmeans k = new Kmeans("C:/Users/lfiedlerc/Desktop/test2.arff");
        //IntervalAnalysis ia = new IntervalAnalysis();
        double max = 0.0;
        int numIntervals = 0;
        DunnIndex dunn = new DunnIndex();
        for(int numClusters = 2; numClusters < 5; numClusters++){
            //Kmeans k = new Kmeans("C:/Users/lfiedlerc/Dropbox/Thesis/New source code/TNBN TL V1/TNBN_TL_V1/LIPS comparison/input files/TargetData.arff");
            Kmeans k = new Kmeans("C:/Users/lfiedlerc/Dropbox/Thesis/New source code/TNBN TL V1/TNBN_TL_V1/Experiments with interval refinement/Different temporal range/10 target records/100pct aux/input files/TargetData.arff");
            IntervalSet set = k.run(numClusters,3);
            System.out.println(set.toString());

            double dunnIndex = k.analyzeClusters(new DunnIndex());//dunn.evaluate(set, k.getFilteredInstances());
            //k.analyzeClusters(new DunnIndex());//
            System.out.println("Interval index for " + numClusters + ": " + dunnIndex);
            if(dunnIndex > max){
                max = dunnIndex;
                numIntervals = numClusters;
            }
        }
        System.out.println("Best number of intervals : " + numIntervals);
    }
}
