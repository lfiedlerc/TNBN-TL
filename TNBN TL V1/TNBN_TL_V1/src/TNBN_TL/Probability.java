package TNBN_TL;

import TNBN_TL.Knowledge.FieldValuePair;
import TNBN_TL.Knowledge.KnowledgeSet;
import TNBN_TL.Knowledge.Record;
import java.util.ArrayList;

public class Probability{
    
        public static ValueProbability[] calculateProbabilityTable(KnowledgeSet k, RandomVariable v, boolean smoothing){
            int numValues = v.getValues().length;
            Object [] values = v.getValues();
            ValueProbability [] probabilityTable = new ValueProbability[numValues];
            int [] numerator = new int[numValues];
            ArrayList<Object> column = k.getColumn(v.getName());
            int denominator = column.size();
			
            for(int i = 0; i < denominator; ++i){
                for(int j = 0; j < numValues; ++j){
                    if(column.get(i).toString().equals(values[j].toString())){
                        numerator[j]++;
			break;
                    }
                }
            }
                        
            if(smoothing){
                denominator += numValues;
            }
			
            for(int i = 0; i < numValues; ++i){
                if(smoothing){
                    numerator[i]++;
                }
                probabilityTable[i] = new ValueProbability(values[i].toString(), (double)(numerator[i])/(double)denominator);
            }
            return probabilityTable;
        }
        
        public static ValueProbability[] calculateProbabilityTable(RandomVariable r, ValueProbability [][] cpt){
            ValueProbability [][] marginalized = marginalizeOver(r.getCopyOfParents(),r.getCopyOfParents(),cpt);
            ValueProbability [] table = new ValueProbability[cpt.length];
            
            for(int i = 0; i < table.length; ++i){
                table[i] = marginalized[i][0];
            }
            return table;
        }
    
