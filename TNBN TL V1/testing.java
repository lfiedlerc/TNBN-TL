import java.util.Random;

public class testing{
	public static void main(String args[]){
		Random r = new Random();
		
		for(int i = 0; i < 10; ++i)
			System.out.println(r.nextInt(10));
	}
}