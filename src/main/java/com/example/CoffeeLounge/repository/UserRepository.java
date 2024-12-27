package com.example.CoffeeLounge.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.CoffeeLounge.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User save(User newUser);

    List<User> findAll();

    User findById(long id);

    void deleteById(long id);
}
