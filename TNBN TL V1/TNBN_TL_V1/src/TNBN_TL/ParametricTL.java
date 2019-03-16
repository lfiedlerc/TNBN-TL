package TNBN_TL;

import TNBN_TL.Knowledge.*;
import java.util.ArrayList;
import java.util.Arrays;

public class ParametricTL{
	/* Order of variables is important. All parents for aux variables must appear in the same order as they do for target variables */
	public static void instantNodeParametericLearning(ArrayList<RandomVariable> v, TNBN [] aux, double targetWeight){
		int option, index, numParents;
		ArrayList<RandomVariable> auxVars;
		ArrayList<Double> auxWeight = new ArrayList<>();
		ArrayList<ValueProbability[]> rootParameters = new ArrayList<>();
		ArrayList<ValueProbability[][]> childParameters = new ArrayList<>();
		ValueProbability[] probTable;
		ValueProbability[][] cpt;
		ProbabilityDistribution p;
                ArrayList<RandomVariable> parentalTNs;
                KnowledgeSet adapted;
		
		for(int i = 0; i < v.size(); ++i){
			if(!v.get(i).getType().equals("Temporal")){
				numParents = v.get(i).getParents().size();
				for(int j = 0; j < aux.length; ++j){				
					auxVars = aux[j].getNodes();
					index = auxVars.indexOf(v.get(i));
                                        if(index != -1){
                                            auxWeight.add(aux[j].getWeight());
                                            option = getCase(v.get(i).getParents(),auxVars.get(index).getParents());
                                            switch(option){
                                                    case 1: /* Parents are the same */
                                                            if(numParents == 0){ /* root node */
                                                                    rootParameters.add(auxVars.get(index).getProbabilityDistribution().getProbabilityTable());
                                                            } else {
                                                                parentalTNs = RandomVariable.getVarsOfType(v.get(i).getParents(), "Temporal");
                                                                if(!parentalTNs.isEmpty()){
                                                                    adapted = mapIntervalToInterval(parentalTNs,aux[j].getKnowledgeSet());
                                                                    ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVars.get(index), v.get(i).getParents(), true);
                                                                    childParameters.add(adaptedCPT);
                                                                } else {
                                                                    childParameters.add(auxVars.get(index).getProbabilityDistribution().getCPT());
                                                                }
                                                            }
                                                            break;
                                                    case 2: /* Aux model has more parents for variable v(i) */
                                                            if(numParents == 0){ /* root node */
                                                                    rootParameters.add(moreParentsRoot(v.get(i).getParents(), auxVars.get(index).getParents(), auxVars.get(index).getProbabilityDistribution().getCPT()));
                                                            } else {
                                                                parentalTNs = RandomVariable.getVarsOfType(v.get(i).getParents(), "Temporal");
                                                                if(!parentalTNs.isEmpty()){
                                                                    adapted = mapIntervalToInterval(parentalTNs,aux[j].getKnowledgeSet());
                                                                    ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVars.get(index), v.get(i).getParents(), true);
                                                                    childParameters.add(adaptedCPT);
                                                                } else {
                                                                    childParameters.add(moreParentsCPT(v.get(i).getParents(), auxVars.get(index).getParents(), auxVars.get(index).getProbabilityDistribution().getCPT()));
                                                                }
                                                            }
                                                            break;
                                                    case 3: /* Aux model has less parents for variable v(i) */
                                                            if(auxVars.get(index).getParents().isEmpty()){
                                                                lessParentsRoot(v.get(i).getParents(), auxVars.get(index).getProbabilityDistribution().getProbabilityTable());
                                                            } else {
                                                                ArrayList<RandomVariable> commonParents = RandomVariable.getIntersection(v.get(i).getParents(), auxVars.get(index).getParents());
                                                                parentalTNs = RandomVariable.getVarsOfType(commonParents, "Temporal");
                                                                if(!parentalTNs.isEmpty()){
                                                                    adapted = mapIntervalToInterval(parentalTNs, aux[j].getKnowledgeSet());
                                                                    ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVars.get(index), commonParents, true);
                                                                    childParameters.add(lessParentsCPT(v.get(i).getParents(), commonParents, adaptedCPT));
                                                                } else {
                                                                    childParameters.add(lessParentsCPT(v.get(i).getParents(), auxVars.get(index).getParents(), auxVars.get(index).getProbabilityDistribution().getCPT()));
                                                                }
                                                            }
                                                            break;
                                                    case 4: /* Combination of 3 and 4 */
                                                            ArrayList<RandomVariable> commonParents = RandomVariable.getIntersection(v.get(i).getParents(), auxVars.get(index).getParents());
                                                            parentalTNs = RandomVariable.getVarsOfType(commonParents, "Temporal");
                                                            if(!parentalTNs.isEmpty()){
                                                                adapted = mapIntervalToInterval(parentalTNs, aux[j].getKnowledgeSet());
                                                                ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVars.get(index), commonParents, true); /* this eliminates the need to marginalize over additional parents */
                                                                childParameters.add(lessParentsCPT(v.get(i).getParents(), commonParents, adaptedCPT));
                                                            } else {
                                                                childParameters.add(moreAndLessParentsCPT(v.get(i).getParents(), auxVars.get(index).getParents(), auxVars.get(index).getProbabilityDistribution().getCPT()));
                                                            }
                                                            break;
                                                    default:
                                                            System.out.println("No case was met for the parametric learning");
                                                            break;
                                            }
                                        }
				}
				p = v.get(i).getProbabilityDistribution();
				if(numParents == 0){ /* root node */
					probTable = transferParameters(rootParameters, auxWeight, p.getProbabilityTable(), targetWeight);
					p.setProbabilityTable(probTable);
					rootParameters.clear();
				} else {
                                    /* Parents must appear in the same order to combine */
					cpt = transferParameters(childParameters, auxWeight, p.getCPT(), targetWeight);
					p.setCPT(cpt);
                                        p.setProbabilityTable(Probability.calculateProbabilityTable(v.get(i), p.getCPT()));
					childParameters.clear();
				}
			}
		}
	}
        
        public static KnowledgeSet mapIntervalToInterval(ArrayList<RandomVariable> tns, KnowledgeSet aux){
            KnowledgeSet adapted = new KnowledgeSet(aux.getFieldsCopy()); 
            Record newRecord;
            ArrayList<Record> auxRecords = aux.getRecords();
            int [] temporalIndexes = new int[tns.size()];
            String fieldValue;
            Temporal t;
            double number;
            NormalDistribution d = new NormalDistribution();
            Temporal [] intervals;
            int j;
            boolean cont;
            
            int i = 0;
            for(RandomVariable tn : tns){
                temporalIndexes[i] = aux.getIndexOfField(tn.getName());
                adapted.setFieldValues(temporalIndexes[i],new ArrayList(Arrays.asList(tn.getValues())));
                i++;
            }
            
            for(Record r : auxRecords){
                newRecord = r.copy();
                for(i = 0; i < temporalIndexes.length; ++i){
                    if(temporalIndexes[i] != -1){
                        fieldValue = r.getValueOfFieldAt(temporalIndexes[i]).toString();
                        if(!fieldValue.equals("Default")){
                            intervals = (Temporal [])tns.get(i).getValues();
                            t = new Temporal(fieldValue,2);
                            d.setMean(t.getMean());
                            d.setStd(t.getStd());
                            number = d.generate(); 
                            while(number < t.getLowerBounds() || number > t.getUpperBounds()){
                                number = d.generate();
                            }
                            j = 0;
                            cont = true;
                            while(j < intervals.length && cont){
                                if(intervals[j].inRange(number)){
                                    newRecord.setValueAt(temporalIndexes[i], intervals[j].toString());
                                    cont = false;
                                }
                                j++;
                            }
                            if(cont){
                                newRecord.setValueAt(temporalIndexes[i], "Default"); 
                            }
                        }
                    }
                }
                adapted.addRecord(newRecord);
            }
            return adapted;
        }
        
        public static void temporalNodeParametricLearning(ArrayList<RandomVariable> tns, TNBN [] aux, double targetWeight, boolean smoothing){
            KnowledgeSet adapted;
            ArrayList<ValueProbability [][]> [] combineCPTs = new ArrayList[tns.size()];
            ArrayList<Double> auxWeight = new ArrayList<>();
            RandomVariable auxVar;
            int i, j;
            
            for(int k = 0; k < combineCPTs.length; ++k){
                combineCPTs[k] = new ArrayList<>();
            }
            
            i = 0;
            for(TNBN auxModel : aux){
                auxWeight.add(auxModel.getWeight());
                adapted = mapIntervalToInterval(tns,auxModel.getKnowledgeSet());
                j = 0;
                for(RandomVariable tn : tns){
                    auxVar = auxModel.getNode(tn.getName());
                    if(auxVar != null){
                        combineCPTs[j++].add(i,Probability.calculateCPT(adapted, tn, tn.getCopyOfParents(), smoothing));   
                    } else {
                        combineCPTs[j++].add(i,null);   
                    }
                }
                i++;
            }
            
            j = 0;
            for(RandomVariable tn : tns){
                if(tn.getParents().size() > 0){
                    tn.getProbabilityDistribution().setCPT(transferParameters(combineCPTs[j++], auxWeight, tn.getProbabilityDistribution().getCPT(), targetWeight));
                    tn.getProbabilityDistribution().setProbabilityTable(Probability.calculateProbabilityTable(tn, tn.getProbabilityDistribution().getCPT()));
                } else {
                    j++;
                }
            }
        }
        
        public static void temporalNodeParametricLearning(TemporalVariable tn, FieldValuePair [] conditioningSet, double normalizingFactor, boolean smoothing, KnowledgeSet k, ValueProbability[][] cpt, int column){
            Temporal [] values = (Temporal [])tn.getValues();
            double [] probabilities = new double[values.length];
            double totalProb = 0.0;
            double record;
            String value;
            
            for(int i = 0; i < k.size(); ++i){
                record = (double)k.getValueOfField(i, 0);
                for(int j = 0; j < values.length; ++j){
                    if(values[j].inRange(record)){
                        probabilities[j]++;
                        break;
                    }
                }
            }
            
            for(int i = 0; i < probabilities.length; ++i){
                if(smoothing){
                    probabilities[i]++;
                    probabilities[i] = (double)probabilities[i] / (double)(k.size() + values.length);
                } else {
                    probabilities[i]/= (double)k.size();
                }
                totalProb += probabilities[i];
            }
                   
            for(int i = 0; i < probabilities.length; ++i){
                value = values[i].toString();
                if(value.equals("Default")){
                    cpt[i][column] = new ValueProbability(value,conditioningSet,normalizingFactor);
                } else {
                    probabilities[i] = probabilities[i] / totalProb;
                    probabilities[i] *= (double)(1 - normalizingFactor);
                    cpt[i][column] = new ValueProbability(value,conditioningSet,probabilities[i]);
                }
            }
        }
        
        public static void temporalNodeParametricLearningApriori(TemporalVariable tn, double normalizingFactor, boolean smoothing, KnowledgeSet k, ValueProbability[] tbl){
            Temporal [] values = (Temporal [])tn.getValues();
            double [] probabilities = new double[values.length];
            double totalProb = 0.0;
            double record;
            String value;
            
            for(int i = 0; i < k.size(); ++i){
                record = (double)k.getValueOfField(i, 0);
                for(int j = 0; j < values.length; ++j){
                    if(values[j].inRange(record)){
                        probabilities[j]++;
                        break;
                    }
                }
            }
            
            for(int i = 0; i < probabilities.length; ++i){
                if(smoothing){
                    probabilities[i]++;
                    probabilities[i] = (double)probabilities[i] / (double)(k.size() + values.length);
                } else {
                    probabilities[i]/= (double)k.size();
                }
                totalProb += probabilities[i];
            }
                   
            for(int i = 0; i < probabilities.length; ++i){
                value = values[i].toString();
                if(value.equals("Default")){
                    tbl[i] = new ValueProbability(value,normalizingFactor);
                } else {
                    probabilities[i] = probabilities[i] / totalProb;
                    probabilities[i] *= (double)(1 - normalizingFactor);
                    tbl[i] = new ValueProbability(value,probabilities[i]);
                }
            }
        }
	
	private static int getCase(ArrayList<RandomVariable> v1, ArrayList<RandomVariable> v2){
		int size1 = v1.size();
		int size2 = v2.size();
		boolean cont;
		int i;
		
		if(size1 == size2){
			cont = true;
			i = 0;
			while(cont && i < size1){
				if(v2.indexOf(v1.get(i)) == -1){
					cont = false;
                                }
				i++;
			}
			if(cont){
                            return 1; /* v1 and v2 have the same parents */
                        } else {
                            return 4; /* combination of 2 and 3 */
                        }
		}
		if(size1 < size2){
			cont = true;
			i = 0;
			while(cont && i < size1){
				if(v2.indexOf(v1.get(i)) == -1){
					cont = false;
                                }
				i++;
			}
			if(cont){
                            return 2; /* v2 has additional parents than the parents v1 has */
                        } else { 
                            return 4; /* combination of 2 and 3 */
                        }
		} 
		if(size1 > size2){
			cont = true;
			i = 0;
			while(cont && i < size2){
				if(v1.indexOf(v2.get(i)) == -1){
					cont = false;
                                }
				i++;
			}
			if(cont){ 
                            return 3; /* v2 has less parents than the parents v1 has */
                        } else { 
                            return 4; /* combination of 2 and 3 */
                        }
		}
		return 0;
	}
	
	private static ValueProbability[][] moreParentsCPT(ArrayList<RandomVariable> v1, ArrayList<RandomVariable> v2, ValueProbability [][] originalCpt){
		ArrayList<Integer> marginalize = new ArrayList<>();
		ArrayList<RandomVariable> v2Copy = new ArrayList<>();
		int size2 = v2.size();
		ValueProbability [][] cpt = originalCpt;
		int size;
		
		for(int i = 0; i < size2; ++i){
			v2Copy.add(v2.get(i));
                }
	
		for(int i = 0; i < size2; ++i){
			if(v1.indexOf(v2Copy.get(i)) == -1){
				marginalize.add(i);
                        }
		}
		size = marginalize.size();
		
		int i = 0;
		while(i < size){
			cpt = Probability.marginalizeOver (marginalize.get(i) - i, v2Copy, cpt);
			v2Copy.remove(marginalize.get(i) - i);
			i++;
		}
		return cpt;
	}
	
	private static ValueProbability[] moreParentsRoot(ArrayList<RandomVariable> v1, ArrayList<RandomVariable> v2, ValueProbability [][] originalCpt){
		ArrayList<Integer> marginalize = new ArrayList<>();
		ArrayList<RandomVariable> v2Copy = new ArrayList<>();
		int size2 = v2.size();
		ValueProbability [][] cpt = originalCpt;
		ValueProbability [] table = new ValueProbability[cpt.length];
		int size;
		
		for(int i = 0; i < size2; ++i){
			v2Copy.add(v2.get(i));
                }
		
		for(int i = 0; i < size2; ++i){
			if(v1.indexOf(v2Copy.get(i)) == -1){
				marginalize.add(i);
                        }
		}
		size = marginalize.size();
		int i = 0;
		while(i < size){
			cpt = Probability.marginalizeOver (marginalize.get(i) - i, v2Copy, cpt);
			v2Copy.remove(marginalize.get(i) - i);
			i++;
		}
		for(int j = 0; j < table.length; ++j){
			table[j] = cpt[j][0];
		}
		return table;
	}
        
        private static ValueProbability[][] lessParentsRoot(ArrayList<RandomVariable> v1, ValueProbability [] originalProbTable){
		ValueProbability [][] cpt;
		double prob;
		ArrayList<RandomVariable> additionalVars = new ArrayList<>();
		boolean contExtra;
		int n;
		int commonValComb = 1;
		int numValComb = 1;
		int size1 = v1.size();
		int additionalSize;
		ArrayList<Object[]> conditioningExtra;
		int [] numVarValsExtra;
		int [] valueIndexesExtra;
		String type;
		int colIndex = 0;
		int index2;
		
		for(int i = 0; i < size1; ++i){
                    additionalVars.add(v1.get(i));
		}
		
		additionalSize = additionalVars.size();
		conditioningExtra = new ArrayList<>(additionalSize);
		numVarValsExtra = new int[additionalSize];
		
		for(int i = 0; i < additionalSize; ++i){
			conditioningExtra.add(additionalVars.get(i).getValues());
			numVarValsExtra[i] = conditioningExtra.get(i).length;
			numValComb *= numVarValsExtra[i];
		}

		cpt = new ValueProbability[originalProbTable.length][numValComb * commonValComb];
		
		for(int i = 0; i < commonValComb; ++i){
			valueIndexesExtra = new int[additionalSize];	
			for(int m = 0; m < numValComb; ++m){
				n = 1;
				contExtra = true;
				while(n <= additionalSize && contExtra){
					if(valueIndexesExtra[additionalSize - n] >= numVarValsExtra[additionalSize - n]){
						valueIndexesExtra[additionalSize - n] = 0;
						valueIndexesExtra[additionalSize - n - 1] += 1;
						n++;
					}else{
						contExtra = false;
					}
				}
					
				FieldValuePair [] conditioningSet = new FieldValuePair[size1];
				for(int l = 0; l < size1; ++l){
                                    index2 = l;
		
                                    type = additionalVars.get(index2).getType();
                                    if(type.equals("String")){
					conditioningSet[l] = new FieldValuePair(new StringField(additionalVars.get(index2).getName(),new ArrayList<String>(Arrays.asList((String [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                    } else if(type.equals("Integer")){
					conditioningSet[l] = new FieldValuePair(new IntegerField(additionalVars.get(index2).getName(),new ArrayList<Integer>(Arrays.asList((Integer [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                    } else if(type.equals("Double")){
					conditioningSet[l] = new FieldValuePair(new DoubleField(additionalVars.get(index2).getName(),new ArrayList<Double>(Arrays.asList((Double [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                    } else if(type.equals("Boolean")){
					conditioningSet[l] = new FieldValuePair(new BooleanField(additionalVars.get(index2).getName(),new ArrayList<Boolean>(Arrays.asList((Boolean [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                    } else if(type.equals("Temporal")){
					conditioningSet[l] = new FieldValuePair(new TemporalField(additionalVars.get(index2).getName(),new ArrayList<Temporal>(Arrays.asList((Temporal [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                    }
                                }
				
				for(int k = 0; k < originalProbTable.length; ++k){
					prob = Probability.probabilityOf(originalProbTable[k].getValue(), originalProbTable);
					cpt[k][colIndex] = new ValueProbability(originalProbTable[k].getValue(),conditioningSet,prob);
				}
				colIndex++;
				valueIndexesExtra[additionalSize - 1] += 1;
			}
		}
		return cpt;
	}
	
	private static ValueProbability[][] lessParentsCPT(ArrayList<RandomVariable> v1, ArrayList<RandomVariable> v2, ValueProbability [][] originalCpt){
		ValueProbability [][] cpt;
		double prob;
		ArrayList<RandomVariable> additionalVars = new ArrayList<>();
		boolean contCommon, contExtra;
		int j, n;
		int commonValComb = 1;
		int size2 = v2.size();
		ArrayList<Object[]> conditioningCommon = new ArrayList<>(size2);
		int [] numVarValsCommon = new int[size2];
		int [] valueIndexesCommon = new int[size2];
		FieldValuePair [] f = new FieldValuePair[size2];
		int numValComb = 1;
		int size1 = v1.size();
		int additionalSize;
		ArrayList<Object[]> conditioningExtra;
		int [] numVarValsExtra;
		int [] valueIndexesExtra;
		String type;
		int index;
		int colIndex = 0;
		int index2;
		
		for(int i = 0; i < size1; ++i){
			if(v2.indexOf(v1.get(i)) == -1){
				additionalVars.add(v1.get(i));
                        }
		}
		
		additionalSize = additionalVars.size();
		conditioningExtra = new ArrayList<>(additionalSize);
		numVarValsExtra = new int[additionalSize];
		
		for(int i = 0; i < additionalSize; ++i){
			conditioningExtra.add(additionalVars.get(i).getValues());
			numVarValsExtra[i] = conditioningExtra.get(i).length;
			numValComb *= numVarValsExtra[i];
		}
		
		for(int i = 0; i < size2; ++i){
			f[i] = new FieldValuePair(originalCpt[0][0].getConditioningSet()[i].getField(),null);
			conditioningCommon.add(v2.get(i).getValues());
			numVarValsCommon[i] = conditioningCommon.get(i).length;
			commonValComb *= numVarValsCommon[i];
		}

		cpt = new ValueProbability[originalCpt.length][numValComb * commonValComb];
		
		for(int i = 0; i < commonValComb; ++i){
			valueIndexesExtra = new int[additionalSize];
			j = 1;
			contCommon = true;
			while(j <= size2 && contCommon){
				if(valueIndexesCommon[size2 - j] >= numVarValsCommon[size2 - j]){
					valueIndexesCommon[size2 - j] = 0;
					valueIndexesCommon[size2 - j - 1] += 1;
					j++;
				}else{
					contCommon = false;
				}
			}
			
			for(int l = 0; l < size2; ++l){
				f[l].setValue(conditioningCommon.get(l)[valueIndexesCommon[l]]);
			}
				
			for(int m = 0; m < numValComb; ++m){
				n = 1;
				contExtra = true;
				while(n <= additionalSize && contExtra){
					if(valueIndexesExtra[additionalSize - n] >= numVarValsExtra[additionalSize - n]){
						valueIndexesExtra[additionalSize - n] = 0;
						valueIndexesExtra[additionalSize - n - 1] += 1;
						n++;
					}else{
						contExtra = false;
					}
				}
					
				FieldValuePair [] conditioningSet = new FieldValuePair[size1];
				index = 0;
				for(int l = 0; l < size1; ++l){
					if(l < size2){
						conditioningSet[l] = new FieldValuePair(f[l].getField(),f[l].getValue());
						index = l;
					}else{ 
						if(size2 > 0){
							index2 = l - (index + 1);
                                                } else {
							index2 = l;
                                                }
		
						type = additionalVars.get(index2).getType();
                                                switch (type) {
                                                    case "String":
                                                        conditioningSet[l] = new FieldValuePair(new StringField(additionalVars.get(index2).getName(),new ArrayList<String>(Arrays.asList((String [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                                        break;
                                                    case "Integer":
                                                        conditioningSet[l] = new FieldValuePair(new IntegerField(additionalVars.get(index2).getName(),new ArrayList<Integer>(Arrays.asList((Integer [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                                        break;
                                                    case "Double":
                                                        conditioningSet[l] = new FieldValuePair(new DoubleField(additionalVars.get(index2).getName(),new ArrayList<Double>(Arrays.asList((Double [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                                        break;
                                                    case "Boolean":
                                                        conditioningSet[l] = new FieldValuePair(new BooleanField(additionalVars.get(index2).getName(),new ArrayList<Boolean>(Arrays.asList((Boolean [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                                        break;
                                                    case "Temporal":
                                                        conditioningSet[l] = new FieldValuePair(new TemporalField(additionalVars.get(index2).getName(),new ArrayList<Temporal>(Arrays.asList((Temporal [])additionalVars.get(index2).getValues()))),conditioningExtra.get(index2)[valueIndexesExtra[index2]]);
                                                        break;
                                                }
                                        }
				}
				
				for(int k = 0; k < originalCpt.length; ++k){
					prob = Probability.probabilityOf(originalCpt[k][0].getValue(), f, originalCpt);
					cpt[k][colIndex] = new ValueProbability(originalCpt[k][0].getValue(),conditioningSet,prob);
				}
				colIndex++;
				valueIndexesExtra[additionalSize - 1] += 1;
			}
			if(size2 > 0){
				valueIndexesCommon[size2 - 1] += 1;
                        }
		}
		return cpt;
	}
	
	private static ValueProbability[][] moreAndLessParentsCPT(ArrayList<RandomVariable> v1, ArrayList<RandomVariable> v2, ValueProbability [][] originalCpt){
		ArrayList<RandomVariable> newParents = new ArrayList<>();
		ValueProbability [][] cpt = moreParentsCPT(v1, v2, originalCpt);
		
		for(int i = 0; i < v2.size(); ++i){
			if(v1.indexOf(v2.get(i)) > -1){
				newParents.add(v2.get(i));
                        }
		}
		return lessParentsCPT(v1,newParents,cpt);
	}
	
	private static ValueProbability[][] transferParameters(ArrayList<ValueProbability[][]> aux, ArrayList<Double> auxWeight, ValueProbability[][] target, double targetWeight){
		int rows = target.length;
		int cols = target[0].length;
		ValueProbability [][] newCPT = new ValueProbability[rows][cols];
		FieldValuePair [] f;
		String value;
		double prob;
		double k;
		
		for(int i = 0; i < rows; ++i){
			for(int j = 0; j < cols; ++j){
				f = target[i][j].getConditioningSet();
				value = target[i][j].getValue();
				prob = 0;
				for(int l = 0; l < aux.size(); ++l){
                                    if(aux.get(l) != null){
					prob += auxWeight.get(l) * Probability.probabilityOf(value,f,aux.get(l));
                                    }
				}
				prob += targetWeight * Probability.probabilityOf(value,f,target);
				newCPT[i][j] = new ValueProbability(value,f,prob);
			}
		}
		
		for(int i = 0; i < cols; ++i){
			k = 0;
			for(int j = 0; j < rows; ++j){
				k += newCPT[j][i].getProbability();
			}
			for(int j = 0; j < rows; ++j){
				newCPT[j][i].setProbability((double)newCPT[j][i].getProbability()/(double)k);
			}
		}
		
		return newCPT;
	}
	
	private static ValueProbability[] transferParameters(ArrayList<ValueProbability[]> aux, ArrayList<Double> auxWeight, ValueProbability [] target, double targetWeight){
		int rows = target.length;
		ValueProbability [] newTable = new ValueProbability[rows];
		String value;
		double prob;
		double k;
		
		for(int i = 0; i < rows; ++i){
			value = target[i].getValue();
			prob = 0;
			for(int l = 0; l < aux.size(); ++l){
                            if(aux.get(l) != null){
				prob += auxWeight.get(l) * Probability.probabilityOf(value,aux.get(l));
                            }
			}
			prob += targetWeight * Probability.probabilityOf(value,target);
				
			newTable[i] = new ValueProbability(value,prob);
		}
		
		k = 0;
		for(int j = 0; j < rows; ++j){
			k += newTable[j].getProbability();
		}
		for(int j = 0; j < rows; ++j){
			newTable[j].setProbability((double)newTable[j].getProbability()/(double)k);
		}
		
		return newTable;
	}
}