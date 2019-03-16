package TNBN_TL.Clustering;

import TNBN_TL.Distance;
import java.util.ArrayList;
import weka.core.Instance;

public class Cluster{
	public double centroid;
	public ArrayList<Double> elements;
        
        public Cluster(){
            elements = new ArrayList<>();
	}
	
	public Cluster(Instance centroid, ArrayList<Instance> elements){
            this.centroid = centroid.value(0);
            for(int i = 0; i < elements.size(); ++i){
                this.elements.add(elements.get(i).value(0));
            }
	}
	
	public Cluster(Instance centroid){
            this.centroid = centroid.value(0);
            elements = new ArrayList<>();
	}
        
        public Cluster(double centroid, ArrayList<Double> elements){
            this.centroid = centroid;
            this.elements = elements;
	}
	
	public Cluster(double centroid){
            this.centroid = centroid;
            elements = new ArrayList<>();
	}
	
	public void addInstance(Instance i){
            elements.add(i.value(0));
	}
        
        public void addInstance(double i){
            elements.add(i);
	}
	
	public double getInstance(int i){
            return elements.get(i);
	}
        
        public double getCentroid(){
            return centroid;
        }
        
        public void setCentroid(double centroid){
            this.centroid = centroid;
        }
	
	public int getNumElements(){
            return elements.size();
	}
	
	public double maxIntraClusterDistance(Distance d){
            double a, b;
            double max = 0.0;
            double current;
            
            for(int i = 0; i < elements.size() - 1; ++i){
                a = elements.get(i);
                for(int j = i+1; j < elements.size(); ++j){
                    b = elements.get(j);
                    current = d.calculate(a, b);
                    if(current > max){
                        max = current;
                    }
                }
            }
            return max;
	}
        
        public double intraClusterDistanceMean(Distance d){
            double a, b;
            double mean = 0.0;
            
            double div = 0.0;
            for(int i = 0; i < elements.size() - 1; ++i){
                a = elements.get(i);
                for(int j = i+1; j < elements.size(); ++j){
                    b = elements.get(j);
                    mean += d.calculate(a, b);
                    div++;
                }
            }
            return mean / div;
	}
        
        public double intraClusterDistanceMeanCentroid(Distance d){
            double a, b = this.getCentroid();
            double mean = 0.0;
            
            double div = 0.0;
            for(int i = 0; i < elements.size(); ++i){
                a = elements.get(i);
                mean += d.calculate(a, b);
                div++;
            }
            if(div > 0){
                return mean / div;
            }else{
                return b;
            }
	}
        
        public double calculateCentroid(){
            double mean = 0.0;
            for(int i = 0; i < elements.size(); ++i){
                mean += elements.get(i);
            }
            return mean / elements.size();
        }
}