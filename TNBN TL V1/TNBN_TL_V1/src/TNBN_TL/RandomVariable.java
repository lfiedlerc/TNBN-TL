package TNBN_TL;

import java.util.ArrayList;

public class RandomVariable{
	private String name;
	private Object [] values;
	private ProbabilityDistribution p;
	private ArrayList<RandomVariable> parents;
	private String type;
	
	public RandomVariable(String name, String [] values){
		this.name = name;
		this.values = values;
		this.p = new ProbabilityDistribution(name);
		parents = new ArrayList<RandomVariable>();
		type = "String";
	}
	
	public RandomVariable(String name, Integer [] values){ 
		this.name = name;
		this.values = values;
		this.p = new ProbabilityDistribution(name);
		parents = new ArrayList<RandomVariable>();
		type = "Integer";
	}
	
	public RandomVariable(String name, Double [] values) {
		this.name = name;
		this.values = values;
		this.p = new ProbabilityDistribution(name);
		parents = new ArrayList<RandomVariable>();
		type = "Double";
	}
	
	public RandomVariable(String name, Boolean [] values){ 
		this.name = name;
		this.values = values;
		this.p = new ProbabilityDistribution(name);
		parents = new ArrayList<RandomVariable>();
		type = "Boolean";
	}
	
	public RandomVariable(String name, Temporal [] values){ 
		this.name = name;
		this.values = values;
		this.p = new ProbabilityDistribution(name);
		parents = new ArrayList<RandomVariable>();
		type = "Temporal";
	}
	
	public RandomVariable(String name, String [] values, ProbabilityDistribution p){
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = new ArrayList<RandomVariable>();
		type = "String";
	}
	
	public RandomVariable(String name, Integer [] values, ProbabilityDistribution p){ 
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = new ArrayList<RandomVariable>();
		type = "Integer";
	}
	
	public RandomVariable(String name, Double [] values, ProbabilityDistribution p) {
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = new ArrayList<RandomVariable>();
		type = "Double";
	}
	
	public RandomVariable(String name, Boolean [] values, ProbabilityDistribution p){ 
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = new ArrayList<RandomVariable>();
		type = "Boolean";
	}
	
	public RandomVariable(String name, Temporal [] values, ProbabilityDistribution p){ 
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = new ArrayList<RandomVariable>();
		type = "Temporal";
	}
	
	public RandomVariable(String name, String [] values, ProbabilityDistribution p, ArrayList<RandomVariable> parents, ArrayList<RandomVariable> children){
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = parents;
		type = "String";
	}
	
	public RandomVariable(String name, Integer [] values, ProbabilityDistribution p, ArrayList<RandomVariable> parents, ArrayList<RandomVariable> children){ 
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = parents;
		type = "Integer";
	}
	
	public RandomVariable(String name, Double [] values, ProbabilityDistribution p, ArrayList<RandomVariable> parents, ArrayList<RandomVariable> children) {
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = parents;
		type = "Double";
	}
	
	public RandomVariable(String name, Boolean [] values, ProbabilityDistribution p, ArrayList<RandomVariable> parents, ArrayList<RandomVariable> children){ 
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = parents;
		type = "Boolean";
	}
	
	public RandomVariable(String name, Temporal [] values, ProbabilityDistribution p, ArrayList<RandomVariable> parents, ArrayList<RandomVariable> children){ 
		this.name = name;
		this.values = values;
		this.p = p;
		this.parents = parents;
		type = "Temporal";
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public int numberOfValues(){
		return values.length;
	}
	
	public Object[] getValues(){
		return values;
	}
	
	public Object getValueAt(int index){
		return values[index];
	}
	
	public void setValues(Object [] values){
		this.values = values;
	}
	
	public ArrayList<RandomVariable> getParents(){
		return parents;
	}
        
        public ArrayList<RandomVariable> getCopyOfParents(){
            ArrayList<RandomVariable> copy = new ArrayList<>();
            
            for(RandomVariable r : parents){
                copy.add(r);
            }
            return copy;
	}
	
	public void setParents(ArrayList<RandomVariable> parents){
		this.parents = parents;
	}
	
	public String getType(){
		return type;
	}
	
	public ProbabilityDistribution getProbabilityDistribution(){
		return p;
	}
	
	public void setProbabilityDistribution(ProbabilityDistribution p){
		this.p = p;
	}
	
	@Override
	public boolean equals(Object o){
		RandomVariable r = (RandomVariable)o;
		if(r.getName().equals(name)) 
			return true;
		return false;
	}
        
        public static boolean containsType(ArrayList<RandomVariable> vars, String type){
            for(RandomVariable r : vars){
                if(r.getType().equals(type)){
                    return true;
                }
            }
            return false;
        }
        
        public static ArrayList<RandomVariable> getVarsOfType(ArrayList<RandomVariable> vars, String type){
            ArrayList<RandomVariable> list = new ArrayList<>();
            
            for(RandomVariable r : vars){
                if(r.getType().equals(type)){
                    list.add(r);
                }
            }
            return list;
        }
        
        public static ArrayList<RandomVariable> getIntersection(ArrayList<RandomVariable> v1, ArrayList<RandomVariable> v2){
            ArrayList<RandomVariable> intersection = new ArrayList<>();
            
            for(RandomVariable r : v1){
                if(v2.contains(r)){
                    intersection.add(r);
                }
            }
            return intersection;
        }
        
        public static int getIndexOf(String name, ArrayList<RandomVariable> v){
            int i = 0;
            for(RandomVariable r : v){
                if(r.getName().equals(name)){
                    return i;
                }
                i++;
            }
            return -1;
        }
            
        public static RandomVariable getRandomVariable(String name, ArrayList<RandomVariable> v){
            for(RandomVariable r : v){
                if(r.getName().equals(name)){
                    return r;
                }
            }
            return null;
        }
}