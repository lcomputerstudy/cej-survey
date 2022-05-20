package com.lcomputerstudy.example.request;

import java.util.List;

public class SurveyRequest {

	private String title;
	private String disc;
	private List<QuestionRequest> questions;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDisc() {
		return disc;
	}
	public void setDisc(String disc) {
		this.disc = disc;
	}
	public List<QuestionRequest> getQuestions() {
		return questions;
	}
	public void setQuestions(List<QuestionRequest> questions) {
		this.questions = questions;
	}

	
}