        public static ValueProbability[][] calculateCPT(KnowledgeSet k, RandomVariable v, ArrayList<RandomVariable> parents, boolean smoothing){
            int size = parents.size();
            int numValues, numColumns, x;
            Object [] values;
            int numberOfFields = k.numberOfFields();
            int index, j;
            boolean cont;
            ValueProbability [][] cpt;
            int denominator;
            int [] conditioningIndexes;
            int [] valueIndexes;
            int [] numCondVals;
            ArrayList [] conditioningValues;
            Record r1; 
            Record r2;
            FieldValuePair [] conditioned;
            
            if(size > 0){
                numValues = v.getValues().length;
                numColumns = 1;
                x = k.getIndexOfField(v.getName());
                values = v.getValues();
                conditioningIndexes = new int[size];
                valueIndexes = new int[size];
                conditioningValues = new ArrayList[size];
                numCondVals = new int[size];
                r1 = new Record(numberOfFields);
                r2 = new Record(numberOfFields);

                index = 0;			
                for(RandomVariable parent : parents){
                    conditioningIndexes[index] = k.getIndexOfField(parent.getName());
                    conditioningValues[index] = k.getFieldValues(parent.getName());
                    numCondVals[index] = conditioningValues[index].size();
                    numColumns *= numCondVals[index];
                    index++;
                }

                cpt = new ValueProbability[numValues][numColumns];

                for(int i = 0; i < numberOfFields; ++i){
                    r1.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
                    r2.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
                }
                
                for(int i = 0; i < numColumns; ++i){
                    conditioned = new FieldValuePair[size];
                    j = 1;
                    cont = true;
                    while(j <= size && cont){
                        if(valueIndexes[size - j] >= numCondVals[size - j]){
                            valueIndexes[size - j] = 0;
                            valueIndexes[size - j - 1] += 1;
                            j++;
                        }else{
                            cont = false;
                        }
                    }

                    for(int l = 0; l < size; ++l){
                        conditioned[l] = new FieldValuePair(r1.getFieldAt(conditioningIndexes[l]),conditioningValues[l].get(valueIndexes[l]));
                        r1.setValueAt(conditioningIndexes[l],conditioningValues[l].get(valueIndexes[l]));
                        r2.setValueAt(conditioningIndexes[l],conditioningValues[l].get(valueIndexes[l]));
                    }
                                    
                    valueIndexes[size - 1] += 1;

                    denominator = k.getRecords(r1).size();

                    if(smoothing){
                        denominator += numValues; 
                    }
                    for(int l = 0; l < numValues; ++l){
                        r2.setValueAt(x,values[l]);
                        if(smoothing){
                            cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,(double)(k.getRecords(r2).size() + 1)/(double)denominator);
                        } else {
                            if(denominator > 0){
                                cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,(double)(k.getRecords(r2).size())/(double)denominator);
                            } else {
                                cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,0.0);
                            }
                        }
                    }
                }
                return cpt;
            }
            return null;
        }
    
        public static ValueProbability[][] marginalizeOver(ArrayList<RandomVariable> m, ArrayList<RandomVariable> conditioningSet, ValueProbability [][] cpt){
            int index;
            for(RandomVariable r : m){
                index = conditioningSet.indexOf(r);
                cpt = marginalizeOver(index,conditioningSet,cpt);
                conditioningSet.remove(index);
            }
            return cpt;
        }
	
	public static ValueProbability[][] marginalizeOver (int varIndex, ArrayList<RandomVariable> conditioningSet, ValueProbability [][] cpt){
		int numberOfValues = conditioningSet.get(varIndex).numberOfValues();
		ValueProbability [][] table = new ValueProbability[cpt.length][cpt[0].length / numberOfValues];
		double accum;
		int size = conditioningSet.size() - 1;
		FieldValuePair [] f = new FieldValuePair[size + 1];
		ArrayList<Object[]> conditioningSetValues = new ArrayList<>(size);
		int [] numVals = new int[size];
		int [] valueIndexes = new int[size];
		int limit = 1;
		boolean cont;
		int j, index = 0;
		
		for(int i = 0; i < size + 1; ++i){ 
			cpt[0][0].getConditioningSet();
			f[i] = new FieldValuePair(cpt[0][0].getConditioningSet()[i].getField(),null);
			if(i != varIndex){
				conditioningSetValues.add(index,conditioningSet.get(i).getValues());
				numVals[index] = conditioningSetValues.get(index).length;
				limit *= numVals[index];
				index++;
			}
		}
		
		for(int i = 0; i < limit; ++i){
			j = 1;
			cont = true;
			while(j <= size && cont){
				if(valueIndexes[size - j] >= numVals[size - j]){
					valueIndexes[size - j] = 0;
					valueIndexes[size - j - 1] += 1;
					j++;
				}else{
					cont = false;
				}
			}
			index = 0;
			for(int l = 0; l < size + 1; ++l){
				if(l != varIndex){
					f[l].setValue(conditioningSetValues.get(index)[valueIndexes[index]]);
					index++;
				}
			}
			
			for(int m = 0; m < table.length; ++m){
				accum = 0;
				for(int k = 0; k < numberOfValues; ++k){
					f[varIndex].setValue(conditioningSet.get(varIndex).getValues()[k]);
					accum += probabilityOf(cpt[m][0].getValue(), f, cpt) * conditioningSet.get(varIndex).getProbabilityDistribution().probabilityOf(f[varIndex].getValue().toString());
				}
				
				FieldValuePair [] newConditioningSet = new FieldValuePair[size];
				
				index = 0;
				for(int n = 0; n < size + 1; ++n){
					if(n != varIndex){
						newConditioningSet[index] = new FieldValuePair(cpt[0][0].getConditioningSet()[n].getField(),f[n].getValue());
						index++;
					}
				}
				if(size > 0){
					table[m][i] = new ValueProbability(cpt[m][0].getValue(),newConditioningSet,accum);
                                } else {
					table[m][i] = new ValueProbability(cpt[m][0].getValue(),accum);
                                }
			}
			if(size > 0){
				valueIndexes[size - 1] += 1;
                        }
		}
		return table;
	}
	
	public static double probabilityOf(String value, FieldValuePair [] conditioned, ValueProbability [][] cpt){
		int index = -1;
		FieldValuePair [] f;
		boolean isEqual, cont;
		int i, k;
		
		for(int m = 0; m < cpt.length; ++m){
                    
			if(cpt[m][0].getValue().equals(value)){
				index = m;
                                break;
                        }
		}
		
                //if(index > -1){
                    for(int j = 0; j < cpt[0].length; ++j){
                            f = cpt[index][j].getConditioningSet();

                            if(f.length != conditioned.length){
                                    //throw exception
                            }

                            i = 0;
                            isEqual = true;
                            while(isEqual && i < conditioned.length){
                                    k = 0;
                                    cont = true;
                                    while(cont && k < f.length){
                                            if(f[k].equals(conditioned[i]))
                                                    cont = false;
                                            k++;
                                    }
                                    if(cont)
                                            isEqual = false;
                                    i++;
                            }

                            if(isEqual)
                                    return cpt[index][j].getProbability();
                    }
                //}
		return 0.0;
	}
	
	public static double probabilityOf(String value, ValueProbability [] probabilityTable){
		for(int i = 0; i < probabilityTable.length; ++i){
			if(probabilityTable[i].getValue().equals(value))
				return probabilityTable[i].getProbability();
		}
		return 0.0;
	}
	
	public static void printCPT(String variableName, ValueProbability [][] cpt){
		if(cpt[0][0].getConditioningSet() != null){
			FieldValuePair [] f; 
			for(int i = 0; i < cpt.length; ++i){
				for(int j = 0; j < cpt[0].length; ++j){
					f = cpt[i][j].getConditioningSet();
					System.out.print("P(" + variableName + " = " + cpt[i][j].getValue() + " | ");
					for(int k = 0; k < f.length; ++k){
						System.out.print(f[k].getFieldName() + " = " + f[k].getValue().toString() + " ");
					}
					System.out.println(") = " + cpt[i][j].getProbability());
				}
			}
		} else {
			for(int i = 0; i < cpt.length; ++i){
				for(int j = 0; j < cpt[0].length; ++j){
					System.out.println("P(" + variableName + " = " + cpt[i][j].getValue() + ") = " + cpt[i][j].getProbability());
				}
			}
		}
	}
        
        public static void printProbTable(String variableName, ValueProbability [] table){
            for(int i = 0; i < table.length; ++i){
                System.out.println("P(" + variableName + " = " + table[i].getValue() + ") = " + table[i].getProbability());		
            }
        }
	
}