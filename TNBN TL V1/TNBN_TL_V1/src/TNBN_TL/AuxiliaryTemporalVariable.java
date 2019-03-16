package TNBN_TL;

public class AuxiliaryTemporalVariable extends TemporalVariable{
	private double similarity;
	
        public AuxiliaryTemporalVariable(String name, Temporal [] values, double similarity){
		super(name,values);
		this.similarity = similarity;
	}
        
	public AuxiliaryTemporalVariable(String name, Temporal [] values, Distribution [] d, ProbabilityDistribution p, double similarity){
		super(name,values,d,p);
		this.similarity = similarity;
	}
	
	public double getSimilarity(){
		return similarity;
	}
	
	public void setSimilarity(double similarity){
		this.similarity = similarity;
	}
}