package TNBN_TL;

import elvira.CaseListMem;
import elvira.Configuration;
import elvira.FiniteStates;
import elvira.Node;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;

public class ProcessFile{
        /*public static void main(String [] args){
            try{
                ArrayList<Temporal []> intervals = new ArrayList<Temporal[]>();
                intervals.add(new Temporal[]{new Temporal(), new Temporal("[30-60]",2), new Temporal("[15-30]",1), new Temporal("[0-15]",1)});
		intervals.add(new Temporal[]{new Temporal(), new Temporal("[10-45]",2), new Temporal("[0-10]",1)});
                
		FileInputStream f = new FileInputStream("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/target.dbc");
		DataBaseCases cases = new DataBaseCases(f);
                String seperator = " ";
                int numPartitions = 10;
                int numRecords = 100;
                int [] continuous =  new int[]{3,4};
                String input = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/10-fold CV 100 records/";
			
                createPartitionDBCs(input, input, continuous, numRecords, numPartitions, seperator, intervals, cases);
                
            }catch(Exception e){
		e.printStackTrace();
            }
        }*/
	public static void main(String [] args){
            //getDBCrecords("test file processing/auxP1.dbc", "test file processing/dbcCases.txt");
            try{
                /*ArrayList<Temporal []> intervals = new ArrayList<Temporal[]>();
                intervals.add(new Temporal[]{new Temporal(), new Temporal("[30-60]",2), new Temporal("[15-30]",1), new Temporal("[0-15]",1)});
		intervals.add(new Temporal[]{new Temporal(), new Temporal("[10-45]",2), new Temporal("[0-10]",1)});*/
                
		//FileInputStream f = new FileInputStream("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/AuxD.dbc");
		//DataBaseCases cases = new DataBaseCases(f);
                
                int numRecords = 1580;
			
                //writeDBC(cases.getVariables(),"test file processing/dbcCases.txt","test file processing","createdDBC");
                //getDBCrecords("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/target.dbc", "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/target.txt");
                //transformDBCrecords("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/10-fold CV 10 records/AuxD.txt","data files/auxTransformed.txt",numRecords," ",cases.getVariables());
                intervalToNumber("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/Discrete Combined Aux DBs.txt", "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/Continuous Combined Aux DBs.txt", new int[]{3,4}, numRecords, " ");

                /*BufferedReader in = new BufferedReader(new FileReader("C:/Users/lfiedlerc/Desktop/DBN electrical plant/datosSimuSimple75.txt"));
                in.readLine();
                char delim = in.readLine().charAt(2);
                fileToCSV("C:/Users/lfiedlerc/Desktop/DBN electrical plant/static 150 header.txt","C:/Users/lfiedlerc/Desktop/DBN electrical plant/150 static.csv",' ');*/
                
            }catch(Exception e){
		e.printStackTrace();
            }
            
	}
        
        public static void createPartitionDBCs(String input, String output, int [] continuous, int numRecords, int numPartitions, String seperator, ArrayList<Temporal []> intervals, DataBaseCases cases){
            for(int i = 0; i < numPartitions; i++){
                numberToInterval(input + "partition" + i + ".txt", "data files/partition" + i + "withInterval.txt", continuous, 100,seperator, intervals);
                fileToDBC("data files/partition" + i + "withInterval.txt", output, "partition" + i, " ", cases.getVariables());
            }
        }
        
