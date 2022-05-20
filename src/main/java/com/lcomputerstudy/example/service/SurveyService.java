package com.lcomputerstudy.example.service;

import java.util.List;

import com.lcomputerstudy.example.domain.Answer;
import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Response;
import com.lcomputerstudy.example.domain.ResultAnswer;
import com.lcomputerstudy.example.domain.Submission;
import com.lcomputerstudy.example.domain.Survey;

public interface SurveyService {

	public List<Survey> getsurveylist();

	public void insertSurvey(Survey survey);

	public void insertQuestions(Question q);

	public void insertAnswers(Answer a);

	public Survey getSurveyDetail(int s_num);

	public List<Question> getQuestionDetail(int s_num);

	public List<Answer> getAnswerDetail(int q_num);

	public void insertSubmission(Submission submission);

	public void insertResponse(Response r);

	public void insertReAnswer(String a, int s_num, int q_num);

	public List<Question> getResultQuestion(int s_num);

	public List<String> getResultAnswers(int s_num, int q_num);

	public List<Integer> getResultAnswersCount(int s_num, int q_num);

	public void deleteSurvey(int s_num);

	public List<Integer> getQ_num(int s_num);

	public void deleteAnswers(int q);

	public void deleteQuestions(int s_num);

	public void deleteReAnswers(int s_num);

	public void deleteSubmission(int s_num);

	public List<Integer> getSub_num(int s_num);

	public void deleteResponse(int s_);
}
