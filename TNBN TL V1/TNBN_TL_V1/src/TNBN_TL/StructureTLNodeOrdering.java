package TNBN_TL;

import TNBN_TL.Knowledge.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

/* Structure learning is NOT dependent on order, but will have a runtime error if an aux domain does not have all the variables the target domain has */

public class StructureTLNodeOrdering{
	public static int numTests;
	public static boolean[][] PC_TL(ArrayList<String> [] parents, KnowledgeSet target, KnowledgeSet [] aux, double threshold){
                numTests = 0;
		String [] variables = target.getFieldNames();
		int numVariables = variables.length;
		boolean [][] g = new boolean[numVariables][numVariables];
		ArrayList<Object []> subsets;
		int i, s, m;
		boolean cont, dependent;
		String [] values;
		String [] subset;
		double combinedIndependence;
		int numAdj;
		int parentListIndex;
		ArrayList<Integer> cycle;
                ArrayList<Seperator> aSep = new ArrayList<>();
                int sepIndex;
		
		Graph.inicializeCompleteUndirectedGraph(g);
		for(int x = 0; x < numVariables; x++){
			for(int y = 0; y < numVariables; ++y){ 
				if(g[x][y]){
					if(!parents[x].contains(variables[y]) && !parents[y].contains(variables[x])){
						g[x][y] = false;
						g[y][x] = false;
					}
				}
			}
		}
		
		i = 0;
		
		cont = true;
		while(cont){ // insert actual condition
			for(int x = 0; x < numVariables; x++){
				for(int y = 0; y < numVariables; ++y){ 
					if(g[x][y]){
						values = Graph.getAdjacenciesExclude(variables,x,y,g);
						subsets = Combinations.getSets(values,0,values.length,0,i);
						dependent = true;
						s = 0;
						while(s < subsets.size() && dependent){
							subset = Arrays.copyOf(subsets.get(s), subsets.get(s).length, String[].class);
							
							combinedIndependence = combineIndependence(x, y, subset, target, aux, variables);
                                                        numTests++;
							//System.out.println("Combined independence " + x + " " + y + ": " + combinedIndependence);
							if(combinedIndependence <= threshold){// one meets independence remove arc and break
								g[x][y] = false;
								g[y][x] = false;
                                                            if(noRootTN(g,variables,target)){
								dependent = false;
                                                                sepIndex = indexOfSeperator(aSep, x, y);
                                                                if(sepIndex > -1){
                                                                    for(int j = 0; j < subset.length; ++j){
                                                                        parentListIndex = getIndexOfNode(variables,subset[j]);
                                                                        aSep.get(sepIndex).addSeperator(parentListIndex);
                                                                    }
								} else {
                                                                    aSep.add(new Seperator(x,y));
                                                                    for(int j = 0; j < subset.length; ++j){
                                                                        parentListIndex = getIndexOfNode(variables,subset[j]);
                                                                        aSep.get(aSep.size()-1).addSeperator(parentListIndex);
                                                                    }
                                                                }
                                                            } else {
                                                                g[x][y] = true;
								g[y][x] = true;
                                                            }
							}
							s++;
						}
					}
				}
			}
			i++;
			System.out.println("i is " + i);
			m = 0;
			cont = false;
			while(m < numVariables && !cont){
				numAdj = 0;
				for(int n = 0; n < numVariables; ++n){
					if(g[m][n]) 
						numAdj++;
				}
				if(numAdj > i)
					cont = true;
				m++;
			}
                        if(i > 2){
                            cont = false;
                        }
		}
		
		int removeA = 0, removeB = 0;
		String [] empty = {};
		double CI = Double.MAX_VALUE;
                double calculatedValue;
		for(int x = 0; x < numVariables; x++){
			for(int y = 0; y < numVariables; ++y){ 
				if(g[x][y]){
					if(!parents[x].contains(variables[y]) && parents[y].contains(variables[x])){
						g[y][x] = false;
						while(Graph.cycleExists(x,g)){
							cycle = Graph.getCycle(y,g);
							for(int j = 0; j < cycle.size() - 1; ++j){
								//remove edge with lowest combined independence
                                                                calculatedValue = combineIndependence(j, j + 1, empty, target, aux, variables);
								if(calculatedValue < CI){
                                                                    CI = calculatedValue;
                                                                    removeA = j;
                                                                    removeB = j + 1;
                                                                }
							}
                                                        g[removeA][removeB] = false;
						}
					}
					if(parents[x].contains(variables[y]) && !parents[y].contains(variables[x])){
						g[x][y] = false;
						while(Graph.cycleExists(y,g)){
							cycle = Graph.getCycle(x,g);
							for(int j = 0; j < cycle.size() - 1; ++j){
								//remove edge with lowest combined independence
								calculatedValue = combineIndependence(j, j + 1, empty, target, aux, variables);
								if(calculatedValue < CI){
                                                                    CI = calculatedValue;
                                                                    removeA = j;
                                                                    removeB = j + 1;
                                                                }
							}
							g[removeA][removeB] = false;
						}
					}
				}
			}
		}
                
                System.out.println("Number of tests = " + numTests);
		orientEdges(parents,target,aux,g,variables,aSep);
		
		return g;
	}
        
