/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL.Clustering;

import LIPS.Interval;
import LIPS.IntervalSet;
import TNBN_TL.Distance;
import TNBN_TL.EuclideanDistance;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import weka.clusterers.SimpleKMeans;
import weka.core.Instance;
import weka.core.Instances;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.Remove;
import weka.filters.unsupervised.instance.RemoveWithValues;

/**
 *
 * @author lfiedlerc
 */
public class Kmeans {
    
    public Instances data;
    public Instances filtered;
    private SimpleKMeans k;
    
    public Kmeans(String arff){
        try{
            try (BufferedReader reader = new BufferedReader(new FileReader(arff))) {
                data = new Instances(reader);
            }
            k = new SimpleKMeans();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public Instances getInstances(){
        return data;
    }
    
    public ArrayList<Object> getFilteredInstances(){
        ArrayList<Object> inst = new ArrayList<>();
        for(int i = 0; i < filtered.numInstances(); ++i){
            inst.add(filtered.instance(i).value(0));
        }
        return inst;
    }
    
    public Instances getFilteredInstancesAsInstances(){
        return filtered;
    }
    
    public IntervalSet run(int clusters, int indexOfAttribute){
        try {
            String[] ignoreAtt = new String[2];
            ignoreAtt[0] = "-R";                                    
            ignoreAtt[1] = Integer.toString(indexOfAttribute + 1); 
            Remove remove = new Remove(); 
            remove.setOptions(ignoreAtt);
            remove.setInvertSelection(true);          
            remove.setInputFormat(data);                         
            filtered = Filter.useFilter(data, remove);   

            String [] ignoreInst = new String[2];
            ignoreInst[0] = "-S";
            ignoreInst[1] = "0";
            RemoveWithValues removeInst = new RemoveWithValues();
            removeInst.setOptions(ignoreInst);
            removeInst.setInputFormat(filtered);
            filtered = Filter.useFilter(filtered, removeInst);
            
            if(filtered.numInstances() > 0){
            
                int min = (int)Math.round(filtered.attributeStats(0).numericStats.min);
                int max = (int)Math.round(filtered.attributeStats(0).numericStats.max);

                String[] options = k.getOptions();
                options[1] = Integer.toString(clusters);
                k.setOptions(options);
                k.setDisplayStdDevs(true);

                k.buildClusterer(filtered);

                Instances centers = k.getClusterCentroids();
                double [] centros = new double[centers.numInstances()];
                for(int i = 0; i < centros.length; ++i){
                    centros[i] = centers.instance(i).value(0);
                }

                Cluster [] cluster = getClusters(k,filtered);

                int i=0;
                IntervalSet intervalos = new IntervalSet();
                if(centros.length > 1){
                    int medio = (int) calculateUpperBounds(new EuclideanDistance(), cluster[0], cluster[1]);
                    Interval intervalo= new Interval((int)min,(int)medio);
                    intervalos.add(intervalo);
                    for(i=1;i<centros.length-1;i++){
                        medio = (int) (calculateUpperBounds(new EuclideanDistance(), cluster[i], cluster[i+1]));
                        intervalo= new Interval((int)intervalos.getIntervalAtIndex(i-1).getEnd(),(int)medio);
                        intervalos.add(intervalo);
                    }
                    medio = (int) calculateLowerBounds(new EuclideanDistance(), cluster[i-1], cluster[i]);
                    intervalo= new Interval((int)medio,(int)max);
                    intervalos.add(intervalo);
                } else {
                    intervalos.add(new Interval((int)min,(int)max));
                } 

                return intervalos;
            } 
            return new IntervalSet();
        } catch (Exception ex) {
            Logger.getLogger(Kmeans.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    private double calculateUpperBounds(Distance d, Cluster a, Cluster b){
            double point1 = 0.0, point2 = Double.MAX_VALUE, temp;
           
            for(int i = 0; i < a.getNumElements(); ++i){
                temp = a.getInstance(i);
                if(temp > point1){
                    point1 = temp;
                }
            }
            for(int j = 0; j < b.getNumElements(); ++j){
                    temp = b.getInstance(j);
                    if(temp < point2){
                        point2 = temp;
                    }
            }
            return point1 + (d.calculate(point1, point2))/2.0;
    }
    
    private double calculateLowerBounds(Distance d, Cluster a, Cluster b){
            double point1 = 0.0, point2 = Double.MAX_VALUE, temp;
           
            for(int i = 0; i < a.getNumElements(); ++i){
                temp = a.getInstance(i);
                if(temp > point1){
                    point1 = temp;
                }
            }
            for(int j = 0; j < b.getNumElements(); ++j){
                    temp = b.getInstance(j);
                    if(temp < point2){
                        point2 = temp;
                    }
            }

            return point2 - (d.calculate(point1, point2))/2.0;
    }
    
    private Cluster [] getClusters(SimpleKMeans c, Instances data) throws Exception{
            Cluster [] clusters = new Cluster[c.numberOfClusters()];
            ArrayList<Cluster> ls = new ArrayList<>();
            Instance inst;
            boolean added;
		
            for(int i = 0; i < clusters.length; ++i){
                //System.out.println("Centroid > " + c.getClusterCentroids().instance(i).value(0));
                clusters[i] = new Cluster(c.getClusterCentroids().instance(i).value(0));
            }
		
            for(int i = 0; i < data.numInstances(); ++i){
                inst = data.instance(i);
                clusters[c.clusterInstance(inst)].addInstance(inst);
            }
            
            ls.add(clusters[0]);
            for(int i = 1; i < clusters.length; ++i){
                added = false;
                int j = 0;
                while(j < ls.size() && !added){
                    if(clusters[i].getCentroid() < ls.get(j).getCentroid()){
                        ls.add(j, clusters[i]);
                        added = true;
                    }
                    j++;
                }
                if(!added){
                    ls.add(clusters[i]);
                }
            }
            return ls.toArray(new Cluster[ls.size()]);
    }
    
    public double analyzeClusters(ClusterAnalysis index){
        return index.evaluate(k,filtered);
    }
    
    public double analyzeClusters(ClusterAnalysis index, Instances data){
        return index.evaluate(k,data);
    }
    
}
