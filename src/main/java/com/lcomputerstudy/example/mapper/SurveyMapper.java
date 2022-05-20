package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lcomputerstudy.example.domain.Answer;
import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Response;
import com.lcomputerstudy.example.domain.ResultAnswer;
import com.lcomputerstudy.example.domain.Submission;
import com.lcomputerstudy.example.domain.Survey;

@Mapper
public interface SurveyMapper {

	List<Survey> getsurveylist();

	void insertSurvey(Survey survey);

	void insertQuestions(Question q);

	void insertAnswers(Answer a);

	Survey getSurveyDetail(int s_num);

	List<Question> getQuestionDetail(int s_num);

	List<Answer> getAnswerDetail(int q_num);

	void insertSubmission(Submission submission);

	void insertResponse(Response r);

	void insertReAnswer(@Param("a") String a, @Param("s_num") int s_num, @Param("q_num") int q_num);

	List<Question> getResultQuestion(int s_num);

	List<String> getResultAnswers(@Param("s_num") int s_num, @Param("q_num") int q_num);

	List<Integer> getResultAnswersCount(@Param("s_num") int s_num, @Param("q_num") int q_num);

	void deleteSurvey(int s_num);

	List<Integer> getQ_num(int s_num);

	void deleteAnswers(int q);

	void deleteQuestions(int s_num);

	void deleteReAnswers(int s_num);

	void deleteSubmission(int s_num);

	List<Integer> getSub_num(int s_num);

	void deleteResponse(int s_);

}
