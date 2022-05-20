package com.lcomputerstudy.example.domain;

import java.util.List;

public class Submission {
	
	private int sub_num;
	private int s_num;
	private List<Response> questions ;
	private int count;
	
	public int getSub_num() {
		return sub_num;
	}
	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public List<Response> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Response> questions) {
		this.questions = questions;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	

}
