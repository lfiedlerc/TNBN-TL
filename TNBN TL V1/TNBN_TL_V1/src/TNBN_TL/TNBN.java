package TNBN_TL;

import TNBN_TL.Knowledge.*;
import elvira.Node;
import elvira.NodeList;
import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class TNBN{
	private boolean [][] graph;
	private KnowledgeSet k;
	private ArrayList<RandomVariable> nodes;
	private double weight;
        
        public TNBN(){}
	
	public TNBN(KnowledgeSet k, boolean [][] graph, ArrayList<RandomVariable> nodes){
		this.k = k;
		this.graph = graph;
		this.nodes = nodes;
	}
	
	public TNBN(KnowledgeSet k, ArrayList<RandomVariable> nodes){
		this.k = k;
		this.nodes = nodes;
		this.graph = null;
	}
	
	public TNBN(boolean [][] graph, ArrayList<RandomVariable> nodes){
		this.graph = graph;
		this.nodes = nodes;
		this.k = null;
	}
	
	public TNBN(KnowledgeSet k){
		this.k = k;
		this.graph = null;
		this.nodes = null;
	}
	
	public TNBN(ArrayList<RandomVariable> nodes){
		this.nodes = nodes;
		this.k = null;
		this.graph = null;
	}
	
	public boolean[][] getGraph(){
		return graph;
	}
	
	public KnowledgeSet getKnowledgeSet(){
		return k;
	}
	
	public ArrayList<RandomVariable> getNodes(){
		return nodes;
	}
        
        public ArrayList<TemporalVariable> getTemporalNodes(){
            ArrayList<TemporalVariable> tn = new ArrayList<>();
            
            for(RandomVariable r : nodes){
                if(r.getType().equals("Temporal")){
                    tn.add((TemporalVariable)r);
                }
            }
            return tn;
        }
	
	public void setGraph(boolean [][] graph){
		this.graph = graph;
	}
	
	public void setKnowledgeSet(KnowledgeSet k){
		this.k = k;
	}
	
	public void setNodes(ArrayList<RandomVariable> nodes){
		this.nodes = nodes;
	}
	
	public double getWeight(){
		return weight;
	}
	
	public void setWeight(double weight){
		this.weight = weight;
	}
        
        public ArrayList<RandomVariable> getChildrenOf(RandomVariable r){
            ArrayList<RandomVariable> children = new ArrayList<>();
            int index = nodes.indexOf(r);
            
            for(int i = 0; i < graph.length; ++i){
                if(graph[index][i]){
                    children.add(nodes.get(i));
                }
            } 
            return children;
        }
        
        public boolean contains(RandomVariable r){
            for(RandomVariable v : nodes){
                if(v.getName().equals(r.getName())){
                    return true;
                }
            }
            return false;
        }
        
        public ArrayList<String> getListOfVariables(){
            ArrayList<String> vars = new ArrayList<>();
            
            for(RandomVariable r : nodes){
                vars.add(r.getName());
            }
            return vars;
        }
        
        public boolean contains(String var){
            for(RandomVariable v : nodes){
                if(v.getName().equals(var)){
                    return true;
                }
            }
            return false;
        }
        
        public RandomVariable getNode(String name){
            for(RandomVariable v : nodes){
                if(v.getName().equals(name)){
                    return v;
                }
            }
            return null;
        }
        
        public RandomVariable getNode(int i){
            return nodes.get(i);
        }
	
	public void calculateProbabilityTables(boolean smoothing){
		ProbabilityDistribution p;
		ValueProbability [] probabilityTable;
                
		for(RandomVariable v : nodes){
			p = v.getProbabilityDistribution();
			probabilityTable = Probability.calculateProbabilityTable(k,v,smoothing);
			p.setProbabilityTable(probabilityTable);
		}
	}
        
        public void calculateProbabilityTables(KnowledgeSet k, boolean smoothing){
		ProbabilityDistribution p;
		ValueProbability [] probabilityTable;
                
		for(RandomVariable v : nodes){
			p = v.getProbabilityDistribution();
			probabilityTable = Probability.calculateProbabilityTable(k,v,smoothing);
			p.setProbabilityTable(probabilityTable);
		}
	}
	
	public void calculateCPTs(boolean smoothing){
		Object [] values;
		int numValues;
		int numColumns;
		int numberOfFields = k.numberOfFields();
		int size = nodes.size() - 1;
		int x;
		int index, j;
		boolean cont;
		ProbabilityDistribution p;
		ValueProbability [][] cpt;
		int denominator;
		int [] conditioningIndexes;
		int [] valueIndexes;
		int [] numCondVals;
		ArrayList [] conditioningValues;
		Record r1; 
		Record r2;
		FieldValuePair [] conditioned;
		
		for(RandomVariable v : nodes){
			p = v.getProbabilityDistribution();
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
			for(RandomVariable cond : nodes){
				if(cond != v){
					conditioningIndexes[index] = k.getIndexOfField(cond.getName());
					conditioningValues[index] = k.getFieldValues(cond.getName());
					numCondVals[index] = conditioningValues[index].size();
					numColumns *= numCondVals[index];
					index++;
				}
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
                                        
                                if(smoothing)
                                    denominator += numValues; 
                               
				for(int l = 0; l < numValues; ++l){
					r2.setValueAt(x,values[l]);
                                        if(smoothing)
                                            cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,(double)(k.getRecords(r2).size() + 1)/(double)denominator);
                                        else 
                                            cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,(double)(k.getRecords(r2).size())/(double)denominator);
				}
			}
                        
			p.setCPT(cpt);
		}
	}
        
        public void calculateCPTs(KnowledgeSet k, boolean smoothing){
		Object [] values;
		int numValues;
		int numColumns;
		int numberOfFields = k.numberOfFields();
		int size = nodes.size() - 1;
		int x;
		int index, j;
		boolean cont;
		ProbabilityDistribution p;
		ValueProbability [][] cpt;
		int denominator;
		int [] conditioningIndexes;
		int [] valueIndexes;
		int [] numCondVals;
		ArrayList [] conditioningValues;
		Record r1; 
		Record r2;
		FieldValuePair [] conditioned;
		
		for(RandomVariable v : nodes){
			p = v.getProbabilityDistribution();
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
			for(RandomVariable cond : nodes){
				if(cond != v){
					conditioningIndexes[index] = k.getIndexOfField(cond.getName());
					conditioningValues[index] = k.getFieldValues(cond.getName());
					numCondVals[index] = conditioningValues[index].size();
					numColumns *= numCondVals[index];
					index++;
				}
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
                                        
                                if(smoothing)
                                    denominator += numValues; 
                               
				for(int l = 0; l < numValues; ++l){
					r2.setValueAt(x,values[l]);
                                        if(smoothing)
                                            cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,(double)(k.getRecords(r2).size() + 1)/(double)denominator);
                                        else 
                                            cpt[l][i] = new ValueProbability(values[l].toString(),conditioned,(double)(k.getRecords(r2).size())/(double)denominator);
				}
			}
                        Probability.printCPT(v.getName(), cpt);
			p.setCPT(cpt);
		}
	}
	
        public void calculateCPTsGivenParents(boolean smoothing){
		ArrayList<RandomVariable> parents;	
		ProbabilityDistribution p;
		ValueProbability [][] cpt;
                
		for(RandomVariable v : nodes){
			parents = v.getParents();
			p = v.getProbabilityDistribution();
                        cpt = Probability.calculateCPT(k, v, parents, smoothing);    
                        p.setCPT(cpt);
                }
	}
        
        public void calculateCPTsGivenParents(KnowledgeSet k, boolean smoothing){
		ArrayList<RandomVariable> parents;	
		ProbabilityDistribution p;
		ValueProbability [][] cpt;
		for(RandomVariable v : nodes){
			parents = v.getParents();
			p = v.getProbabilityDistribution();
                        cpt = Probability.calculateCPT(k, v, parents, smoothing);    
                        p.setCPT(cpt);
                }
	}
        
	
	public ValueProbability[] getProbabilityOfNode(String node){
		for(int i = 0; i < nodes.size(); ++i){
			if(nodes.get(i).getName().equals(node))
				return nodes.get(i).getProbabilityDistribution().getProbabilityTable();
		}
		return null;
	}
	
	public double getProbabilityOfNode(String node, String value){
		for(int i = 0; i < nodes.size(); ++i){
			if(nodes.get(i).getName().equals(node))
				return nodes.get(i).getProbabilityDistribution().probabilityOf(value);
		}
		return 0;
	}
	
	public double getProbabilityOfNode(String node, String value, FieldValuePair [] conditioned){
		for(int i = 0; i < nodes.size(); ++i){
			if(nodes.get(i).getName().equals(node))
				return nodes.get(i).getProbabilityDistribution().probabilityOf(value,conditioned);
		}
		return 0;
	}
	
	public ValueProbability[][] getCPTOfNode(String node){
		for(int i = 0; i < nodes.size(); ++i){
			if(nodes.get(i).getName().equals(node))
				return nodes.get(i).getProbabilityDistribution().getCPT();
		}
		return null;
	}
	
	public ValueProbability[] getCPTRowOfNode(String node, String value){
		for(int i = 0; i < nodes.size(); ++i){
			if(nodes.get(i).getName().equals(node))
				return nodes.get(i).getProbabilityDistribution().getCPTRow(value);
		}
		return null;
	}
	
	public ValueProbability[] getCPTColOfNode(String node, FieldValuePair [] conditioned){
		for(int i = 0; i < nodes.size(); ++i){
			if(nodes.get(i).getName().equals(node))
				return nodes.get(i).getProbabilityDistribution().getCPTCol(conditioned);
		}
		return null;
	}
	
	public void printProbabilities(){
		for(RandomVariable v : nodes){
			v.getProbabilityDistribution().printProbTable();
			System.out.println();
			v.getProbabilityDistribution().printCPT();
			System.out.println();
		}
	}
        
        public void printStructure(){
            ArrayList<RandomVariable> parents;
            for(RandomVariable v : nodes){
                parents = v.getParents();
                for(RandomVariable p : parents){
                    System.out.println(p.getName() + " - > " + v.getName());
                }
            }
        }
	
	public void makeElviraNet(String fileName){
		try{
			StringTokenizer tok;
			String name;
			BufferedWriter out = new BufferedWriter(new FileWriter(fileName));
			
			out.write("// Bayesian Network ");
			out.newLine();
			out.write("//   Elvira format ");
			out.newLine();
			out.newLine();
			out.write("bnet \"");
			out.write("Network");
			out.write("\" {");
			out.newLine();
			out.newLine();
			out.write("// Network Properties");
			out.newLine();
			out.newLine();
			out.write("kindofgraph = \"directed\";");
			out.newLine();
			out.write("visualprecision = \"0.00\";");
			out.newLine();
			out.write("version = 1.0;");
			out.newLine();
			out.write("default node states = (present , absent);");
			out.newLine();
			out.newLine();
			out.write("// Variables");
			out.newLine();
			out.newLine();
			
			int numValues;
			ArrayList<RandomVariable> parents;
			int numParents;
			ProbabilityDistribution p;
			ValueProbability [][] cpt;
			
			for(RandomVariable v : nodes){
				numValues = v.numberOfValues();
				tok = new StringTokenizer(v.getName());
				name = "";
				while(tok.hasMoreTokens()){
					name += tok.nextToken();
					if(tok.hasMoreTokens())
						name += "_";
				}
				out.write("node " + name + "(finite-states) {");
				out.newLine();
				out.write("title = \"" + v.getName() + "\";");
				out.newLine();
				out.write("kind-of-node = chance;");
				out.newLine();
				out.write("type-of-variable = finite-states;");
				out.newLine();
				out.write("pos_x =397;");
				out.newLine();
				out.write("pos_y =94;");
				out.newLine();
				out.write("relevance = 7.0;");
				out.newLine();
				out.write("purpose = \"\";");
				out.newLine();
				out.write("num-states = " + numValues + ";");
				out.newLine();
				out.write("states = (");
				for(int i = numValues - 1; i >= 0; --i){
					out.write("\"" + v.getValueAt(i) + "\"");
					if(i > 0)
						out.write(" ");
				}
				out.write(");");
				out.newLine();
				out.write("}");
				out.newLine();
				out.newLine();
			}
			
			out.write("// Links of the associated graph:");
			out.newLine();
			out.newLine();
			
			for(int i = 0; i < graph.length; ++i){
				for(int j = 0; j < graph[0].length; ++j){
					if(graph[i][j]){
						tok = new StringTokenizer(nodes.get(i).getName());
						name = "";
						while(tok.hasMoreTokens()){
							name += tok.nextToken();
							if(tok.hasMoreTokens())
								name += "_";
						}
						out.write("link " + name + " ");
						
						tok = new StringTokenizer(nodes.get(j).getName());
						name = "";
						while(tok.hasMoreTokens()){
							name += tok.nextToken();
							if(tok.hasMoreTokens())
								name += "_";
						}
						out.write(name + ";");
						out.newLine();
						out.newLine();
					}
				}
			}
			
			out.write("//Network Relationships:");
			out.newLine();
			out.newLine();
			
			for(RandomVariable v : nodes){
				parents = v.getParents();
				numParents = parents.size();
				p = v.getProbabilityDistribution();
				if(numParents == 0){
					numValues = v.numberOfValues();
					tok = new StringTokenizer(v.getName());
					name = "";
					while(tok.hasMoreTokens()){
						name += tok.nextToken();
						if(tok.hasMoreTokens())
							name += "_";
					}
					out.write("relation " + name + " {");
					out.newLine();
					out.write("comment = \"\";");
					out.newLine();
					out.write("kind-of-relation = potential;");
					out.newLine();
					out.write("deterministic=false;");
					out.newLine();
					out.write("values= table (");
					
					for(int i = numValues - 1; i >= 0; --i)
						out.write(p.probabilityOf(v.getValueAt(i).toString()) + " ");
						
					out.write(");");
					out.newLine();
					out.write("}");
					out.newLine();
					out.newLine();
				} else {
					tok = new StringTokenizer(v.getName());
					name = "";
					while(tok.hasMoreTokens()){
						name += tok.nextToken();
						if(tok.hasMoreTokens())
							name += "_";
					}
					out.write("relation " + name + " ");
					
					for(int i = 0; i < numParents; ++i){
						tok = new StringTokenizer(parents.get(i).getName());
						name = "";
						while(tok.hasMoreTokens()){
							name += tok.nextToken();
							if(tok.hasMoreTokens())
								name += "_";
						}
						out.write(name + " ");
					}
						
					out.write(" {");
					out.newLine();
					out.write("comment = \"\";");
					out.newLine();
					out.write("kind-of-relation = potential;");
					out.newLine();
					out.write("deterministic=false;");
					out.newLine();
					out.write("values= table (");	
					
					cpt = p.getCPT();
					for(int i = cpt.length - 1; i >= 0; --i){
						for(int j = cpt[0].length - 1; j >= 0; --j){
							out.write(cpt[i][j].getProbability() + " ");
						}
					}
					out.write(");");
					out.newLine();
					out.write("}");
					out.newLine();
					out.newLine();
				}
			}
			out.write("}");
			out.newLine();
			
			out.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}