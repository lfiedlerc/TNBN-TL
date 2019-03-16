package TNBN_TL;

import java.util.ArrayList;

public class Graph{

	public static void inicializeCompleteUndirectedGraph(boolean [][] graph){
		int size = graph[0].length;
		
		for(int i = 0; i < size; ++i){
			for(int j = 0; j < size; ++j){
				if(i == j)
					graph[i][j] = false;
				else
					graph[i][j] = true;
			}
		}
	}
	
	public static String [] getAdjacencies(String [] nodes, int nodeY, boolean [][] graph){
		ArrayList<String> adjacentNodes = new ArrayList<String>();
		
		for(int i = 0; i < nodes.length; ++i){
			if(graph[i][nodeY] && graph[nodeY][i] )
				adjacentNodes.add(nodes[i]);
		}
		
		return adjacentNodes.toArray(new String[adjacentNodes.size()]);
	}
	
	public static String [] getAdjacenciesExclude(String [] nodes, int nodeY, int exclude, boolean [][] graph){
		ArrayList<String> adjacentNodes = new ArrayList<String>();
		
		for(int i = 0; i < nodes.length; ++i){
			if(i != exclude){
				if(graph[i][nodeY] && graph[nodeY][i] )
					adjacentNodes.add(nodes[i]);
			}
		}
		
		return adjacentNodes.toArray(new String[adjacentNodes.size()]);
	}
	
	/* Returns edges going in to the node at nodeIndex or any undirected edges connected to node */
	public static String[] getIncomingEdges(String [] nodes, int nodeIndex, boolean [][] graph){
		ArrayList<String> edges = new ArrayList<String>();
		
		for(int i = 0; i < graph.length; ++i){
			if(graph[i][nodeIndex]){
				edges.add(nodes[i]);
			} 
		}
		
		return edges.toArray(new String[edges.size()]);
	}
	
	/* Returns true only if directed edges going in to the node at nodeIndex exist */
	public static boolean directedIncomingEdgesExist(int nodeIndex, boolean [][] graph){
		for(int i = 0; i < graph.length; ++i){
			if(graph[i][nodeIndex] && !graph[nodeIndex][i]){
				return true;
			} 
		}
		return false;
	}
	
	/* Returns a String array of the directed edges going in to the node at nodeIndex */
	public static String[] directedIncomingEdges(String [] nodes, int nodeIndex, boolean [][] graph){
		ArrayList<String> edges = new ArrayList<String>();
		
		for(int i = 0; i < graph.length; ++i){
			if(graph[i][nodeIndex] && !graph[nodeIndex][i]){
				edges.add(nodes[i]);
			} 
		}
		return edges.toArray(new String[edges.size()]);
	}
	
	/* Returns an int array with the indexes of the directed edges going in to the node at nodeIndex */
	public static Integer[] directedIncomingEdges(int nodeIndex, boolean [][] graph){
		ArrayList<Integer> edges = new ArrayList<Integer>();
		
		for(int i = 0; i < graph.length; ++i){
			if(graph[i][nodeIndex] && !graph[nodeIndex][i]){
				edges.add(i);
			} 
		}
		return edges.toArray(new Integer[edges.size()]);
	}
	
	/* Returns only undirected edges adjacent to the node at nodeIndex */
	public static String[] getUndirectedEdges(String [] nodes, int nodeIndex, boolean [][] graph){
		ArrayList<String> edges = new ArrayList<String>();
		
		for(int i = 0; i < graph.length; ++i){
			if(graph[i][nodeIndex] && graph[nodeIndex][i]){
				edges.add(nodes[i]);
			} 
		}
		
		return edges.toArray(new String[edges.size()]);
	}
	
	public static boolean cycleExists(boolean [][] graph){
		ArrayList<Integer> list = new ArrayList<Integer>();
		ArrayList<Integer> q = new ArrayList<Integer>();
		int size = graph[0].length;
		boolean [][] temp = new boolean[size][size];
		int node;
		
		for(int i = 0; i < size; ++i){
			if(!directedIncomingEdgesExist(i,graph))
				q.add(i);
			for(int j = 0; j < size; ++j){
				temp[i][j] = graph[i][j];
			}
		}
		
		while(!q.isEmpty()){
			node = q.remove(0);
			list.add(node);
			
			for(int i = 0; i < size; ++i){
				if(temp[node][i] && !temp[i][node]){
					temp[node][i] = false;
					if(!directedIncomingEdgesExist(i,temp))
						q.add(i);
				}
			}
		}
		for(int i = 0; i < size; ++i){
			for(int j = 0; j < size; ++j){
				if(temp[i][j]) return true;
			}
		}
		return false;
	}
	
	public static boolean directedPath(int root, int child, boolean [][] graph){
		ArrayList<Integer> q = new ArrayList<Integer>();
		q.add(root);
		int node;
		int size = graph[0].length;
		while(!q.isEmpty()){
			node = q.remove(0);
			if(node == child)
				return true;
				
			for(int i = 0; i < size; ++i){
				if(graph[node][i] && !graph[i][node]){
					q.add(i);
                                }
			}
		}
		return false;
	}
	
	public static boolean cycleExists(int root, boolean [][] graph){
		ArrayList<Integer> q = new ArrayList<Integer>();
		int node;
		int size = graph[0].length;
		for(int i = 0; i < size; ++i){
			if(graph[root][i] && !graph[i][root])
				q.add(i);
		}
		
		while(!q.isEmpty()){
			node = q.remove(0);
			if(node == root)
				return true;
				
			for(int i = 0; i < size; ++i){
				if(graph[node][i] && !graph[i][node])
					q.add(i);
			}
		}
		return false;
	}
        
        public static ArrayList<Integer> getCycle(int root, boolean [][] graph){
            ArrayList<Integer> cycle = new ArrayList<Integer>();
            dfs_rec_detect_cycle(root,graph,cycle,0,root);
            cycle.add(0,root);
            return cycle;
        }
        
        public static int dfs_rec_detect_cycle(int node, boolean [][] graph, ArrayList<Integer> cycle, int depth, int root){
            if(depth > 0){
                if(node == root){
                    return node;
                }
            }
            
            for(int i = 0; i < graph[0].length; ++i){
                if(graph[node][i] && !graph[i][node]){
                    if(dfs_rec_detect_cycle(i,graph,cycle,depth + 1, root) != -1){
                        cycle.add(0,i);
                        return i;
                    }
                }
            }
            return -1;
        }
        
        public static void printGraph(boolean [][] graph){
            for(int i = 0; i < graph.length; i++){
                for(int j = 0; j < graph[0].length; j++){
                    System.out.print(graph[i][j] + " ");
                }
                System.out.println();
            }
        }
}