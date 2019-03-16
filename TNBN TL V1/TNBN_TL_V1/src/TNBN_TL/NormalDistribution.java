package TNBN_TL;

import TNBN_TL.Distribution;
import java.util.Random;

public class NormalDistribution implements Distribution{
	private double mean;
	private double std;
	
	public NormalDistribution(){}
	
	public NormalDistribution(double mean, double std){
		this.mean = mean;
		this.std = std;
	}
	
	public double getMean(){
		return mean;
	}
	
	public double getStd(){
		return std;
	}
	
	public void setMean(double mean){
		this.mean = mean;
	}
	
	public void setStd(double std){
		this.std = std;
	}
	
	public double generate(){
		Random r = new Random();
		double z, x;

		z = r.nextGaussian();
		x = z * this.std + this.mean;
		
		return x;
	}
}