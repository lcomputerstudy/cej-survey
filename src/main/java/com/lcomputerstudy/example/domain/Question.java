package com.lcomputerstudy.example.domain;

import java.util.List;

public class Question {

	private int s_num;
	private int q_num;
	private String q;
	private List<Answer> answers;
	private List<String> resultAnswers;
	private List<Integer> resultCount;
	private String t;
	private int rownum;
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public List<String> getResultAnswers() {
		return resultAnswers;
	}
	public void setResultAnswers(List<String> resultAnswers) {
		this.resultAnswers = resultAnswers;
	}
	public List<Integer> getResultCount() {
		return resultCount;
	}
	public void setResultCount(List<Integer> resultCount) {
		this.resultCount = resultCount;
	}
	
}
