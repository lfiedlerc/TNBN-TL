package TNBN_TL;

import TNBN_TL.Knowledge.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

public class StructureTL{
	
	public static boolean[][] PC_TL(KnowledgeSet target, KnowledgeSet [] aux, double threshold){
		String [] variables = target.getFieldNames();
		int numVariables = variables.length;
		boolean [][] g = new boolean[numVariables][numVariables];
		ArrayList<Object []> subsets;
		int i, s, m;
		boolean cont, dependent;
		String [] values;
		String [] remaining;
		String [] subset;
		int numAuxDomains = aux.length;
		LuisVelazquezSimilarity sim;
		double Skxy, auxSkxy;
		double targetConfidence, auxConfidence;
		double combinedIndependence;
		double sgnTarget, sgnAux;
		int auxIndex;
		int numAdj;
		
		Graph.inicializeCompleteUndirectedGraph(g);
		
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
							remaining = getRemainingNodes(variables,subset,x,y);
							Skxy = 0;
							auxIndex = 0;
							
							targetConfidence = confidence(target,variables[x],variables[y],subset,(double)target.size());
							
							//System.out.println("target confidence: " + targetConfidence);
							
							for(int l = 0; l < numAuxDomains; ++l){
								//auxConfidence = confidence(aux[l],variables[x],variables[y],subset,(double)aux[l].size());
								sim = new LuisVelazquezSimilarity(target,aux[l],variables[x],variables[y],subset,remaining);
								//auxSkxy = sim.evaluate(targetConfidence,auxConfidence);
								auxSkxy = sim.evaluate(threshold);
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
							if(CrossConditionalEntropy.isIndependent(target,variables[x],variables[y],subset,threshold))
							//if(CrossConditionalEntropy.isIndependent(target,variables[x],variables[y],subset,targetConfidence))
								sgnTarget = -1;
							else 
								sgnTarget = 1;
							
							if(CrossConditionalEntropy.isIndependent(aux[auxIndex],variables[x],variables[y],subset,threshold))							
							//if(CrossConditionalEntropy.isIndependent(aux[auxIndex],variables[x],variables[y],subset,auxConfidence))
								sgnAux = -1;
							else
								sgnAux = 1;
								
							//System.out.println("sgnTarget: " + sgnTarget);
							//System.out.println("sgnAux: " + sgnAux);
							
							combinedIndependence = targetConfidence * sgnTarget + Skxy * (auxConfidence * sgnAux);
							//System.out.println(combinedIndependence);
							if(combinedIndependence < threshold){// one meets independence remove arc and break
								g[x][y] = false;
								g[y][x] = false;
								dependent = false;
							}
							s++;
						}
					}
				}
			}
			i++;
			
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
		}
		orientEdges(target,aux,g,variables,threshold);
		
		return g;
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
		
		confidence = 1 - (Math.log10(N) / (2 * N)) * T;
		
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
	
	private static void orientEdges(KnowledgeSet target, KnowledgeSet [] aux, boolean [][] graph, String [] variables, double threshold){
		orientTemporalEdges(target, aux, graph, variables, threshold);
		orientHeadToHeadInstantNodes(target, aux, graph, variables, threshold);
		orientOtherEdges(graph, variables);
		orientArbitrarly(graph, variables);
	}
	
	private static void orientTemporalEdges(KnowledgeSet target, KnowledgeSet [] aux, boolean [][] graph, String [] variables, double threshold){
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
                
		for(int i = 0; i < temporalNodes.size(); ++i){
		
			z = temporalNodes.get(i);
			indexZ = getIndexOfNode(variables,z);
			edges = Graph.getIncomingEdges(variables,indexZ,graph);
			variablePairs = Combinations.getSets(edges, 0, edges.length, 0, 2);
			
			for(int j = 0; j < variablePairs.size(); ++j){
				indexX = getIndexOfNode(variables,variablePairs.get(j)[0].toString());
				indexY = getIndexOfNode(variables,variablePairs.get(j)[1].toString());
				if(!graph[indexX][indexY] && !graph[indexY][indexX]){
					if(!headToHead(target,aux,variablePairs.get(j)[0].toString(),variablePairs.get(j)[1].toString(),z,variables,threshold)){
						graph[indexZ][indexX] = false;
						
                                                if(Graph.cycleExists(indexX,graph)){
                                                    graph[indexZ][indexX] = true;
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph)){
                                                        graph[indexZ][indexY] = true;
                                                    }else{
                                                        delete.add(z);
                                                    }
                                                } else {
                                                    graph[indexZ][indexY] = false;
                                                    if(Graph.cycleExists(indexY,graph)){
                                                        graph[indexZ][indexY] = true;
                                                    }
                                                   delete.add(z);
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
	
	private static void orientHeadToHeadInstantNodes(KnowledgeSet target, KnowledgeSet [] aux, boolean [][] graph, String [] variables, double threshold){
		ArrayList<String> types = new ArrayList<String>();
		types.add("String");
		types.add("Double");
		types.add("Integer");
		types.add("Boolean");
		ArrayList<String> instantNodes = getVariablesOfType(target,types);
		String z;
		ArrayList<Object []> variablePairs;
		String [] edges;
		int indexX, indexY, indexZ;
		
		for(int i = 0; i < instantNodes.size(); ++i){
			z = instantNodes.get(i);
			indexZ = getIndexOfNode(variables,z);
			edges = Graph.getIncomingEdges(variables,indexZ,graph);
			variablePairs = Combinations.getSets(edges, 0, edges.length, 0, 2);
	
			for(int j = 0; j < variablePairs.size(); ++j){
				indexX = getIndexOfNode(variables,variablePairs.get(j)[0].toString());
				indexY = getIndexOfNode(variables,variablePairs.get(j)[1].toString());
				if(!graph[indexX][indexY] && !graph[indexY][indexX]){
					if(!headToHead(target,aux,variablePairs.get(j)[0].toString(),variablePairs.get(j)[1].toString(),z,variables,threshold)){
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
	
	private static void orientOtherEdges(boolean [][] graph, String [] variables){
		boolean cont = true;
		
		while(cont){
			if(!orientUncoupledMeetingTypeA(graph,variables) && !orientXZ(graph,variables) && !orientUncoupledMeetingTypeB(graph,variables))
				cont = false;
		}
	}
	
	// possibility to optimize if prior independence tests are saved
	private static boolean headToHead(KnowledgeSet target, KnowledgeSet [] aux, String x, String y, String z, String [] variables, double threshold){
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