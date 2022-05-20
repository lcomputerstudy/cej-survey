package com.lcomputerstudy.example.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lcomputerstudy.example.config.JwtUtils;
import com.lcomputerstudy.example.domain.Answer;
import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Response;
import com.lcomputerstudy.example.domain.Submission;
import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.request.SurveyRequest;
import com.lcomputerstudy.example.service.SurveyService;
import com.lcomputerstudy.example.service.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	AuthenticationManager authenticationManager;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	JwtUtils jwtUtils;
	
	@Autowired
	UserService userService;
	@Autowired
	SurveyService surveyService;
	
	@Autowired
	ServletContext context;
	
	@PostMapping("/survey")
	public ResponseEntity<?> writeSurvey(HttpServletRequest request, @Validated @RequestBody Survey survey ) {
		
		String token = new String();
		token = request.getHeader("Authorization");
		
		if(StringUtils.hasText(token) && token.startsWith("Bearer ")) {
			token = token.substring(7, token.length());
		}
		String username = jwtUtils.getUserEmailFromToken(token);
		
		survey.setWriter(username);
		surveyService.insertSurvey(survey);
		for(Question q : survey.getQuestions()) {
			surveyService.insertQuestions(q);
			if(q.getAnswers().size() != 0) {
				for(Answer a: q.getAnswers()) {
					surveyService.insertAnswers(a);
				}
			}
		}
		
		List<Survey> list = surveyService.getsurveylist();
			
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	@DeleteMapping("/survey")
	public ResponseEntity<?> deleteSurvey(HttpServletRequest request, @Validated int s_num ) {
		
		String token = new String();
		token = request.getHeader("Authorization");
		
		if(StringUtils.hasText(token) && token.startsWith("Bearer ")) {
			token = token.substring(7, token.length());
		}
		String username = jwtUtils.getUserEmailFromToken(token);
		
		Survey s = surveyService.getSurveyDetail(s_num);
		if(s.getWriter().equals(username) || request.isUserInRole("ROLE_ADMIN")) {

			surveyService.deleteSurvey(s_num);
			
			List<Survey> list = surveyService.getsurveylist();
			
			return new ResponseEntity<>(list, HttpStatus.OK);
			
		}
		
		else return new ResponseEntity<>("fail", HttpStatus.FORBIDDEN);
	
	}
	
}
