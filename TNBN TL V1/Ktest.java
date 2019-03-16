import java.util.ArrayList;

public class Ktest{
	public static void main(String [] args){
		Kmeans kmeans = new Kmeans();
		String archivoOrigTabla = "data files/vihdata(no header).txt";
		int entero = 9;
		int numIntervalos = 3;
		double porcentajeEliminarExtremos = 1;
		IntervalSet result;
		ArrayList<String> intervals;
		
		result = kmeans.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos);
		
		intervals = result.intervalsToString();
		
		System.out.println("\n");
		
		for(int i = 0; i < intervals.size(); ++i){
			System.out.println(intervals.get(i));
		}
	}
}