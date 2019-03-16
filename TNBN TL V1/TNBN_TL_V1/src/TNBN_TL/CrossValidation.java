package TNBN_TL;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

public class CrossValidation{

	public static ArrayList<Integer []> generateDisjointPartitions(int totalRecords, int numPartitions){
		ArrayList<Integer []> partitions = new ArrayList<Integer []>(numPartitions);
		ArrayList<Integer> indexes = new ArrayList<Integer>(totalRecords);
		int size = totalRecords / numPartitions;
		Integer [] lastPartition;
		
		for(int i = 0; i < totalRecords; ++i)
			indexes.add(new Integer(i));
		
		for(int i = 0; i < numPartitions - 1; ++i){
			partitions.add(getPartition(indexes,size));
		}
		lastPartition = indexes.toArray(new Integer[indexes.size()]);
		Arrays.sort(lastPartition);
		partitions.add(lastPartition);
		
		return partitions;
	}
        
        public static ArrayList<Integer []> generateDisjointPartitionsOfSize(int size, int totalRecords, int numPartitions){
		ArrayList<Integer []> partitions = new ArrayList<Integer []>(numPartitions);
		ArrayList<Integer> indexes = new ArrayList<Integer>(totalRecords);
		
		for(int i = 0; i < totalRecords; ++i)
			indexes.add(new Integer(i));
		
		for(int i = 0; i < numPartitions; ++i){
			partitions.add(getPartition(indexes,size));
		}
		
		return partitions;
	}
	
	public static ArrayList<Integer []> generatePartitions(int totalRecords, int partitionSize, int numPartitions){
		ArrayList<Integer []> partitions = new ArrayList<Integer []>(numPartitions);
	
		for(int i = 0; i < numPartitions; ++i){
			ArrayList<Integer> indexes = new ArrayList<Integer>(totalRecords);
			for(int j = 0; j < totalRecords; ++j)
				indexes.add(new Integer(j));
			partitions.add(getPartition(indexes,partitionSize));
		}
		
		return partitions;
	}
        
        public static ArrayList<Integer[]> leaveOneOutPartitions(int totalRecords){
            ArrayList<Integer []> partitions = new ArrayList<>(totalRecords);
            for(int i = 0; i < totalRecords; ++i){
                partitions.add(new Integer[]{i});
            }
            return partitions;
        }
	
	public static Integer[] getPartition(ArrayList<Integer> indexes, int size){
		Integer [] partition = new Integer[size];
		Random r = new Random();
		int generated = 0;
		int number;
		
		for(int i = 0; i < size; ++i)
			partition[i] = new Integer(-1);
		
		while(generated < size){
			number = r.nextInt(indexes.size());
			partition[generated] = indexes.get(number);
			indexes.remove(number);
			generated++;
		}
		Arrays.sort(partition);
		return partition;
	}
	
	public static void writePartitionToFile(String originalFile, String dataFile, Integer [] indexes){
		String record;
		int index = 0;
		int i = 0;
		
		try{
			BufferedReader in = new BufferedReader(new FileReader(originalFile));
			BufferedWriter out = new BufferedWriter(new FileWriter(dataFile));
			
			while((record = in.readLine()) != null && i < indexes.length){
				if(i < indexes.length && index == indexes[i]){
					out.write(record);
					if(i < indexes.length - 1)
						out.newLine();
					i++;
				}
				index++;
			}
			in.close();
			out.close();
		} catch(Exception e){
                    e.printStackTrace();
                }
	}
	
	public static void writePartitionAndComplimentToFile(String originalFile, int numRecords, String dataFile, Integer [] indexes){
		String record;
		int index = 0;
		int i = 0;
		
		try{
                BufferedWriter out;
                BufferedWriter out2;
                    try (BufferedReader in = new BufferedReader(new FileReader(originalFile))) {
                        out = new BufferedWriter(new FileWriter(dataFile + ".txt"));
                        out2 = new BufferedWriter(new FileWriter(dataFile + "_Compliment.txt"));
                        while((record = in.readLine()) != null){
                                if(i < indexes.length && index == indexes[i]){
                                        out.write(record);
                                        if(i < indexes.length - 1)
                                                out.newLine();
                                        i++;
                                } else{
                                        out2.write(record);
                                        if(index < numRecords - 1)
                                            out2.newLine();
                                }
                                index++;
                        }
                    }
			out.close();
			out2.close();
		} catch(Exception e){
                    e.printStackTrace();
                }
	}
        
        public static void writeLeaveOneOutPartitionAndComplimentToFile(String originalFile, int numRecords, String dataFile, Integer [] indexes){
		String record;
		int index = 0;
		int i = 0;
		
		try{
                BufferedWriter out;
                BufferedWriter out2;
                    try (BufferedReader in = new BufferedReader(new FileReader(originalFile))) {
                        out2 = new BufferedWriter(new FileWriter(dataFile + ".txt"));
                        out = new BufferedWriter(new FileWriter(dataFile + "_Compliment.txt"));
                        while((record = in.readLine()) != null){
                                if(i < indexes.length && index == indexes[i]){
                                        out.write(record);
                                        if(i < indexes.length - 1)
                                                out.newLine();
                                        i++;
                                } else{
                                        out2.write(record);
                                        if(index < numRecords - 1)
                                            out2.newLine();
                                }
                                index++;
                        }
                    }
			out.close();
			out2.close();
		} catch(Exception e){
                    e.printStackTrace();
                }
	}
	
}