package TNBN_TL;

import java.util.ArrayList;

public class EvaluateParametricExperiment{
	public static void main(String [] args){
		String [] networks = {"parameter experiment/Collision.elv"};
		
		String [] testingData = {"parameter experiment/test1.dbc"};
		
		int numCases = 800;
		int continuous [] = {3,4};
		double precision = 0.0;
		for(int i = 0; i < networks.length; ++i){
			precision += EvaluateNetwork.brierScore(networks[i], testingData[i], numCases, continuous);
		}
		precision = precision / networks.length;
		System.out.println("Precision is: " + precision);
	}
}