        public static void fileToCSV(String filename, String output, char delimeter){
            String record, line, value;
            StringTokenizer tok;
                try{
			BufferedReader in = new BufferedReader(new FileReader(filename));
			BufferedWriter out = new BufferedWriter(new FileWriter(output));

			while((record = in.readLine()) != null){
				line = "";
                                tok = new StringTokenizer(record, " ");
                                if(tok.countTokens() == 1){
                                    tok = new StringTokenizer(record, String.valueOf(delimeter));
                                }
				value = tok.nextToken();
				line += value;
				while(tok.hasMoreTokens()){
					value = tok.nextToken();
					line += ";" + value;
				}
				out.write(line);
                                out.newLine();
			}
			
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
        }
	
	public static void getDBCrecords(String dbc, String output){
		try{
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			FileInputStream f = new FileInputStream(dbc);
			DataBaseCases cases = new DataBaseCases(f);
			CaseListMem list = cases.getCaseListMem();
			int [] dbcRow;
			int numCases = cases.getNumberOfCases();
			
			for(int i = 0; i < numCases; ++i){
				dbcRow = list.getCase(i);
				for(int j = 0; j < dbcRow.length; ++j){
					out.write(dbcRow[j] + "");
					if(j < dbcRow.length - 1)
						out.write(",");
				}
				if(i < numCases - 1)
					out.newLine();
			}
			
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void writeDBC(NodeList variables, String casesFile, String outputPath, String dbcName){
		try{
			DataBaseCases dbc;
			Configuration conf;
			CaseListMem list = new CaseListMem(variables);
			StringTokenizer tok;
			String record;
			int i;
			int numCases = 0;
			
			BufferedReader in = new BufferedReader(new FileReader(casesFile));
			
			while((record = in.readLine()) != null){
				conf = new Configuration(variables);
				tok = new StringTokenizer(record,",");
				i = 0;
				
				while(tok.hasMoreTokens()){
					conf.setValue(i, Integer.parseInt(tok.nextToken()));
					i++;
				}
				list.put(conf);
				numCases++;
			}
			
			dbc = new DataBaseCases(dbcName,variables,list);
                        dbc.setNumberOfCases(numCases);
                        dbc.saveDataBase(new FileWriter(outputPath + "/" + dbcName + ".dbc"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void transformDBCrecords(String filename, String output, int numRecords, String seperator, ArrayList<String[]> values){
		StringTokenizer tok;
		String record;
		String line;
		int value;
		int i, j;
		
		try{
			BufferedReader in = new BufferedReader(new FileReader(filename));
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
                        j = 0;
			while((record = in.readLine()) != null){
				line = "";
				tok = new StringTokenizer(record, ",");
				
				value = Integer.parseInt(tok.nextToken());
				line += values.get(0)[value];
				i = 1;
				while(tok.hasMoreTokens()){
					value = Integer.parseInt(tok.nextToken());
					line += seperator + values.get(i)[value];
					i++;
				}
				out.write(line);
				if(j < numRecords - 1)
                                    out.newLine();
                                j++;
			}
			
			in.close();
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public static void transformDBCrecords(String filename, String output, int numRecords, String seperator, NodeList variables){
		StringTokenizer tok;
		String record;
		String line;
		int value;
		int i, j;
		Vector<Node> v;
		String [] states;
                FiniteStates node;
		
		try{
			BufferedReader in = new BufferedReader(new FileReader(filename));
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
			v = variables.getNodes();
			
                        j = 0;
			while((record = in.readLine()) != null){
				line = "";
				tok = new StringTokenizer(record, ",");
				
				value = Integer.parseInt(tok.nextToken());
                                node = (FiniteStates)v.get(0);
				states = node.getStringStates();
				line += states[value].substring(1, states[value].length() - 1);
				i = 1;
				while(tok.hasMoreTokens()){
					value = Integer.parseInt(tok.nextToken());
                                        node = (FiniteStates)v.get(i);
					states = node.getStringStates();
					line += seperator + states[value].substring(1, states[value].length() - 1);
					i++;
				}
				out.write(line);
                                if(j < numRecords - 1)
                                    out.newLine();
                                j++;
			}
                        
			in.close();
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
        
    public static void intervalToNumber(String filename, String output, int [] intervalIndexes, int numRecords, String seperator){
		StringTokenizer tok;
		String record;
		String line;
		String interval;
		int i, j, k;
		boolean isInterval;
		double number;
		Temporal t;
		Distribution normal;
		
		try{
			BufferedReader in = new BufferedReader(new FileReader(filename));
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
                        k = 0;
			while((record = in.readLine()) != null){
				i = 0;
				tok = new StringTokenizer(record,seperator);
				line = "";
				while(tok.hasMoreTokens()){
					isInterval = false;
					j = 0;
					while(j < intervalIndexes.length && !isInterval){
                                            if(i == intervalIndexes[j])
						isInterval = true;
                                            j++;
					}
					if(isInterval){
                                            interval = tok.nextToken();
                                            if(interval.equals("Default"))
						line += interval;
                                            else {
						t = new Temporal(interval,1);
						normal = new NormalDistribution(t.getMean(),t.getStd());
						number = normal.generate();
						while(number < t.getLowerBounds() || number > t.getUpperBounds())
							number = normal.generate();
						line += number;
                                            }
					} else {
						line += tok.nextToken();
					}
					if(tok.hasMoreTokens())
						line += "\t";
					i++;
				}
				out.write(line);
				if(k < numRecords - 1)
					out.newLine();
                                k++;
			}
			
			in.close();
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public static void numberToInterval(String filename, String output, int [] intervalIndexes, int numRecords, String seperator, ArrayList<Temporal[]> intervals){
		String line;
		String record;
		StringTokenizer tok;
		String value;
		Temporal [] vals;
                int numToken;
		boolean write, inRange;
		int j;
                int numOutOfRange = 0;
                
		try{
			BufferedReader in = new BufferedReader(new FileReader(filename));
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
			j = 0;
			while((record = in.readLine()) != null){
                                line = "";
				tok = new StringTokenizer(record, seperator);
				value = tok.nextToken();
				numToken = 0;
				write = true;
				for(int i = 0; i < intervalIndexes.length; ++i){
					while(numToken < intervalIndexes[i]){
						if(write){
							line += value + seperator;
						}
						value = tok.nextToken();
						numToken++;
						write = true;
					}
					write = false;
					if(!value.equals("Default")){
						vals = intervals.get(i);
						inRange = false;
						for(int k = 0; k < vals.length; ++k){
							if(!vals[k].toString().equals("Default")){
								if(vals[k].inRange(Double.parseDouble(value))){
									line += vals[k].toString();
									inRange = true;
									if(tok.hasMoreTokens())
										line += seperator;
									break;
								} 
							}
						}
						if(!inRange){
                                                    numOutOfRange++;
                                                        line += "OutOfRange";
							//line += "Default"; // is this fair????
							if(tok.hasMoreTokens())
								line += seperator;
						}
					} else {
						line += value;
						if(tok.hasMoreTokens())
							line += seperator;
					}
				}
				
				out.write(line);
				if(j < numRecords - 1)
					out.newLine();
				j++;
			}
			
			in.close();
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void fileToDBC(String filename, String outputPath, String dbcName, String seperator, NodeList variables){
		String record;
                DataBaseCases dbc;
		Configuration conf;
		CaseListMem list = new CaseListMem(variables);
		StringTokenizer tok;
		int i, j;
		int numCases = 0; 
		Vector<Node> v;
		String [] states;
                FiniteStates node;
		boolean cont;
		String val;
		
		try{
			BufferedReader in = new BufferedReader(new FileReader(filename));
			
			v = variables.getNodes();
			
			while((record = in.readLine()) != null){
				conf = new Configuration(variables);
				tok = new StringTokenizer(record,seperator);
				i = 0;
				while(tok.hasMoreTokens()){
					val = tok.nextToken();
					node = (FiniteStates)v.get(i);
					states = node.getStringStates();
					
					j = 0;
					cont = true;
					while(j < states.length && cont){
						if(states[j].substring(1, states[j].length() - 1).equals(val)){
							conf.setValue(i,j);
							cont = false;
						}
                                                j++;
					}
                                        if(cont){
                                            conf.setValue(i,-1);
                                        }
					i++;
				}
				list.put(conf);
				numCases++;
			}
                        in.close();
                        
			dbc = new DataBaseCases(dbcName,variables,list);
                        dbc.setNumberOfCases(numCases);
                        dbc.saveDataBase(new FileWriter(outputPath + dbcName + ".dbc"));	
		}catch(Exception e){
			e.printStackTrace();
		}
	}
        
        public static void dbToDBC(String filename, String output, int [] intervalIndexes, int numRecords, String seperator, ArrayList<Temporal[]> intervals, NodeList variables){
            numberToInterval(filename, output + "intervals.txt", intervalIndexes, numRecords, seperator, intervals);
            fileToDBC(output + "intervals.txt", "", output, seperator, variables);
        }
}