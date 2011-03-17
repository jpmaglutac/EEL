package eel

import org.apache.poi.poifs.filesystem.*;
import org.apache.poi.hwpf.*;
import org.apache.poi.hwpf.extractor.*;
import java.io.*;

class FileReadingService {
	static transactional = true
	
	def readFile(uFile){
		def file = new File(uFile.path)
		def fs = new POIFSFileSystem(new FileInputStream(file))
		HWPFDocument doc = new HWPFDocument(fs);
		def range = doc.getRange()
		
		for(int i=0; i!= range.numParagraphs(); i++){
			println range.getParagraph(i).text()
			println "--------------------------"
		}
	}
}
