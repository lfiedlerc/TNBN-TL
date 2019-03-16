package TNBN_TL;

import LIPS.Interval;
import LIPS.IntervalSet;
import java.util.ArrayList;

public class TemporalVariable extends RandomVariable{
	private Distribution [] d;
	
	public TemporalVariable(String name, Temporal [] values){
		super(name,values);
		d = new Distribution[0];
        }
	
	public TemporalVariable(String name, Temporal [] values, Distribution [] d, ProbabilityDistribution p){
		super(name,values,p);
		this.d = d;
	}
	
	public Distribution[] getDistribution(){
		return d;
	}
	
	public void setDistribution(Distribution [] d){
		this.d = d;
	}
	
	public void setValues(ArrayList<String> intervals){
            Temporal [] values = new Temporal[intervals.size()];
            String value;
            
            for(int i = 0; i < values.length; ++i){
                value = intervals.get(i);
                if(value.equals("Default")){
                    values[i] = new Temporal();
                } else {
                    if(i == values.length - 2){
                        values[i] = new Temporal(value.substring(1, value.length() - 1), 2);
                    } else {
                        values[i] = new Temporal(value.substring(1, value.length() - 1), 1);
                    }
                }
            }
            this.setValues(values);
        }
        
        public ArrayList<String> getValuesAsStrings(){
            ArrayList<String> values = new ArrayList<>();
            Temporal [] vals = (Temporal [])this.getValues();
            
            for(int i = 0; i < vals.length; ++i){
                if(vals[i].toString().equals("Default")){
                    values.add("Default");
                } else {
                    values.add("\"" + vals[i].toString() + "\"");
                }
            }
            return values;
        }
        
        public IntervalSet getValuesAsIntervalSetNoDefault(){
            IntervalSet values = new IntervalSet();
            Temporal [] vals = (Temporal [])this.getValues();
            
            for(int i = 0; i < vals.length; ++i){
                if(!vals[i].toString().equals("Default")){
                    values.add(new Interval(vals[i].getLowerBounds(),vals[i].getUpperBounds()));
                }
            }
            return values;
        }
}