       private static boolean noRootTN(boolean [][] graph, String [] variables, KnowledgeSet target){
            ArrayList<String> types = new ArrayList<>();
            types.add("Temporal");
            ArrayList<String> temporalNodes = getVariablesOfType(target,types);
            String tn;
            int indexTn;
            
            for(int i = 0; i < temporalNodes.size(); ++i){
                tn = temporalNodes.get(i);
                indexTn = getIndexOfNode(variables,tn);
                if(Graph.getIncomingEdges(variables, indexTn, graph).length == 0){
                    return false;
                }  
            }
            return true;
        }
        
        private static int indexOfSeperator(ArrayList<Seperator> seperators, int x, int y){
            int i = 0;
            for(Seperator s : seperators){
                if((s.getIndexX() == x && s.getIndexY() == y) || (s.getIndexX() == y && s.getIndexY() == x)){
                    return i;
                }
                i++;
            }
            return -1;
        }
	
	private static double combineIndependence(int x, int y, String [] subset, KnowledgeSet target, KnowledgeSet [] aux, String [] variables){
		String [] remaining = getRemainingNodes(variables,subset,x,y);
                double targetConfidence, auxConfidence;
		double Skxy = 0;
		double auxSkxy;
                double sgnTarget, sgnAux;
		int auxIndex = 0;
		int numAuxDomains = aux.length;
		LuisVelazquezSimilarity sim;
							
		targetConfidence = confidence(target,variables[x],variables[y],subset,(double)target.size());
							
		//System.out.println("target confidence: " + targetConfidence);
							
		for(int l = 0; l < numAuxDomains; ++l){
			auxConfidence = confidence(aux[l],variables[x],variables[y],subset,(double)aux[l].size());
			sim = new LuisVelazquezSimilarity(target,aux[l],variables[x],variables[y],subset,remaining);
			auxSkxy = sim.evaluate(targetConfidence,auxConfidence);
			//auxSkxy = sim.evaluate(threshold);
			//System.out.println("auxSkxy> " + auxSkxy);
			if(auxSkxy > Skxy){
				//System.out.println("Setting index to > " + l);
				Skxy = auxSkxy;
				auxIndex = l;
			}
		}
							
		auxConfidence = confidence(aux[auxIndex],variables[x],variables[y],subset,(double)aux[auxIndex].size());
		//System.out.println("Aux index is: " + auxIndex);
		//System.out.println("aux confidence: " + auxConfidence);
		//if(CrossConditionalEntropy.isIndependent(target,variables[x],variables[y],subset,threshold))
		if(CrossConditionalEntropy.isIndependent(target,variables[x],variables[y],subset,targetConfidence))
			sgnTarget = -1;
		else 
			sgnTarget = 1;
						
		//if(CrossConditionalEntropy.isIndependent(aux[auxIndex],variables[x],variables[y],subset,threshold))							
		if(CrossConditionalEntropy.isIndependent(aux[auxIndex],variables[x],variables[y],subset,auxConfidence))
			sgnAux = -1;
		else
			sgnAux = 1;
								
		//System.out.println("sgnTarget: " + sgnTarget);
		//System.out.println("sgnAux: " + sgnAux);
		return targetConfidence * sgnTarget + Skxy * (auxConfidence * sgnAux);
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
	
	private static int getIndexOfNode(String [] list, String n){
		for(int i = 0; i < list.length; ++i){
			if(list[i].equals(n)){
				return i;
			}
		}
		return -1;
	}
	
	private static String [] getRemainingNodes(String [] nodes, String [] subset, int NodeX, int NodeY){
		ArrayList<String> remainingNodes = new ArrayList<String>();
		int j;
		boolean stop;
		
		for(int i = 0; i < nodes.length; ++i){
			if(i != NodeX && i != NodeY){
				j = 0;
				stop = false;
				while(j < subset.length && !stop){
					if(nodes[i].equals(subset[j]))
						stop = true;
					j++;
				}
				if(!stop)
					remainingNodes.add(nodes[i]);
			}
		}
		
		return remainingNodes.toArray(new String[remainingNodes.size()]);
	}
	
	private static ArrayList<String> getVariablesOfType(KnowledgeSet target, ArrayList<String> types){
		ArrayList<String> variables = new ArrayList<String>();
		ArrayList<Field> fields = target.getFields();
		int numTypes = types.size();
		
		for(int i = 0; i < fields.size(); ++i){
			for(int j = 0; j < numTypes; ++j){
				if(fields.get(i).getType().equals(types.get(j)))
					variables.add(fields.get(i).getFieldName());
			}
		}
		return variables;
	}
	
	private static void orientEdges(ArrayList<String> [] parents, KnowledgeSet target, KnowledgeSet [] aux, boolean [][] graph, String [] variables, ArrayList<Seperator> aSep){
            //if undirected edges exist
		orientTemporalEdges(parents, target, graph, variables, aSep);
		orientHeadToHead(parents, graph, variables, aSep);
		orientOtherEdges(graph, variables);
		orientArbitrarly(graph, variables);
	}
	
        private static void orientTemporalEdges(ArrayList<String> [] parents, KnowledgeSet target, boolean [][] graph, String [] variables, ArrayList<Seperator> aSep){
		ArrayList<String> types = new ArrayList<String>();
		types.add("Temporal");
		ArrayList<String> temporalNodes = getVariablesOfType(target,types);
		String z;
		String [] edges;
		ArrayList<Object []> variablePairs;
		int indexX, indexY, indexZ;
		ArrayList<String> delete = new ArrayList<String>();
		boolean loop = true;
		boolean cont;
                int sepIndex;
                
                for(int i = 0; i < temporalNodes.size(); ++i){
                    z = temporalNodes.get(i);
                    indexZ = getIndexOfNode(variables,z);
                    if(Graph.directedIncomingEdgesExist(indexZ, graph)){
                        delete.add(z);
                    }
                }
                
                removeNodesFromList(temporalNodes,delete);
		delete.clear();
                
		for(int i = 0; i < temporalNodes.size(); ++i){
		
			z = temporalNodes.get(i);
			indexZ = getIndexOfNode(variables,z);
			parents[indexZ].toArray(edges = new String[ parents[indexZ].size()]);
			variablePairs = Combinations.getSets(edges, 0, edges.length, 0, 2);
			
			for(int j = 0; j < variablePairs.size(); ++j){
				indexX = getIndexOfNode(variables,variablePairs.get(j)[0].toString());
				indexY = getIndexOfNode(variables,variablePairs.get(j)[1].toString());
				if(graph[indexX][indexZ] && graph[indexY][indexZ] && !graph[indexX][indexY] && !graph[indexY][indexX]){
                                    sepIndex = indexOfSeperator(aSep,indexX,indexY);
                                        if(sepIndex == - 1){
                                        //if(!headToHead(target,aux,variablePairs.get(j)[0].toString(),variablePairs.get(j)[1].toString(),z,variables, aSep, threshold)){
						graph[indexZ][indexX] = false;
						
                                                if(Graph.cycleExists(indexX,graph)){
                                                    graph[indexZ][indexX] = true;
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph)){
                                                        graph[indexZ][indexY] = true;
                                                    }else{
                                                        if(Graph.getIncomingEdges(variables, indexY, graph).length == 0){
                                                            graph[indexZ][indexY] = true;
                                                        } else {
                                                            delete.add(z);
                                                        }
                                                    }
                                                } else {
                                                    if(Graph.getIncomingEdges(variables, indexX, graph).length == 0){
                                                        graph[indexZ][indexX] = true;
                                                        graph[indexZ][indexY] = false;
                                                        if(Graph.cycleExists(indexY,graph)){
                                                            graph[indexZ][indexY] = true;
                                                        } else {
                                                            if(Graph.getIncomingEdges(variables, indexY, graph).length == 0){
                                                                graph[indexZ][indexY] = true;
                                                            } else {
                                                                delete.add(z);
                                                            }
                                                        }
                                                    } else {
                                                        graph[indexZ][indexY] = false;
                                                        if(Graph.cycleExists(indexY,graph)){
                                                            graph[indexZ][indexY] = true;
                                                        } else {
                                                            if(Graph.getIncomingEdges(variables, indexY, graph).length == 0){
                                                                graph[indexZ][indexY] = true;
                                                            }
                                                        }
                                                       delete.add(z);
                                                    }
                                                }
						
					} else {
                                            if(!aSep.get(sepIndex).isSeperator(indexZ)){
                                                graph[indexZ][indexX] = false;
						
                                                if(Graph.cycleExists(indexX,graph)){
                                                    graph[indexZ][indexX] = true;
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph)){
                                                        graph[indexZ][indexY] = true;
                                                    }else{
                                                        if(Graph.getIncomingEdges(variables, indexY, graph).length == 0){
                                                            graph[indexZ][indexY] = true;
                                                        } else {
                                                            delete.add(z);
                                                        }
                                                    }
                                                } else {
                                                    if(Graph.getIncomingEdges(variables, indexX, graph).length == 0){
                                                        graph[indexZ][indexX] = true;
                                                        graph[indexZ][indexY] = false;
                                                        if(Graph.cycleExists(indexY,graph)){
                                                            graph[indexZ][indexY] = true;
                                                        } else {
                                                            if(Graph.getIncomingEdges(variables, indexY, graph).length == 0){
                                                                graph[indexZ][indexY] = true;
                                                            } else {
                                                                delete.add(z);
                                                            }
                                                        }
                                                    } else {
                                                        graph[indexZ][indexY] = false;
                                                        if(Graph.cycleExists(indexY,graph)){
                                                            graph[indexZ][indexY] = true;
                                                        } else {
                                                            if(Graph.getIncomingEdges(variables, indexY, graph).length == 0){
                                                                graph[indexZ][indexY] = true;
                                                            }
                                                        }
                                                       delete.add(z);
                                                    }
                                                }
                                            }
                                        }
				}
			}
		}
		
		removeNodesFromList(temporalNodes,delete);
		delete.clear();
		while(loop && temporalNodes.size() > 0){
			loop = false;
			
			for(int i = 0; i < temporalNodes.size(); ++i){
				z = temporalNodes.get(i);
				indexZ = getIndexOfNode(variables,z);
				edges = Graph.getUndirectedEdges(variables,indexZ,graph);
				
				for(int x = 0; x < edges.length; ++x){
					if(orientEdgeXZ(edges[x],z,variables,graph)){
						indexX = getIndexOfNode(variables,edges[x]);
						graph[indexZ][indexX] = false;
						
                                                if(Graph.cycleExists(indexX,graph))
                                                    graph[indexZ][indexX] = true;
                                                else
                                                    delete.add(z);
					}
				}
			}
			
			removeNodesFromList(temporalNodes,delete);
			delete.clear();
			for(int i = 0; i < temporalNodes.size(); ++i){
				//arbitrarly asign directions without creating cycles
				z = temporalNodes.get(i);
				indexZ = getIndexOfNode(variables,z);
				edges = Graph.getUndirectedEdges(variables,indexZ,graph);
				cont = true;
				int j = 0;
				while(j < edges.length && cont){
					indexX = getIndexOfNode(variables,edges[j]);
					graph[indexZ][indexX] = false;
					if(Graph.cycleExists(indexX,graph)){
						graph[indexZ][indexX] = true;
						j++;
					}else{
						delete.add(z);
						cont = false;
						loop = true;
					}
				}
			}
		
			removeNodesFromList(temporalNodes,delete);
			delete.clear();
		}
	}
	
	private static void removeNodesFromList(ArrayList<String> list, ArrayList<String> delete){
		for(int i = 0; i < delete.size(); ++i){
			list.remove(delete.get(i));
		}
	}
	
	private static void orientHeadToHead(ArrayList<String> [] parents, boolean [][] graph, String [] variables, ArrayList<Seperator> aSep){
		ArrayList<Object []> variablePairs;
		String [] edges;
		int indexX, indexY;
                int sepIndex;
		
		for(int indexZ = 0; indexZ < variables.length; ++indexZ){
			parents[indexZ].toArray(edges = new String[ parents[indexZ].size()]);
			variablePairs = Combinations.getSets(edges, 0, edges.length, 0, 2);
			for(int j = 0; j < variablePairs.size(); ++j){
				indexX = getIndexOfNode(variables,variablePairs.get(j)[0].toString());
				indexY = getIndexOfNode(variables,variablePairs.get(j)[1].toString());
				if(graph[indexX][indexZ] && graph[indexY][indexZ] && !graph[indexX][indexY] && !graph[indexY][indexX]){
                                    sepIndex = indexOfSeperator(aSep,indexX,indexY);
					if(sepIndex == - 1){
                                        //if(!headToHead(target,aux,variablePairs.get(j)[0].toString(),variablePairs.get(j)[1].toString(),variables[indexZ],variables,threshold)){
						graph[indexZ][indexX] = false;
                                                if(Graph.cycleExists(indexX,graph)){
                                                    graph[indexZ][indexX] = true;
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph))
                                                        graph[indexZ][indexY] = true;
                                                } else {
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph))
                                                        graph[indexZ][indexY] = true;
                                                }
                                               
					}else{
                                            if(!aSep.get(sepIndex).isSeperator(indexZ)){
                                                graph[indexZ][indexX] = false;
                                                if(Graph.cycleExists(indexX,graph)){
                                                    graph[indexZ][indexX] = true;
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph))
                                                        graph[indexZ][indexY] = true;
                                                } else {
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph))
                                                        graph[indexZ][indexY] = true;
                                                }
                                            }
                                        }
				}
			}
		}
	}
	
	private static void orientOtherEdges(boolean [][] graph, String [] variables){
		boolean cont = true;
		
		while(cont){
			if(!orientUncoupledMeetingTypeA(graph,variables) && !orientXZ(graph,variables) && !orientUncoupledMeetingTypeB(graph,variables))
				cont = false;
		}
	}
	
	// possibility to optimize if prior independence tests are saved
	private static boolean headToHead(KnowledgeSet target, KnowledgeSet [] aux, String x, String y, String z, String [] variables, ArrayList [] aSep, double threshold){
		LuisVelazquezSimilarity sim;
		int indexX = getIndexOfNode(variables,x);
		int indexY = getIndexOfNode(variables,y);
		String [] s = {z};
		double sizeOfTarget = (double)target.size();
		String [] remaining = getRemainingNodes(variables,s,indexX,indexY);
		double auxSkxy;
		double Skxy = 0;
		int auxIndex = 0;
		double sgnTarget, sgnAux;
		double targetConfidence, auxConfidence;
		double combinedIndependence;
		
		targetConfidence = confidence(target,x,y,s,sizeOfTarget);
		
		for(int k = 0; k < aux.length; ++k){
			sim = new LuisVelazquezSimilarity(target,aux[k],x,y,s,remaining);
			//auxConfidence = confidence(aux[k],x,y,s,aux[k].size());
			auxSkxy = sim.evaluate(threshold);
			//auxSkxy = sim.evaluate(targetConfidence,auxConfidence);
								
			if(auxSkxy > Skxy){
				Skxy = auxSkxy;
				auxIndex = k;
			}
		}
		
		auxConfidence = confidence(aux[auxIndex],x,y,s,aux[auxIndex].size());
		
		if(CrossConditionalEntropy.isIndependent(target,x,y,s,threshold))
		//if(CrossConditionalEntropy.isIndependent(target,x,y,s,targetConfidence))
			sgnTarget = -1;
		else 
			sgnTarget = 1;
			
		if(CrossConditionalEntropy.isIndependent(aux[auxIndex],x,y,s,threshold))								
		//if(CrossConditionalEntropy.isIndependent(aux[auxIndex],x,y,s,auxConfidence))
			sgnAux = -1;
		else
			sgnAux = 1;
							
		combinedIndependence = targetConfidence * sgnTarget + Skxy * (auxConfidence * sgnAux);
				
		if(combinedIndependence < threshold)
			return true;
				
		return false;
	}
	
	private static boolean orientUncoupledMeetingTypeA(boolean [][] graph, String [] variables){
		String [] undirected;
		int indexY;
		boolean oriented = false;
		
		for(int indexZ = 0; indexZ < variables.length; ++indexZ){
			if(Graph.directedIncomingEdgesExist(indexZ,graph)){
				undirected = Graph.getUndirectedEdges(variables,indexZ,graph);
				
				for(int y = 0; y < undirected.length; ++y){
					indexY = getIndexOfNode(variables,undirected[y]);
					graph[indexY][indexZ] = false;
					if(Graph.cycleExists(indexZ,graph))
						graph[indexY][indexZ] = true;
					else
						oriented = true;
				}
			}
		}
		return oriented;
	}
	
	private static boolean orientXZ(boolean [][] graph, String [] variables){
		String z;
		String [] edges;
		int indexX, indexZ;
		boolean oriented = false;
		
		for(int i = 0; i < variables.length; ++i){
			z = variables[i];
			indexZ = getIndexOfNode(variables,z);
			edges = Graph.getUndirectedEdges(variables,indexZ,graph);
			for(int x = 0; x < edges.length; ++x){
				if(orientEdgeXZ(edges[x],z,variables,graph)){
					indexX = getIndexOfNode(variables,edges[x]);
					graph[indexZ][indexX] = false;
					oriented = true;
				}
			}
		}
		return oriented;
	}
	
	private static boolean orientUncoupledMeetingTypeB(boolean [][] graph, String [] variables){
		String [] undirected;
		ArrayList<Object []> variableTriplets;
		int i;
		int s;
		int x, y, w;
		boolean oriented = false;
		
		for(int indexZ = 0; indexZ < variables.length; ++indexZ){
			undirected = Graph.getUndirectedEdges(variables,indexZ,graph);
			variableTriplets = Combinations.getSets(undirected,0,undirected.length,0,3);
			
			i = 0;
			s = variableTriplets.size();
			while(i < s){
				x = getIndexOfNode(variables,variableTriplets.get(i)[0].toString());
				y = getIndexOfNode(variables,variableTriplets.get(i)[1].toString());
				w = getIndexOfNode(variables,variableTriplets.get(i)[2].toString());
				if(graph[x][w] && !graph[w][x] && graph[y][w] && !graph[w][y]){
					graph[w][indexZ] = false;
					variableTriplets = Combinations.getSets(undirected,0,undirected.length,0,3);
					s = variableTriplets.size();
					i = 0;
					oriented = true;
				} else if(graph[x][y] && !graph[y][x] && graph[w][y] && !graph[y][w]){
					graph[y][indexZ] = false;
					variableTriplets = Combinations.getSets(undirected,0,undirected.length,0,3);
					s = variableTriplets.size();
					i = 0;
					oriented = true;
				} else if(graph[y][x] && !graph[x][y] && graph[w][x] && !graph[x][w]){
					graph[x][indexZ] = false;
					variableTriplets = Combinations.getSets(undirected,0,undirected.length,0,3);
					s = variableTriplets.size();
					i = 0;
					oriented = true;
				} else {
					i++;
				}
			}
		}
		return oriented;
	}
	
	private static boolean orientEdgeXZ(String x, String z, String [] variables, boolean [][] graph){
		int indexX = getIndexOfNode(variables,x);
		int indexZ = getIndexOfNode(variables,z);
		
		return Graph.directedPath(indexX,indexZ,graph);
	}
	
	private static void orientArbitrarly(boolean [][] graph, String [] variables){
		String [] undirected;
		int indexY;
		
		for(int indexX = 0; indexX < variables.length; ++indexX){
			undirected = Graph.getUndirectedEdges(variables,indexX,graph);
			
			if(undirected.length >= 2){
				for(int i = 0; i < undirected.length; ++i){
					indexY = getIndexOfNode(variables,undirected[i]);
					graph[indexY][indexX] = false;
					if(Graph.cycleExists(indexX,graph)){
						graph[indexY][indexX] = true;
						graph[indexX][indexY] = false;
						
						if(Graph.cycleExists(indexY,graph))
							graph[indexX][indexY] = true;
					}
				}
			} else {
				Random r = new Random();
				int num;
				for(int i = 0; i < undirected.length; ++i){
					indexY = getIndexOfNode(variables,undirected[i]);
					num = r.nextInt(10);
					if(num < 5){
						graph[indexX][indexY] = false;
						if(Graph.cycleExists(indexY,graph)){
							graph[indexX][indexY] = true;
							graph[indexY][indexX] = false;
							
							if(Graph.cycleExists(indexX,graph))
								graph[indexY][indexX] = true;
						}
					} else {
						graph[indexY][indexX] = false;
						if(Graph.cycleExists(indexX,graph)){
							graph[indexY][indexX] = true;
							graph[indexX][indexY] = false;
							
							if(Graph.cycleExists(indexY,graph))
								graph[indexX][indexY] = true;
						}
					}
				}
			}
		}
	}
}