package com.movie.service;

import com.movie.domain.User;

public interface UserService {

	void regist(User user) throws Exception;

	User active(String code) throws Exception;

	User login(String username, String password)throws Exception;

}
