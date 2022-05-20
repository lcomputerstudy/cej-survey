package com.lcomputerstudy.example.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lcomputerstudy.example.config.JwtUtils;
import com.lcomputerstudy.example.domain.Answer;
import com.lcomputerstudy.example.domain.Question;
import com.lcomputerstudy.example.domain.Response;
import com.lcomputerstudy.example.domain.ResultAnswer;
import com.lcomputerstudy.example.domain.Submission;
import com.lcomputerstudy.example.domain.Survey;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.domain.UserInfo;
import com.lcomputerstudy.example.request.JoinRequest;
import com.lcomputerstudy.example.request.LoginRequest;
import com.lcomputerstudy.example.response.JwtResponse;
import com.lcomputerstudy.example.response.StatisticsResponse;
import com.lcomputerstudy.example.service.SurveyService;
import com.lcomputerstudy.example.service.UserService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/public")
public class PublicController {
	
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
	
	@PostMapping("/signin")
	public ResponseEntity<?> authenticateUser(@Validated @RequestBody LoginRequest loginRequest) {
		logger.info("test"+ loginRequest);
		
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		User user = (User) authentication.getPrincipal();
		logger.info("dddd"+authentication.getPrincipal());
		List<String> roles = user.getAuthorities().stream()
				.map(item -> item.getAuthority())
				.collect(Collectors.toList());
		
		return ResponseEntity.ok(new JwtResponse(jwt,
												user.getUsername(),
												user.getName(),
												roles));
	}
	
	@PostMapping("/signup")
	public ResponseEntity<?> signupUser(@Validated @RequestBody JoinRequest joinRequest) {
		
		String encodedPassword = new BCryptPasswordEncoder().encode(joinRequest.getPassword());
		
		User user = new User();
		
		user.setUsername(joinRequest.getUsername());
		user.setName(joinRequest.getName());
		user.setPassword(encodedPassword);
		user.setPhone(joinRequest.getPhone());
		user.setIsAccountNonExpired(true);
		user.setIsEnabled(true);
		user.setIsAccountNonLocked(true);
		user.setIsCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		
		userService.createUser(user);
		userService.createAuthority(user);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@GetMapping("/unpackToken")
	public ResponseEntity<?> unpackToken(HttpServletRequest request) {
		String token = new String();
		token = request.getHeader("Authorization");
		
		if(StringUtils.hasText(token) && token.startsWith("Bearer ")) {
			token = token.substring(7, token.length());
		}
		
		String username = jwtUtils.getUserEmailFromToken(token);
		UserInfo user = userService.readUser_refresh(username);
		
		List<String> roles = userService.getAuthorities(username).stream()
				.map(item -> item.getAuthority())
				.collect(Collectors.toList());
		
		return ResponseEntity.ok(new JwtResponse(request.getHeader("Authorization"),
																	user.getUsername(),
																	user.getName(),
																	roles));
	}
	
	@GetMapping("/surveylist")
	public ResponseEntity<?> getSurveyList(HttpServletRequest request) {

		List<Survey> list = surveyService.getsurveylist();
		
			return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/survey")
	public ResponseEntity<?> getSurveyDetail(@Validated int s_num) {
		
		Survey survey = surveyService.getSurveyDetail(s_num);
		List<Question> questions = surveyService.getQuestionDetail(s_num);
		for(Question q : questions) {
			int q_num = q.getQ_num();
			List<Answer> answers = surveyService.getAnswerDetail(q_num);
			q.setAnswers(answers);
		}
		
		Survey surveyDetail = new Survey();
		surveyDetail.setS_num(survey.getS_num());
		surveyDetail.setTitle(survey.getTitle());
		surveyDetail.setDisc(survey.getDisc());
		surveyDetail.setWriter(survey.getWriter());
		surveyDetail.setDatetime(survey.getDatetime());
		surveyDetail.setHit(survey.getHit());
		surveyDetail.setQuestions(questions);

		return new ResponseEntity<>(surveyDetail, HttpStatus.OK);
	}
	
	@PostMapping("/survey-answers")
	public ResponseEntity<?> submitSurveyAnswers(@Validated @RequestBody Submission submission ) {
		

		surveyService.insertSubmission(submission);
		for(Response r : submission.getQuestions()) {
			surveyService.insertResponse(r);
			for(String a: r.getAnswers()) {
				if(a != null)
					surveyService.insertReAnswer(a, submission.getS_num(), r.getQ_num());
			}
		}
		
			
		return new ResponseEntity<>("ok", HttpStatus.OK);
		
	}
	
	@GetMapping("/survey-answers")
	public ResponseEntity<?> getSurveyAnswers(@Validated int s_num ) {
		

		StatisticsResponse result = new StatisticsResponse();
		result.setS_num(s_num);
		List<Question> q_ = surveyService.getResultQuestion(s_num);
		for(Question q : q_) {
			List<String> a = surveyService.getResultAnswers(s_num, q.getQ_num());
			List<Integer> aCount = surveyService.getResultAnswersCount(s_num, q.getQ_num());
			q.setResultAnswers(a);
			q.setResultCount(aCount);
		}
		result.setQuestions(q_);
			
		return new ResponseEntity<>(result, HttpStatus.OK);
		
	}

}
