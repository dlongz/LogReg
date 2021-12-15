package com.codingdojo.login_registration.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.login_registration.models.User;

@Repository
public interface UserRepository extends CrudRepository<User,Long>{
	List<User> findAll();
	
	User findByEmail(String email);
}
