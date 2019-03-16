package TNBN_TL;

import java.util.StringTokenizer;

public class Temporal{
	private final int lowerBounds;
	private final int upperBounds;
	private final String temporalValue;
	private final int type;
	
	public Temporal(int lowerBounds, int upperBounds, int type){
		if(lowerBounds > upperBounds){
			// throw exception
		}
		
		this.lowerBounds = lowerBounds;
		this.upperBounds = upperBounds;
		this.type = type;
		temporalValue = "[" + lowerBounds + "-" + upperBounds + "]";
	}
	
	public Temporal(String interval, int type){
		if(interval.charAt(0) != '[' || interval.charAt(interval.length() - 1) != ']'){
			//throw exception
		}

		StringTokenizer tk = new StringTokenizer(interval.substring(1,interval.length() - 1),"-");
		
		lowerBounds = (int)Double.parseDouble(tk.nextToken());
		upperBounds = (int)Double.parseDouble(tk.nextToken());
		this.type = type;
		temporalValue = "[" + lowerBounds + "-" + upperBounds + "]";
	}
	
	public Temporal(){
		lowerBounds = -1;
		upperBounds = -1;
		type = -1;
		temporalValue = "Default";
	}
	
	public double getLowerBounds(){
		if(temporalValue.equals("Default"))
			return Double.NaN;
		return lowerBounds;
	}
	
	public double getUpperBounds(){
		if(temporalValue.equals("Default"))
			return Double.NaN;
		return upperBounds;
	}
	
	public boolean inRange(double value){
		if(type == 1){ // exclusive
			if(value >= lowerBounds && value < upperBounds)
				return true;
			return false;
		}
		if(type == 2){ // inclusive
			if(value >= lowerBounds && value <= upperBounds)
				return true;
			return false;
		} 
		return false;
	}
	
	public double getMean(){
		if(temporalValue.equals("Default"))
			return Double.NaN;
		return (lowerBounds + upperBounds)/2.0;
	}
	
	public double getStd(){
		if(temporalValue.equals("Default"))
			return Double.NaN;
		return upperBounds - this.getMean();
	}
	
	@Override
	public String toString(){
		return temporalValue;
	}
	
	@Override
	public boolean equals(Object o){
		Temporal t;
		if(o.toString().equals("Default"))
			t = new Temporal();
		else
			t = new Temporal(o.toString(),1);
			
		if(temporalValue.equals(t.toString()))
			return true;
		return false;
	}
        
        public static Temporal[] toTemporal(String [] intervals){
            Temporal [] values = new Temporal[intervals.length];
            
            for(int i = 0; i < values.length; ++i){
                if(i == values.length - 1){
                    values[i] = new Temporal();
                } else {
                    if(i == values.length - 2){
                        if(intervals[i].charAt(0) == '"'){
                            values[i] = new Temporal(intervals[i].substring(1, intervals[i].length()-1),2);
                        }else{
                            values[i] = new Temporal(intervals[i],2);
                        }
                    } else {
                        if(intervals[i].charAt(0) == '"'){
                            values[i] = new Temporal(intervals[i].substring(1, intervals[i].length()-1),1);
                        }else{
                            values[i] = new Temporal(intervals[i],1);
                        }
                    }
                }	
            }
            return values;
        }
}