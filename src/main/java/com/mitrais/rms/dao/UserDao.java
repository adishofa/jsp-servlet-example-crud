package com.mitrais.rms.dao;

import java.util.Optional;

import com.mitrais.rms.model.User;

public interface UserDao extends Dao<User, Long> {

	Optional<User> findByUserName(String userName);
	
	boolean validateLogin(String userName, String password);
	
	Optional<User> userSession(String userName);
	
}
