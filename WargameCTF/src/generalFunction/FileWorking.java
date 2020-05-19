package generalFunction;

import java.io.File;

public class FileWorking {
	public static void deleteFile(String path) {
		File file = new File(path);
		file.delete();
	}
}
