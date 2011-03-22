package eel

import org.apache.poi.poifs.filesystem.*;
import org.apache.poi.hwpf.*;
import org.apache.poi.hwpf.extractor.*;
import java.io.*;
import java.util.regex.*;

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
	
	def saveDefinitions(lecture){
		def file = new File(lecture.file.path)
		def fs = new POIFSFileSystem(new FileInputStream(file))
		HWPFDocument doc = new HWPFDocument(fs);
		def range = doc.getRange()
		def dash = Pattern.compile(/\s+[\-\–]\s*/);
		def colon = Pattern.compile(/\s*\:\s+/);
		def identifier = ""
		def definition = ""
		def amountUntilInvalid = 3
		def ctr = 0
		def stringsForDefinition = 5
		
		for(int i=0; i!= range.numParagraphs(); i++){
			def par = range.getParagraph(i).text()
 			def dashMatcher = dash.matcher(par)
			def colonMatcher = colon.matcher(par)
			
			def startOfDefinition = 0
			
			//check dash
			if(dashMatcher.find()){
				identifier = par.substring(0,dashMatcher.start())
				startOfDefinition = dashMatcher.end()
				ctr = 0
			}
			//check colon
			else if(colonMatcher.find()){
				identifier = par.substring(0,colonMatcher.start())
				startOfDefinition = colonMatcher.end()
				ctr = 0
			}
			//check words
			else if(par.split(' ').length <= stringsForDefinition&&par.trim().length()>0){
				identifier = new String(par.trim())
				startOfDefinition = par.length()
				ctr = 0
			}
			//check definition
			if(identifier.length()>0&&startOfDefinition!=par.length()){
				definition = par.substring(startOfDefinition)
				if(definition.trim().length()==0){
					ctr++
					if(ctr==amountUntilInvalid)
						identifier = ""
				}else{
					//remove instances of the identifier
					definition = definition.replaceAll(/(?i)\Q${identifier.toLowerCase()}\E/, "")
					//get the first sentence
					if(definition.indexOf(".")>1)
						definition = definition.substring(0, definition.indexOf("."))
					//remove extra whitespaces
					definition = definition.trim()
					//capitalize first letter
					definition = definition.substring(0,1).toUpperCase()+definition.substring(1)
					println "identifier: ${identifier}"
					println "definition: ${definition}"
					def lectureDefinition = new LectureDefinition()
					lectureDefinition.identifier = identifier
					lectureDefinition.definition = definition
					lectureDefinition.lecture = lecture
					lectureDefinition.save(flush: true)
					identifier = ""
				}
			}
			
		}
	}
}
