package eel

public enum QuizType {
	MULTIPLE("Multiple Choice"),
	IDENTIFICATION("Identification"),
	TRUEORFALSE("True or False")
	
	String name
	
	QuizType(String name){
		this.name = name
	}
}
