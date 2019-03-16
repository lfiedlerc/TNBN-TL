package TNBN_TL;

import LIPS.BAPElvira;
import LIPS.BNUtilities;
import elvira.Bnet;
import elvira.Configuration;
import elvira.FiniteStates;
import elvira.Link;
import elvira.LinkList;
import elvira.Node;
import elvira.NodeList;
import elvira.parser.ParseException;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class EvaluateNetwork{
    private static double binaryBrier;

       public static double brierScore(String elv, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<>();
            double brierScore;

            if (elv !=null){
                try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(ParseException | IOException e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i){
                temporalNodes.add(parts[continuous[i]]);
            }

            BAPElvira bap = new BAPElvira();
            
            brierScore = bap.ejecuta(network,complement,0,headers,temporalNodes);
            
            binaryBrier = BAPElvira.binaryBrier;

            return brierScore;
	}
       
       public static double binaryBrierScore(){
           return binaryBrier;
       }
       
       public static double brierScoreBinary(String elv, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(ParseException | IOException e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i){
                temporalNodes.add(parts[continuous[i]]);
            }

            BAPElvira bap = new BAPElvira();

            return bap.ejecuta(network,complement,4,headers,temporalNodes);
	}
       
       public static double evaluatePredictivePrecision(String elv, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(ParseException | IOException e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i){
                temporalNodes.add(parts[continuous[i]]);
            }

            BAPElvira bap = new BAPElvira();

            return bap.predictivePrecision(network,complement,1,headers,temporalNodes);
	}
       
       public static double evaluateLeavePrediction(String elv, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(ParseException | IOException e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i){
                temporalNodes.add(parts[continuous[i]]);
            }

            BAPElvira bap = new BAPElvira();

            return bap.ejecuta(network,complement,2,headers,temporalNodes);
	}
       
        public static double evaluateIntervals(String elv, String transformedFile, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<String>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(Exception e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i)
                temporalNodes.add(parts[continuous[i]]);

            BAPElvira bap = new BAPElvira();
            return 1 - bap.evaluaTiempoNormalized(network,complement,headers,transformedFile,temporalNodes,continuous);
        }
        
        public static double evaluateIntervalsNoNormalization(String elv, String transformedFile, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<String>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(Exception e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i)
                temporalNodes.add(parts[continuous[i]]);

            BAPElvira bap = new BAPElvira();
            return bap.evaluaTiempo(network,complement,headers,transformedFile,temporalNodes);
        }
        
        public static double evaluateIntervalsNormalized(String elv, String transformedFile, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<String>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(Exception e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i)
                temporalNodes.add(parts[continuous[i]]);

            BAPElvira bap = new BAPElvira();
            return bap.evaluaTiempoNormalized(network,complement,headers,transformedFile,temporalNodes,continuous);
        }
        
        public static double evaluateTemporalPredictionError(String elv, String transformedFile, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<String>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(Exception e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i)
                temporalNodes.add(parts[continuous[i]]);

            BAPElvira bap = new BAPElvira();
            return bap.evaluateTemporalPredictionError(network,complement,headers,transformedFile,temporalNodes,continuous);
        }
        
        public static double evaluateBrierTemporalPredictionError(String elv, String transformedFile, String dbc, int numCases, int [] continuous){
            Bnet network = null;
            ArrayList<ArrayList<Integer>> complement;
            String header;
            String [] headers;
            ArrayList<String> temporalNodes = new ArrayList<String>();

            if (elv !=null){
                            try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                }catch(Exception e){e.printStackTrace();}
            }

            complement = BNUtilities.getCasosFromDBCFile(dbc,numCases);
            header = BNUtilities.getEncabezadoFromDBC(dbc);
            headers = new String[]{header,header};

            String [] parts=header.split(" ");
            for(int i = 0; i < continuous.length; ++i)
                temporalNodes.add(parts[continuous[i]]);

            BAPElvira bap = new BAPElvira();
            return bap.evaluateBrierTemporalPredictionError(network,complement,headers,transformedFile,temporalNodes,continuous);
        }
       
       /* Should only be used when both networks have the same instant nodes with the same values */
       public static double mseParameters(String originalElv, int [] tnoIndexes, String learnedElv, int [] tnlIndexes){
           double mse = 0.0;
           boolean add;
           
           try{
               Bnet original = new Bnet(new FileInputStream(originalElv));
               Bnet learned = new Bnet(new FileInputStream(learnedElv));
               
               NodeList originalInstantNodes = new NodeList();
               for(int i = 0; i < original.getNodeList().size(); ++i){
                   add = true;
                   for(int j = 0; j < tnoIndexes.length; ++j){
                       if(i == tnoIndexes[j]){
                           add = false;
                       }
                   }
                   if(add){
                    originalInstantNodes.insertNode(original.getNodeList().elementAt(i));
                   }
               }
               
               Configuration org = new Configuration(originalInstantNodes);
               double difference;
               int n = org.possibleValues();
               
               for(int i = 0; i < n; ++i){
                   difference = original.evaluateFullConfiguration(org) - learned.evaluateFullConfiguration(org);
                   mse += difference * difference;
                   
                   org.nextConfiguration();
               }
               
               return mse/n;
               
           }catch(Exception e){
               e.printStackTrace();
           }
           return Double.NEGATIVE_INFINITY;
       }
       
       /* Should only be used when both networks have the same instant nodes with the same values */
       public static double mseParameters(String originalElv, String learnedElv){
           double mse = 0.0;
           
           try{
               Bnet original = new Bnet(new FileInputStream(originalElv));
               Bnet learned = new Bnet(new FileInputStream(learnedElv));
               
               Configuration org = new Configuration(original.getNodeList());
               Configuration lnd = new Configuration(learned.getNodeList());
               double difference;
               int n = org.possibleValues();
               
               for(int i = 0; i < n; ++i){
                   /*System.out.println(org.toString());
                   System.out.println(lnd.toString());
                   System.out.println("Original > " + original.evaluateFullConfiguration(org));
                   System.out.println("Learned > " + learned.evaluateFullConfiguration(lnd));*/
                   difference = original.evaluateFullConfiguration(org) - learned.evaluateFullConfiguration(lnd);
                   //System.out.println("Difference > "+ difference);
                   mse += difference * difference;
                   
                   org.nextConfiguration();
                   lnd.nextConfiguration();
               }
               //System.out.println("MSE " + mse/(double)n);
               return mse/n;
               
           }catch(Exception e){
               e.printStackTrace();
           }
           return Double.NEGATIVE_INFINITY;
       }
       
       //deprecated
       /*public static double editDistance(String originalElv, String learnedElv){
           double distance = 0;
           
           try{
               Bnet original = new Bnet(new FileInputStream(originalElv));
               Bnet learned = new Bnet(new FileInputStream(learnedElv));
               LinkList originalConnections = original.getLinkList();
               LinkList learnedConnections = learned.getLinkList();
               
               LinkList difference = originalConnections.difference(learnedConnections);
               Link l;
               
               for(int i = 0; i < difference.size(); ++i){
                   l = difference.elementAt(i);
                   learnedConnections.removeLink(new Link(l.getHead(),l.getTail()));
               }
               
               distance = difference.size() + learnedConnections.difference(originalConnections).size();
               
           }catch(Exception e){
               e.printStackTrace();
           }
           
           return distance;
       }*/
       
       public static double editDistance(String originalElv, String learnedElv){
           try{
               Bnet original = new Bnet(new FileInputStream(originalElv));
               Bnet learned = new Bnet(new FileInputStream(learnedElv));
               
               TransferLearning learnedModel = new TransferLearning();
               learnedModel.setOutput(learned);
           
               LinkList addel[] = new LinkList[3];
               addel = learnedModel.compareOutput(original);
               
               return addel[0].size() + addel[1].size() + addel[2].size();     
            }catch(Exception e){
               e.printStackTrace();
               return Double.NEGATIVE_INFINITY;
            }
       }
       
       public static double intervalEditDistance(String originalElv, String learnedElv, String temporalNode){
           ArrayList<Temporal> original = new ArrayList<>();
           ArrayList<Temporal> learned = new ArrayList<>();
           String [] states;
           
           try{
               Bnet o = new Bnet(new FileInputStream(originalElv));
               Bnet l = new Bnet(new FileInputStream(learnedElv));
               
               FiniteStates n = (FiniteStates)o.getNode(temporalNode.replace(' ', '_'));
               states = n.getStringStates();
               
               int j = 0;
               for(int i = 0; i < states.length; ++i){
                   if(!states[i].equals("\"Default\"")){
                       original.add(j++,new Temporal(states[i].substring(1, states[i].length()-1),1));
                   }
               }
               
               n = (FiniteStates)l.getNode(temporalNode.replace(' ', '_'));
               states = n.getStringStates();
               
               j =0;
               for(int i = 0; i < states.length; ++i){
                   if(!states[i].equals("\"Default\"")){
                       learned.add(j++,new Temporal(states[i].substring(1, states[i].length()-1),1));
                   }
               }
               
               if(original.size() == learned.size()){
                   return getShifts(original,learned);
               } 
               else if(original.size() > learned.size()){
                   return mapIntervals(learned,original);
               } else {
                   return mapIntervals(original,learned);
               }

           }catch(Exception e){
               e.printStackTrace();
           } 
           return 0.0;
       }
       
       private static double getShifts(ArrayList<Temporal> original, ArrayList<Temporal> learned){
           double shifts = 0.0;
           ArrayList<Double> bounds = new ArrayList<>();
           double learnedUpper, learnedLower;
           
           for(int i = 0; i < learned.size(); ++i){
               learnedUpper = learned.get(i).getUpperBounds();
               learnedLower = learned.get(i).getLowerBounds();
               
               if(!bounds.contains(learnedUpper)){
                   shifts += Math.abs((original.get(i).getUpperBounds() - learnedUpper));
                   bounds.add(learnedUpper);
               }
               if(!bounds.contains(learnedLower)){
                   shifts += Math.abs((original.get(i).getLowerBounds() - learnedLower));
                   bounds.add(learnedLower);
               }
           }
           return shifts;
       }
       
       private static double mapIntervals(ArrayList<Temporal> original, ArrayList<Temporal> learned){
           double shifts, minShifts;
           ArrayList<Object []> c = Combinations.getSets(learned.toArray(new Temporal[learned.size()]), 0, learned.size(), 0, original.size());
           ArrayList<Temporal> chosen; 
           
           minShifts = getShifts(original,new ArrayList(Arrays.asList(c.get(0)))); 
           chosen = new ArrayList(Arrays.asList(c.get(0)));
           minShifts += getMissingRange(learned,chosen);
           
           for(int i = 1; i < c.size(); ++i){
               shifts = getShifts(original,new ArrayList(Arrays.asList(c.get(i))));
               chosen = new ArrayList(Arrays.asList(c.get(i)));
               shifts += getMissingRange(learned,chosen);
               if(shifts < minShifts){
                   minShifts = shifts;
               }
           }
           return minShifts;
       }
       
       private static double getMissingRange(ArrayList<Temporal> l1, ArrayList<Temporal> l2){
           double missing = 0.0;
           
           for(int i = 0; i < l1.size(); ++i){
               if(!l2.contains(l1.get(i))){
                   missing += (l1.get(i).getUpperBounds() - l1.get(i).getLowerBounds());
               }
           }
           return missing;
       }
       
       /*public static void main(String args[]){
           /*String original = "C:/Users/lfiedlerc/Dropbox/Thesis/New source code/TNBN TL V1/TNBN_TL_V1/Experiments with interval refinement/Different temporal range/10 target records/100pct aux/input files/Colision.elv";
           String learned = "C:/Users/lfiedlerc/Dropbox/Thesis/New source code/TNBN TL V1/TNBN_TL_V1/Experiments with interval refinement/Different temporal range/10 target records/100pct aux/refinement/partition1_model.elv";
           
           System.out.println(intervalEditDistance(original,learned,"Signos Vitales"));*/
           
        /*int [] continuous = new int[]{3,4};
        String elv;
        String testFileDBC;
        String testFile;
        Bnet learnedModel;
        int numTestCases = 2100;
        ArrayList<Temporal[]> intervals;
        double avgBrierScore = 0.0;
        double avgPrediction = 0.0;
        double avgTimeDifference = 0.0;
        int totalPartitions = 1;

                    elv = "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/partition0_model.elv";
                    testFileDBC = "partition0_Compliment";
                    testFile = "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/input files/partition0_Compliment.txt";

                    
                    try{
                        learnedModel = new Bnet(new FileInputStream(elv));
                        intervals = new ArrayList<Temporal[]>();
                        
                        for(int j = 0; j < continuous.length; ++j){
                            FiniteStates node = (FiniteStates)learnedModel.getNodeList().elementAt(continuous[j]);
                            String [] states = node.getStringStates();
                            Temporal [] t = new Temporal[states.length];
                            t[0] = new Temporal();
                            for(int k = 1; k < states.length; k++){
                                if(k < states.length - 1)
                                    t[k] = new Temporal(states[k].substring(1, states[k].length()-1),1);
                                else
                                    t[k] = new Temporal(states[k].substring(1, states[k].length()-1),2);
                            }
                            intervals.add(t);
                        }
                        int trainingRecords = 10;
                        int partition = 0;

                        avgBrierScore += EvaluateNetwork.brierScore(elv,"Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/" + testFileDBC + ".dbc", numTestCases, continuous);
                        //avgPrediction += EvaluateNetwork.evaluatePredictivePrecision(elv,"Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/" + testFileDBC + ".dbc", numTestCases, continuous);
                        avgTimeDifference += EvaluateNetwork.evaluateIntervals(elv, testFile, "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/" + testFileDBC + ".dbc", numTestCases, continuous);
                    }catch(Exception e){
                         e.printStackTrace();
                    }
        
        avgBrierScore /= totalPartitions;
                
                System.out.println("Score: " + avgBrierScore);
                System.out.println("Time difference> " + avgTimeDifference);
       }*/
       
       
       public static void main(String args[]){
           /*String original = "C:/Users/lfiedlerc/Dropbox/Thesis/New source code/TNBN TL V1/TNBN_TL_V1/Experiments with interval refinement/Different temporal range/10 target records/100pct aux/input files/Colision.elv";
           String learned = "C:/Users/lfiedlerc/Dropbox/Thesis/New source code/TNBN TL V1/TNBN_TL_V1/Experiments with interval refinement/Different temporal range/10 target records/100pct aux/refinement/partition1_model.elv";
           
           System.out.println(intervalEditDistance(original,learned,"Signos Vitales"));*/
           
            int [] continuous = new int[]{3,4};
            String elv, elv2;
            String testFileDBC;
            String testFile;
            Bnet learnedModel;
            int numTestCases = 2100;
            ArrayList<Temporal[]> intervals;
            double avgBrierScore = 0.0;
            double avgPrediction = 0.0;
            double avgTimeDifference = 0.0;
            int totalPartitions = 1;

            elv = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/Models built without transfer/TNBN_PC/U.S/model_0.0.elv";
            elv2 = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/Learn from 100pct/TNBN_TL/model_0.0.elv";
            
            System.out.println(editDistance(elv2,elv));
       }
}