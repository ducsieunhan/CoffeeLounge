package com.example.CoffeeLounge.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.CoffeeLounge.domain.Cart;
import com.example.CoffeeLounge.domain.Status;
import com.example.CoffeeLounge.domain.User;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
