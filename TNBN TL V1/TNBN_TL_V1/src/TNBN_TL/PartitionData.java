package TNBN_TL;

import elvira.database.DataBaseCases;
import java.io.FileInputStream;
import java.util.ArrayList;

public class PartitionData{
	public static void main(String [] args){
                //partition_leaveOneOut_HIV();
            //partition_HIV();
            String file = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/Target DB.txt";
            String outputPath = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/10-fold CV 100 records/";
            int totalRecords = 2200;
            int numPartitions = 10;
            int partitionSize = 100;
            
            //partition_DB_disjoint(file, outputPath, totalRecords, numPartitions, partitionSize);
            partition_HIV();
	}
        
        public static void partition_DB_disjoint(String file, String outputPath, int totalRecords, int numPartitions, int partitionSize){
            try{    
                    ArrayList<Integer[]> partitions;
                    
                    partitions = CrossValidation.generateDisjointPartitionsOfSize(partitionSize,totalRecords,numPartitions);

                    for(int i = 0; i < partitions.size(); ++i){
                            CrossValidation.writePartitionAndComplimentToFile(file, totalRecords,outputPath + "partition" + i, partitions.get(i));
                    }
                } catch(Exception e){
                    e.printStackTrace();
                }
        }
        
        public static void partition_HIV(){
                try{    
                    ArrayList<Integer[]> partitions;
                    int totalRecords = 333;
                    int numPartitions = 10;
                    int partitionSize = 266;
                    
                    String file = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/Europe Combined DB.txt";
                    partitions = CrossValidation.generatePartitions(totalRecords, partitionSize, numPartitions);//CrossValidation.generateDisjointPartitionsOfSize(partitionSize, totalRecords, numPartitions);

                    for(int i = 0; i < partitions.size(); ++i){
                            CrossValidation.writePartitionAndComplimentToFile(file, totalRecords,"C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/10-fold CV 80pct/partition" + i, partitions.get(i));
                    }
                } catch(Exception e){
                    e.printStackTrace();
                }
	
        }
        
        public static void partition_leaveOneOut_HIV(){
                try{    
                    ArrayList<Integer[]> partitions;
                    int totalRecords = 333;
                    
                    String file = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/Europe Combined DB.txt";
                    partitions = CrossValidation.leaveOneOutPartitions(totalRecords);

                    for(int i = 0; i < partitions.size(); ++i){
                            CrossValidation.writeLeaveOneOutPartitionAndComplimentToFile(file, totalRecords,"C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/Leave 1 out CV/partition" + i, partitions.get(i));
                    }
                } catch(Exception e){
                    e.printStackTrace();
                }
	
        }
        
        public static void partition_Collision(){
            String dbcFile = "targetVarying Baseline Experiments/target.dbc";
                
                int [] intervalIndexes = {3,4};
                int numCases;
                try{
                    DataBaseCases db = new DataBaseCases(new FileInputStream(dbcFile));
                    numCases = db.getNumberOfCases();
                    
                    ArrayList<Integer[]> partitions;
                    int totalRecords = 2200;
                    int numPartitions = 5;
                    int partitionSize = 10;
                    
                    String cases = "C:/Users/lfiedlerc/Desktop/targetCases.txt";
                    String casesTransformed = "C:/Users/lfiedlerc/Desktop/targetCasesTransformed.txt";
                    String casesTransformedWithNumber = "C:/Users/lfiedlerc/Desktop/targetCasesTransformedWithNumber.txt";

                    ProcessFile.getDBCrecords(dbcFile, cases);
                    ProcessFile.transformDBCrecords(cases, casesTransformed, numCases, " ", db.getVariables());
                    ProcessFile.intervalToNumber(casesTransformed, casesTransformedWithNumber, intervalIndexes, numCases, " ");

                    partitions = CrossValidation.generateDisjointPartitionsOfSize(partitionSize, totalRecords, numPartitions);

                    for(int i = 0; i < partitions.size(); ++i){
                            CrossValidation.writePartitionAndComplimentToFile(casesTransformedWithNumber, totalRecords,"C:/Users/lfiedlerc/Desktop/partition" + i, partitions.get(i));
                    }
                } catch(Exception e){
                    e.printStackTrace();
                }
        }
}