package com.example.CoffeeLounge.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.repository.UserRepository;

@Service
public class UserService {
    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User newUser) {
        return this.userRepository.save(newUser);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public User getById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteById(long id) {
        this.userRepository.deleteById(id);
    }

}
