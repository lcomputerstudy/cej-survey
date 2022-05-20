package com.lcomputerstudy.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Answer;
import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Response;
import com.lcomputerstudy.example.domain.ResultAnswer;
import com.lcomputerstudy.example.domain.Submission;
import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.mapper.SurveyMapper;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired SurveyMapper surveymapper;
	
	@Override
	public List<Survey> getsurveylist() {
		// TODO Auto-generated method stub
		return surveymapper.getsurveylist();
	}

	@Override
	public void insertSurvey(Survey survey) {
		surveymapper.insertSurvey(survey);
		
	}

	@Override
	public void insertQuestions(Question q) {
		surveymapper.insertQuestions(q);
		
	}

	@Override
	public void insertAnswers(Answer a) {
		surveymapper.insertAnswers(a);
		
	}

	@Override
	public Survey getSurveyDetail(int s_num) {
		// TODO Auto-generated method stub
		return surveymapper.getSurveyDetail(s_num);
	}

	@Override
	public List<Question> getQuestionDetail(int s_num) {
		// TODO Auto-generated method stub
		return surveymapper.getQuestionDetail(s_num);
	}

	@Override
	public List<Answer> getAnswerDetail(int q_num) {
		// TODO Auto-generated method stub
		return surveymapper.getAnswerDetail(q_num);
	}

	@Override
	public void insertSubmission(Submission submission) {
		surveymapper.insertSubmission(submission);
		
	}

	@Override
	public void insertResponse(Response r) {
		surveymapper.insertResponse(r);
		
	}

	@Override
	public void insertReAnswer(String a, int s_num, int q_num) {
		surveymapper.insertReAnswer(a, s_num, q_num);
		
	}

	@Override
	public List<Question> getResultQuestion(int s_num) {
		// TODO Auto-generated method stub
		return surveymapper.getResultQuestion(s_num);
	}

	@Override
	public List<String> getResultAnswers(int s_num, int q_num) {
		// TODO Auto-generated method stub
		return surveymapper.getResultAnswers(s_num, q_num);
	}

	@Override
	public List<Integer> getResultAnswersCount(int s_num, int q_num) {
		// TODO Auto-generated method stub
		return surveymapper.getResultAnswersCount(s_num, q_num);
	}

	@Override
	public void deleteSurvey(int s_num) {
		surveymapper.deleteSurvey(s_num);
		
	}

	@Override
	public List<Integer> getQ_num(int s_num) {
		// TODO Auto-generated method stub
		return surveymapper.getQ_num(s_num);
	}

	@Override
	public void deleteAnswers(int q) {
		surveymapper.deleteAnswers(q);
		
	}

	@Override
	public void deleteQuestions(int s_num) {
		surveymapper.deleteQuestions(s_num);
		
	}

	@Override
	public void deleteReAnswers(int s_num) {
		surveymapper.deleteReAnswers(s_num);
		
	}

	@Override
	public void deleteSubmission(int s_num) {
		surveymapper.deleteSubmission(s_num);
		
	}

	@Override
	public List<Integer> getSub_num(int s_num) {
		// TODO Auto-generated method stub
		return surveymapper.getSub_num(s_num);
	}

	@Override
	public void deleteResponse(int s_) {
		surveymapper.deleteResponse(s_);
		
	}

}
