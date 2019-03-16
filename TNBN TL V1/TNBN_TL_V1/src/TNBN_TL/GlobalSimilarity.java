package TNBN_TL;

import TNBN_TL.Knowledge.KnowledgeSet;
import java.util.ArrayList;

public class GlobalSimilarity{
	private KnowledgeSet target, auxiliar;
	private String [] nodes;

	public GlobalSimilarity(KnowledgeSet target, KnowledgeSet auxiliar, String [] nodes){
		this.target = target;
		this.auxiliar = auxiliar;
		this.nodes = nodes;;
	}

	public double evaluate(){
		int commonDependencies = 0;
		int commonIndependencies = 0;
		boolean isTargetIndependent, isAuxIndependent;
		int numberOfNodes = nodes.length;
		ArrayList<Object []> nodesComb;
                double auxConfidence, targetConfidence;
		
		nodesComb = Combinations.getSets(nodes,0,numberOfNodes,0,2);
		
		for(int i = 0; i < nodesComb.size(); ++i){
                    auxConfidence = confidence(auxiliar,nodesComb.get(i)[0].toString(),nodesComb.get(i)[1].toString(),new String[0],(double)auxiliar.size());
                    targetConfidence = confidence(target,nodesComb.get(i)[0].toString(),nodesComb.get(i)[1].toString(),new String[0],(double)target.size());
			isTargetIndependent = CrossConditionalEntropy.isIndependent(target,nodesComb.get(i)[0].toString(),nodesComb.get(i)[1].toString(),new String[0],auxConfidence); //MutualInformation.isIndependent(target,nodesComb.get(i)[0].toString(),nodesComb.get(i)[1].toString(),threshold);
			isAuxIndependent = CrossConditionalEntropy.isIndependent(auxiliar,nodesComb.get(i)[0].toString(),nodesComb.get(i)[1].toString(),new String[0],targetConfidence);
			
			if(isTargetIndependent && isAuxIndependent)
				commonIndependencies++;
			else if(!isTargetIndependent && !isAuxIndependent)
				commonDependencies++;
		}
		
		return commonIndependencies + commonDependencies;
	}
        
        private static double confidence(KnowledgeSet target, String nodeX, String nodeY, String [] subset, double N){
		int x = target.getFieldValues(nodeX).size();
		int y = target.getFieldValues(nodeY).size();
		int s = 1;
		double T;
		double confidence;
		
		for(int i = 0; i < subset.length; ++i){ // remember case when s is empty
			s *= target.getFieldValues(subset[i]).size();
		}
		
		T = x * y * s;
		
		confidence = 1 - ((Math.log(N)/*/Math.log(2.0)*/) / (2 * N)) * T;
		
		if(confidence < 0 ) return 0.005;
		
		return confidence;
	}

}