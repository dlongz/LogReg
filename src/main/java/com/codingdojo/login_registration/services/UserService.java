package com.codingdojo.login_registration.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.login_registration.models.User;
import com.codingdojo.login_registration.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	// Register user and hash password
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(),BCrypt.gensalt());
		user.setPassword(hashed);
		return this.userRepo.save(user);
	}
	
	// find user by email
	public User findByEmail(String email) {
		return this.userRepo.findByEmail(email);
	}
	
	// find user by id
	public User findUserById(Long id) {
		return this.userRepo.findById(id).orElse(null);
	}
	
	// authenticate user
	public boolean authenticationUser(String email, String password) {
		// first find the user by email
		User user = this.userRepo.findByEmail(email);
		// if we can't find it by email, return false
		if(user == null) {
			return false;
		} else {
			// if the passwords match, return true, else, return false
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
}
