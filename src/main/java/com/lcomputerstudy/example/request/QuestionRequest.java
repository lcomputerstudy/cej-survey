package com.lcomputerstudy.example.request;

import java.util.List;

public class QuestionRequest {
	
	private String q;
	private List<AnswerRequest> answers;
	
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public List<AnswerRequest> getAnswers() {
		return answers;
	}
	public void setAnswers(List<AnswerRequest> answers) {
		this.answers = answers;
	}
	
	
}
