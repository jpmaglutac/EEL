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
		HWPFDocument doc = new HWPFDocument(fs)
		WordExtractor we = new WordExtractor(doc)
		return we.getText()
	}
	
	def findRelatedLecture(quizItem){
		def minimumCommonLength = 5
		def lectures = Lecture.findAllByCourse(quizItem.quiz.course, [sort: "id", order: "asc"])
		if(lectures.size > 0){
			def relatedLecture = null
			def searchTerm = ""
			if(quizItem.quizType == QuizType.IDENTIFICATION)
				searchTerm = quizItem.correctAns
			else if(quizItem.quizType == QuizType.TRUEORFALSE)
				searchTerm = quizItem.question
			else
				searchTerm = QuizChoice.get(quizItem.correctAns).choice
			def commonLength = -1
			lectures.each {
				def lectureStr = readFile(it.file).toLowerCase()
				def substrLen = longestSubstr(searchTerm, lectureStr)
				if(substrLen >= commonLength){
					commonLength = substrLen
					relatedLecture = it
				}
			}
			if(commonLength >= minimumCommonLength){
				println "${quizItem} matches ${relatedLecture}"
				return relatedLecture
			}else
				return null
			
		}else{
			return null
		}
	}
	
	int longestSubstr(String first, String second) {
    	if (first == null || second == null || first.length() == 0 || second.length() == 0) {
        	return 0;
    	}
 
    	int maxLen = 0;
    	int fl = first.length();
    	int sl = second.length();
    	int[][] table = new int[fl][sl];
 
    	for (int i = 0; i < fl; i++) {
        	for (int j = 0; j < sl; j++) {
            	if (first.charAt(i) == second.charAt(j)) {
                	if (i == 0 || j == 0) {
                    	table[i][j] = 1;
                	}
                	else {
                    	table[i][j] = table[i - 1][j - 1] + 1;
                	}
                	if (table[i][j] > maxLen) {
                    	maxLen = table[i][j];
                	}
            	}
        	}
    	}
    	return maxLen;
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
