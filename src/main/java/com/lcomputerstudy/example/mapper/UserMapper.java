package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.domain.UserInfo;

@Mapper
public interface UserMapper {

	User readUser(String username);

	void createUser(User user);

	List<GrantedAuthority> readAuthorities(String username);

	void createAuthority(User user);

	UserInfo readUser_refresh(String username);

	List<UserInfo> read_user_list();

	void deleteAuth(String username);


}
