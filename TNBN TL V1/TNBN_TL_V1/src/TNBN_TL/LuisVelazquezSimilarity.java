package TNBN_TL;

import TNBN_TL.Knowledge.KnowledgeSet;
import java.util.ArrayList;

public class LuisVelazquezSimilarity{
	private KnowledgeSet target, auxiliar;
	String NodeX, NodeY;
	String [] subset, remainingNodes;

	public LuisVelazquezSimilarity(KnowledgeSet target, KnowledgeSet auxiliar, String NodeX, String NodeY, String [] subset, String [] remainingNodes){
		this.target = target;
		this.auxiliar = auxiliar;
		this.NodeX = NodeX;
		this.NodeY = NodeY;
		this.subset = subset;
		this.remainingNodes = remainingNodes;
	}

	public double evaluate(double threshold){
		int commonDependencies = 0;
		int commonIndependencies = 0;
		double localSimilarity;
		boolean isTargetIndependent, isAuxIndependent;
		int numRemaining = remainingNodes.length;
		ArrayList<Object []> remainingNodesComb;
		
		for(int i = 0; i < numRemaining; ++i){
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,NodeX,remainingNodes[i],subset,threshold);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,NodeX,remainingNodes[i],subset,threshold);
			
			if(isTargetIndependent && isAuxIndependent)
				commonIndependencies++;
			else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
				
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,NodeY,remainingNodes[i],subset,threshold);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,NodeY,remainingNodes[i],subset,threshold);
			
			if(isTargetIndependent && isAuxIndependent)
				commonIndependencies++;
			else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
		}

		remainingNodesComb = Combinations.getSets(remainingNodes,0,numRemaining,0,2);
		
		for(int i = 0; i < remainingNodesComb.size(); ++i){
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,remainingNodesComb.get(i)[0].toString(),remainingNodesComb.get(i)[1].toString(),subset,threshold);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,remainingNodesComb.get(i)[0].toString(),remainingNodesComb.get(i)[1].toString(),subset,threshold);
			
			if(isTargetIndependent && isAuxIndependent){
				commonIndependencies++;
				//System.out.println(remainingNodesComb.get(i)[0].toString() + " independent from " + remainingNodesComb.get(i)[1].toString());
			}else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
		}
		
		isTargetIndependent = CrossConditionalEntropy.isIndependent(target,NodeX,NodeY,subset,threshold);
		isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,NodeX,NodeY,subset,threshold);
		
		if(isTargetIndependent && isAuxIndependent){
			commonIndependencies++;
			localSimilarity = 1.0;
		}else{ 
			if(!isTargetIndependent && !isAuxIndependent){
				commonDependencies++;
				localSimilarity = 1.0;
			} else {
				localSimilarity = 0.5;
			}
		}
		//System.out.println("localSimilarity : " + localSimilarity + " Common  ind:  " + commonIndependencies + " Common dep: " + commonDependencies);
		return localSimilarity * (commonIndependencies + commonDependencies);
	}
	
	public double evaluate(double thresholdTarget, double thresholdAux){
		int commonDependencies = 0;
		int commonIndependencies = 0;
		double localSimilarity;
		boolean isTargetIndependent, isAuxIndependent;
		int numRemaining = remainingNodes.length;
		ArrayList<Object []> remainingNodesComb;
		
		for(int i = 0; i < numRemaining; ++i){
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,NodeX,remainingNodes[i],subset,thresholdTarget);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,NodeX,remainingNodes[i],subset,thresholdAux);
			
			if(isTargetIndependent && isAuxIndependent)
				commonIndependencies++;
			else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
				
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,NodeY,remainingNodes[i],subset,thresholdTarget);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,NodeY,remainingNodes[i],subset,thresholdAux);
			
			if(isTargetIndependent && isAuxIndependent)
				commonIndependencies++;
			else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
		}

		remainingNodesComb = Combinations.getSets(remainingNodes,0,numRemaining,0,2);
		
		for(int i = 0; i < remainingNodesComb.size(); ++i){
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,remainingNodesComb.get(i)[0].toString(),remainingNodesComb.get(i)[1].toString(),subset,thresholdTarget);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,remainingNodesComb.get(i)[0].toString(),remainingNodesComb.get(i)[1].toString(),subset,thresholdAux);
			
			if(isTargetIndependent && isAuxIndependent){
				commonIndependencies++;
				//System.out.println(remainingNodesComb.get(i)[0].toString() + " independent from " + remainingNodesComb.get(i)[1].toString());
			}else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
		}
		
		isTargetIndependent = CrossConditionalEntropy.isIndependent(target,NodeX,NodeY,subset,thresholdTarget);
		isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,NodeX,NodeY,subset,thresholdAux);
		
		if(isTargetIndependent && isAuxIndependent){
			commonIndependencies++;
			localSimilarity = 1.0;
		}else{ 
			if(!isTargetIndependent && !isAuxIndependent){
				commonDependencies++;
				localSimilarity = 1.0;
			} else {
				localSimilarity = 0.5;
			}
		}
		//System.out.println("localSimilarity : " + localSimilarity + " Common  ind:  " + commonIndependencies + " Common dep: " + commonDependencies);
		return localSimilarity * (commonIndependencies + commonDependencies);
	}
	
	// seperate global similarity so it can be reused for all tests
	
}