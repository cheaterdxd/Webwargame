package generalFunction;

import java.util.Random;

public class GenerateRandomCodeValid {
	public static String generate() {
		String code;
		Random rand = new Random();
		int rand_int = rand.nextInt(1000000);
		code = String.valueOf(rand_int);
		return code;
	}
}
