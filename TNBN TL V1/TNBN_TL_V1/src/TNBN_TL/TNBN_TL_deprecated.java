package TNBN_TL;

import LIPS.Kmeans;
import TNBN_TL.Knowledge.*;
import elvira.Bnet;
import elvira.database.DataBaseCases;
import elvira.parser.ParseException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TNBN_TL_deprecated{
    static int targetRecords = 440;
    static int auxPct = 5;
    static String experiments = "target";
    static int numTestCases = 1760;
    
    
	static String [] varNames; /* Names of the fieldnames of the knowledgse set and the random variables in the model */
	static String [] varTypes; /* An array holding the type of each field or random variable */
	static ArrayList<Object []> varValues;  /* An arraylist containing the value array for each random variable of field that is not of type Temporal*/
	static int [] continuous; /* Holds the indexes of the columns with continuous data in the dataset */
	static ArrayList<ArrayList<Temporal[]>> auxTemporalValues; /* An arraylist of arraylists that contains the values each aux domain has for the temporal fields */
	
	public static void main(String [] args){
		int numVariables = 5; /* The number of variables in the models */
		int numAuxDomains = 3; /* The number of auxiliary domains */
		String targetDataSet; /* Filename for the target dataset */
		String [] auxDataSets = new String[numAuxDomains]; /* Filenames for the auxiliary datasets */
		ArrayList<boolean[][]> auxStructures = new ArrayList<boolean[][]>(); /* An arraylist with the auxiliary structures */
		TNBN targetModel; /* The learned target model */
		TNBN [] auxModels = new TNBN[numAuxDomains]; /* The auxiliary models which will aid the learning */
		KnowledgeSet auxKnowledge; /* Contains auxiliary information loaded from the auxiliary dataset */
		double targetWeight; /* The weight assigned to the target data sets for parmateric learning */
		ArrayList<Field> fields; /* The fields the KnowledgeSet contains */ 
		ArrayList<RandomVariable> auxNodes; /* List of nodes the aux models have */
		
		/* Variables used for interval transfer */
		int [] numIntervals; /* The number of intervals to be obtained by kmeans*/
		
		/* Variables used for structure transfer */
		double threshold; /* The threshold to use for Independence tests in structure learning*/
		
		/* Initialize required variables */
                
		varNames = new String[numVariables];
		varTypes = new String[numVariables];
		varValues = new ArrayList<Object[]>();
		auxTemporalValues = new ArrayList<ArrayList<Temporal[]>>(); 
		
		varNames[0] = "Colision";
		varNames[1] = "Herida Cabeza";
		varNames[2] = "Heridas Internas";
		varNames[3] = "Pupilas Dilatadas";
		varNames[4] = "Signos Vitales";
		
		varTypes[0] = "String";
		varTypes[1] = "Boolean";
		varTypes[2] = "String";
		varTypes[3] = "Temporal";
		varTypes[4] = "Temporal";
			
		varValues.add(new String[]{"Severo", "Moderado", "Leve"});
		varValues.add(new Boolean[]{true,false});
		varValues.add(new String[]{"Graves", "Ligeras", "Falso"});
                
                
                /* Experiment environment */
                int [] auxCases = {350,600,470};
                
		String [] targetPartition = {experiments + "Varying Baseline Experiments/" + targetRecords + " records/target partitions/partition0.txt",
                                             experiments + "Varying Baseline Experiments/" + targetRecords + " records/target partitions/partition1.txt",
                                             experiments + "Varying Baseline Experiments/" + targetRecords + " records/target partitions/partition2.txt",
                                             experiments + "Varying Baseline Experiments/" + targetRecords + " records/target partitions/partition3.txt",
                                             experiments + "Varying Baseline Experiments/" + targetRecords + " records/target partitions/partition4.txt"};
                
                String db;
                for(int i = 0; i < numAuxDomains; ++i){
                    try {
                        db = experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/aux" + i + ".dbc";
                        DataBaseCases cases = new DataBaseCases(new FileInputStream(db));
                        auxDataSets[i] = experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/aux" + i + ".txt";
                        ProcessFile.getDBCrecords(db, experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/aux" + i + "Cases.txt");
                        ProcessFile.transformDBCrecords(experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/aux" + i + "Cases.txt",  auxDataSets[i], auxPct * auxCases[i], " ", cases.getVariables());       
                    } catch (Exception e) {
                        e.printStackTrace();
                    } 
                }
		
		/* Initialize aux data */
                
			ArrayList<Temporal[]> auxTempVars1 = new ArrayList<Temporal[]>();
			auxTempVars1.add(new Temporal[]{new Temporal("[0-15]",1),new Temporal("[15-30]",1),new Temporal("[30-60]",2),new Temporal()}); /* For pupilas dilatadas */
			auxTempVars1.add(new Temporal[]{new Temporal("[0-10]",1),new Temporal("[10-45]",2),new Temporal()}); /* For signos vitales */
			
			ArrayList<Temporal[]> auxTempVars2 = new ArrayList<Temporal[]>();
			auxTempVars2.add(new Temporal[]{new Temporal("[0-15]",1),new Temporal("[15-30]",1),new Temporal("[30-60]",2),new Temporal()}); /* For pupilas dilatadas */
			auxTempVars2.add(new Temporal[]{new Temporal("[0-10]",1),new Temporal("[10-45]",2),new Temporal()}); /* For signos vitales */
			
			ArrayList<Temporal[]> auxTempVars3 = new ArrayList<Temporal[]>();
			auxTempVars3.add(new Temporal[]{new Temporal("[0-15]",1),new Temporal("[15-30]",1),new Temporal("[30-60]",2),new Temporal()}); /* For pupilas dilatadas */
			auxTempVars3.add(new Temporal[]{new Temporal("[0-10]",1),new Temporal("[10-45]",2),new Temporal()}); /* For signos vitales */
			
			
			auxTemporalValues.add(auxTempVars1);
			auxTemporalValues.add(auxTempVars2);
			auxTemporalValues.add(auxTempVars3);
			
			boolean [][] auxStruct1 = { {false,true,true,false,false},
										{false,false,false,true,false},
										{false,false,false,false,true},
										{false,false,false,false,false},
										{false,false,false,false,false}
										};
			boolean [][] auxStruct2 = { {false,true,true,false,false},
										{false,false,false,true,true},
										{false,false,false,true,true},
										{false,false,false,false,false},
										{false,false,false,false,false}
										};
			boolean [][] auxStruct3 = { {false,false,true,false,false},
										{false,false,false,true,false},
										{false,false,false,true,true},
										{false,false,false,false,false},
										{false,false,false,false,false}
										};
			
			auxStructures.add(auxStruct1);
			auxStructures.add(auxStruct2);
			auxStructures.add(auxStruct3);
			
			int index;
			int index2;
			boolean [][] auxStructure;
			int totalAuxRecords = 0;
			ArrayList<RandomVariable> parents;
			Integer [] incoming;
			for(int j = 0; j < auxModels.length; ++j){
				fields = new ArrayList<Field>();
				auxNodes = new ArrayList<RandomVariable>();
				index = 0;
				index2 = 0;
				for(int i = 0; i < varNames.length; ++i){
					if(varTypes[i].equals("String")){
						fields.add(new StringField(varNames[i],new ArrayList<String>(Arrays.asList((String[])varValues.get(index)))));
						auxNodes.add(new RandomVariable(varNames[i],(String[])varValues.get(index)));
						index++;
					} else if(varTypes[i].equals("Boolean")){
						fields.add(new BooleanField(varNames[i],new ArrayList<Boolean>(Arrays.asList(new Boolean[]{true,false}))));
						auxNodes.add(new RandomVariable(varNames[i],new Boolean[]{true,false}));
						index++;
					} else if(varTypes[i].equals("Integer")){
						fields.add(new IntegerField(varNames[i],new ArrayList<Integer>(Arrays.asList((Integer[])varValues.get(index)))));
						auxNodes.add(new RandomVariable(varNames[i],(Integer[])varValues.get(index)));
						index++;
					} else if(varTypes[i].equals("Double")){
						fields.add(new DoubleField(varNames[i],new ArrayList<Double>(Arrays.asList((Double[])varValues.get(index)))));
						auxNodes.add(new RandomVariable(varNames[i],(Double[])varValues.get(index)));
						index++;
					} else if(varTypes[i].equals("Temporal")){
						fields.add(new TemporalField(varNames[i],new ArrayList<Temporal>(Arrays.asList(auxTemporalValues.get(j).get(index2)))));
						auxNodes.add(new AuxiliaryTemporalVariable(varNames[i],auxTemporalValues.get(j).get(index2),0.0));
						index2++;
					}
				}
				auxStructure = auxStructures.get(j);				
				for(int i = 0; i < numVariables; ++i){
					parents = new ArrayList<RandomVariable>();
					incoming = Graph.directedIncomingEdges(i, auxStructure);
					for(int l = 0; l < incoming.length; ++l)
						parents.add(auxNodes.get(incoming[l]));
					
					auxNodes.get(i).setParents(parents);
				}
				
				auxKnowledge = new KnowledgeSet(fields);
				auxKnowledge.loadKnowledge(auxDataSets[j]);
				totalAuxRecords += auxKnowledge.size();
				auxModels[j] = new TNBN(auxKnowledge,auxStructure,auxNodes);
				
				auxModels[j].calculateProbabilityTables(true);
				auxModels[j].calculateCPTsGivenParents(true);
			}
			
			/* Initialize variables for parameter transfer */
			targetWeight = 0.4;
			
			int size;
			for(int j = 0; j < auxModels.length; ++j){
				size = auxModels[j].getKnowledgeSet().size();
				auxModels[j].setWeight((double)(size * (1 - targetWeight))/(double)totalAuxRecords);
			}
			
			/* Initialize variables for interval transfer */
			continuous = new int[]{3,4};
			numIntervals = new int[]{3,2};
			
			/* Initialize variables for structural transfer */
			threshold = 0.01;
			
		/* End initialize required variables */
		
                String elv;
                String originalElv = experiments + "Varying Baseline Experiments/Collision.elv";
                String testFileDBC;
                String testFile;
                Bnet learnedModel;
                ArrayList<Temporal[]> intervals;
                double avgBrierScore = 0.0;
                double avgTimeDifferenceNormalized = 0.0;
                double avgTimeDifference = 0.0;
                double avgMseParameters = 0.0;
                double avgEditDistance = 0;
                for(int partition = 0; partition < targetPartition.length; ++partition){
                    
                    targetDataSet = targetPartition[partition];
                    
                    targetModel = baselineNetwork(targetDataSet, auxModels, numIntervals, threshold, targetWeight);
                    
                    intervals = new ArrayList<>();
                    for(int j = 0; j < continuous.length; ++j)
                        intervals.add((Temporal[])targetModel.getNodes().get(continuous[j]).getValues());
                    
                    elv = experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/partition" + partition + "_model.elv";
                    testFileDBC = "partition" + partition + "_Compliment";
                    testFile = experiments + "Varying Baseline Experiments/" + targetRecords + " records/target partitions/partition" + partition + "_Compliment.txt";
                    targetModel.makeElviraNet(elv);
                    
                    try{
                        learnedModel = new Bnet(new FileInputStream(elv));
                        ProcessFile.numberToInterval(testFile,experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/targetPartition" + partition + "_intervals.txt",continuous, numTestCases, " ", intervals);
                        ProcessFile.fileToDBC(experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/targetPartition" + partition + "_intervals.txt",
                                               experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/", testFileDBC, " ", learnedModel.getNodeList());

                        avgBrierScore += EvaluateNetwork.brierScoreBinary(elv,experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/" + testFileDBC + ".dbc", numTestCases, continuous);
                        avgTimeDifferenceNormalized += EvaluateNetwork.evaluateIntervals(elv, testFile, experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/" + testFileDBC + ".dbc", numTestCases, continuous);
                        avgTimeDifference += EvaluateNetwork.evaluateIntervalsNoNormalization(elv, testFile, experiments + "Varying Baseline Experiments/" + targetRecords + " records/aux" + auxPct * 100 + "pct/" + testFileDBC + ".dbc", numTestCases, continuous);
                        avgMseParameters += EvaluateNetwork.mseParameters(originalElv, elv);
                        avgEditDistance += EvaluateNetwork.editDistance(originalElv, elv);
                    }catch(Exception e){
                         e.printStackTrace();
                    }
                }
                
                avgBrierScore /= targetPartition.length;
                avgTimeDifference /= targetPartition.length;
                avgTimeDifferenceNormalized /= targetPartition.length;
                avgMseParameters /= targetPartition.length;
                avgEditDistance /= targetPartition.length;
                
                System.out.println("Relative Brier Score: " + avgBrierScore);
                System.out.println("Time Difference: " + avgTimeDifference);
                System.out.println("Time DifferenceNormalized: " + avgTimeDifferenceNormalized);
                System.out.println("Parameters MSE: " + avgMseParameters);
                System.out.println("Edit Distance: " + avgEditDistance);
	}
	
	public static TNBN baselineNetwork(String targetDataSet, TNBN [] auxModels, int [] numIntervals, double threshold, double targetWeight){
		TNBN targetModel; /* Holds the resulting model learned with transfer learning */
		KnowledgeSet targetKnowledge; /* Contains the target information loaded from the target dataset*/
                KnowledgeSet targetKnowledgeCpy; /* A copy of the target knowledge set */
		ArrayList<Field> fields; /* The fields the KnowledgeSet contains */ 
		ArrayList<RandomVariable> targetNodes = new ArrayList<>(); /* List of nodes the resulting model has */
		boolean [][] targetStructure; /* The structure of the model learned with Transfer Learning */
		Kmeans k = new Kmeans(); /* Applies Kmeans to the initial continuous data */
			
		/* Initialize target data */
		fields = new ArrayList<>();
			
		int index = 0;
		for(int i = 0; i < varNames.length; ++i){
			if(varTypes[i].equals("String")){
				fields.add(new StringField(varNames[i],new ArrayList<>(Arrays.asList((String[])varValues.get(index)))));
				targetNodes.add(new RandomVariable(varNames[i],(String[])varValues.get(index)));
				index++;
			} else if(varTypes[i].equals("Boolean")){
				fields.add(new BooleanField(varNames[i],new ArrayList<>(Arrays.asList(new Boolean[]{true,false}))));
				targetNodes.add(new RandomVariable(varNames[i],new Boolean[]{true,false}));
				index++;
			} else if(varTypes[i].equals("Integer")){
				fields.add(new IntegerField(varNames[i],new ArrayList<>(Arrays.asList((Integer[])varValues.get(index)))));
				targetNodes.add(new RandomVariable(varNames[i],(Integer[])varValues.get(index)));
				index++;
			} else if(varTypes[i].equals("Double")){
				fields.add(new DoubleField(varNames[i],new ArrayList<>(Arrays.asList((Double[])varValues.get(index)))));
				targetNodes.add(new RandomVariable(varNames[i],(Double[])varValues.get(index)));
				index++;
			} else if(varTypes[i].equals("Temporal")){
				fields.add(new TemporalField(varNames[i]));
				targetNodes.add(new TemporalVariable(varNames[i],new Temporal[0]));
			}
		}
		
		targetKnowledge = new KnowledgeSet(fields);
		targetKnowledge.loadKnowledge(targetDataSet);
		targetModel = new TNBN(targetKnowledge,targetNodes);
		targetModel.setWeight(targetWeight);
                
                targetKnowledgeCpy = targetKnowledge.copy();
				
		/* ----------------------------------------------------- Start of initial interval learning with TL --------------------------------------------------------------- */
		
		int numRecordsToGenerate; /* The number of records to generate to do the interval transfer learning */
		int factor = 10; /* The factor that indicates how many records are generated per the number probability values a model has */
		GlobalSimilarity sim; /* An object used to measure how similar an aux model is to the target model based on shared dependencies and independencies */
		double greatestSimilarity = 0;
		double [] similarity = new double[auxModels.length];
		int mostSimilar = -1;
		for(int i = 0; i < auxModels.length; ++i){
			sim = new GlobalSimilarity(targetKnowledge, auxModels[i].getKnowledgeSet(), varNames, threshold);
			similarity[i] = sim.evaluate();
			if(similarity[i] > greatestSimilarity){
				greatestSimilarity =  similarity[i];
				mostSimilar = i;
			}
		}
		
		ArrayList<RandomVariable> auxVars = auxModels[mostSimilar].getNodes();
		ArrayList<RandomVariable> auxParents;
		int numVarProbs;
		int totalProbs = 0;
		for(int i = 0; i < auxVars.size(); ++i){
			numVarProbs = 1;
			auxParents = auxVars.get(i).getParents();
			for(int j = 0; j < auxParents.size(); ++j){
				numVarProbs *= auxParents.get(j).numberOfValues();
			}
			numVarProbs *= auxVars.get(i).numberOfValues();
			totalProbs += numVarProbs;
		}
		
		numRecordsToGenerate = factor * totalProbs;
		
		ArrayList<AuxiliaryTemporalVariable[]> auxTemporalVariables = new ArrayList<>(); /* An arraylist of arrays of type AuxiliaryTemporalVariable */
		AuxiliaryTemporalVariable [] auxiliaryTempVars;
		Distribution [] auxDist;
		AuxiliaryTemporalVariable r;
		Object [] tempVals;
		Temporal auxT;
		for(int i = 0; i < continuous.length; ++i){
			auxiliaryTempVars = new AuxiliaryTemporalVariable[auxModels.length];
			for(int j = 0; j < auxModels.length; ++j){
				r = (AuxiliaryTemporalVariable)auxModels[j].getNodes().get(continuous[i]);
				tempVals = r.getValues();
				auxDist = new Distribution[tempVals.length - 1];
				index = 0;
				for(int l = 0; l < tempVals.length; ++l){
					if(!tempVals[l].toString().equals("Default")){
						auxT = (Temporal)tempVals[l];
						auxDist[index] = new NormalDistribution(auxT.getMean(), auxT.getStd());
						index++;
					}
				}
                                r.setSimilarity(similarity[j]);
				auxiliaryTempVars[j] = new AuxiliaryTemporalVariable(varNames[continuous[i]], auxTemporalValues.get(j).get(i), auxDist, r.getProbabilityDistribution(), similarity[j]);
                                
			}
			auxTemporalVariables.add(auxiliaryTempVars);
		}
		
		ArrayList<String> initialIntervals; /* Holds the initial intervals obtained by kmeans before transfer of knowledge has occurred */
		Temporal [] transferedIntervals; /* The intervals learned with Transfer Learning */
		ArrayList<Temporal> transfered; /* An array list with the intervals learned with TL */
		TemporalVariable v; /* A temporal random variable */
		Temporal [] t; /* An array of temporal ranges */
		Distribution [] d; /* A distribution that characterizes the temporal ranges */
		ProbabilityDistribution p; /* A probability distribution for a TemporalVariable */
		double [] count; /* count[j] holds the number of values of a column of the KnowledgeSet that are in the temporal range t[j] */
		int total; /* The total number of records of column continuous[i] that hold values different to "Default" */
		double value;
		for(int i = 0; i < continuous.length; ++i){
			t = new Temporal[numIntervals[i]];
			d = new Distribution[numIntervals[i]];
			count = new double[numIntervals[i]];
			total = 0;
			initialIntervals = k.discretiza(targetDataSet,continuous[i],numIntervals[i],1).intervalsToStringForm(); /* Obtain initial intervals */
			for(int j = 0; j < t.length; ++j){
				System.out.println("Initial Interval: " + initialIntervals.get(j));
				if(j < t.length - 1){
					t[j] = new Temporal(initialIntervals.get(j),1);
                                } else {
					t[j] = new Temporal(initialIntervals.get(j),2);
                                }
				d[j] = new NormalDistribution(t[j].getMean(), t[j].getStd());
			}
			v = (TemporalVariable)targetNodes.get(continuous[i]);
			v.setValues(t); /* Set the values of the TemporalVariable at index continuous[i] to the obtained intervals */
			v.setDistribution(d); /* Set the distribution of the TemporalVariable at index continuous[i] to d */
			/* This for cycle is used to obtain the needed values to create the probability distribution for each TemporalVariable */
			for(int l = 0; l < targetKnowledge.size(); ++l){
				if(!targetKnowledge.getValueOfField(l,continuous[i]).toString().equals("Default")){
					total++;
					value = Double.parseDouble(targetKnowledge.getValueOfField(l,continuous[i]).toString());
					for(int j = 0; j < t.length; ++j){
						if(t[j].inRange(value)){
							count[j]++;
                                                }
					}
				}
			}
			/* Calculate the probability of each interval */
			double totalProb = 0;
			for(int l = 0; l < count.length; ++l){
				count[l] = count[l]/total;
				totalProb += count[l];
			}
			/* Normalize */
			for(int l = 0; l < count.length; ++l){
				count[l] = count[l]/totalProb;
                        }

			p = new ProbabilityDistribution(v.getName(), initialIntervals.toArray(new String[initialIntervals.size()]), count); /* create the probability distribution */
			v.setProbabilityDistribution(p); /* Set the probability distribution of the TemporalVariable at index continuous[i] to the obtained distribution */
			
			transferedIntervals = IntervalTL.transferKnowledge(v, auxTemporalVariables.get(i), numIntervals[i], numRecordsToGenerate, total); /* Transfer knowledge from auxiliary domains */
			transfered = new ArrayList<>(Arrays.asList(transferedIntervals));
			transfered.add(new Temporal());
			transferedIntervals = transfered.toArray(new Temporal[transfered.size()]);
			
			targetNodes.get(continuous[i]).setValues(transferedIntervals); /* Set the values of the TemporalVariable at index continuous[i] to the obtained intervals */
			targetKnowledgeCpy.setFieldValues(continuous[i],new ArrayList<>(Arrays.asList(transferedIntervals))); /* Set the values of the TemporalField at index continuous[i] to the obtained intervals */
			
			/* Recalculate the distribution based on the new intervals */
			d = new Distribution[numIntervals[i]];
			String [] newIntervals = new String[numIntervals[i] + 1];
			for(int j = 0; j < transferedIntervals.length - 1; ++j){
				//System.out.println("New Interval: " + transferedIntervals[j].toString());
				d[j] = new NormalDistribution(transferedIntervals[j].getMean(),transferedIntervals[j].getStd());
				newIntervals[j] = transferedIntervals[j].toString();
			}
			newIntervals[numIntervals[i]] = "Default";
			
			/* Update the KnowledgeSet to use the learned intervals instead of the continuous data */
			for(int l = 0; l < targetKnowledgeCpy.size(); ++l){
				if(!targetKnowledgeCpy.getValueOfField(l,continuous[i]).toString().equals("Default")){
					value = Double.parseDouble(targetKnowledgeCpy.getValueOfField(l,continuous[i]).toString());
					for(int j = 0; j < transferedIntervals.length - 1; ++j){
						if(transferedIntervals[j].inRange(value)){
							targetKnowledgeCpy.setValueOfField(l,continuous[i],transferedIntervals[j]);
                                                        break;
						} else {
							targetKnowledgeCpy.setValueOfField(l,continuous[i],"Default");
						}
					}
				}
			}			
			initialIntervals.clear();
		}
		//targetKnowledge.writeToFile(targetDataSet + " with TL intervals.txt");
		
		/* ----------------------------------------------------- End of initial interval learning with TL ----------------------------------------------------------------- */
		
		/* ----------------------------------------------------- Start of initial structure learning with TL ----------------------------------------------------------------- */
		
		KnowledgeSet [] aux = new KnowledgeSet[auxModels.length]; /* An array of auxiliary KnowledgeSets */
		for(int i = 0; i < aux.length; ++i)
			aux[i] = auxModels[i].getKnowledgeSet();
		
		targetStructure = StructureTL.PC_TL(targetKnowledgeCpy, aux, threshold); /* Learn the structure with PC_TL */
		targetModel.setGraph(targetStructure); /* Set the structure of the target model to the learned structure */
		
		ArrayList<RandomVariable> parents;
		Integer [] incoming;
		for(int i = 0; i < targetStructure.length; ++i){
			parents = new ArrayList<RandomVariable>();
			incoming = Graph.directedIncomingEdges(i, targetStructure);
			for(int j = 0; j < incoming.length; ++j)
				parents.add(targetNodes.get(incoming[j]));
	
			targetModel.getNodes().get(i).setParents(parents);
		}
		
		/*System.out.println();
		
		for(int i = 0; i < targetStructure.length; ++i){
			for(int j = 0; j < targetStructure.length; ++j){
				System.out.print(targetStructure[i][j] + " ");
			}
			System.out.println();
		}
		
		System.out.println();*/
		
		targetModel.calculateProbabilityTables(targetKnowledgeCpy, true); /* Calculate probability tables */
		targetModel.calculateCPTsGivenParents(targetKnowledgeCpy, true); /* Calculate conditional probability tables */
		
		/* ----------------------------------------------------- End of initial structure learning with TL ------------------------------------------------------------------- */
		
		/* ----------------------------------------------------- Start of interval refinement -------------------------------------------------------------------------------- */
		/* ----------------------------------------------------- End of interval refinement ---------------------------------------------------------------------------------- */
		
		/* ----------------------------------------------------- Start of parameter learning with TL ------------------------------------------------------------------------- */
		
		//ParametricTL.parametericLearning(targetModel, auxModels);
		//ParametricTL.temporalNodeParametericLearning(targetModel, auxModels);
		
		//targetModel.printProbabilities();
		
		/* ----------------------------------------------------- End of parameter learning with TL --------------------------------------------------------------------------- */
		
		return targetModel;
	}
}