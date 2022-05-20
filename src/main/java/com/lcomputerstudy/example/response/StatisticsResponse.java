package com.lcomputerstudy.example.response;

import java.util.List;

import com.lcomputerstudy.example.domain.Question;

public class StatisticsResponse {

	private int s_num;
	private List<Question> questions;

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	
	
	
}
