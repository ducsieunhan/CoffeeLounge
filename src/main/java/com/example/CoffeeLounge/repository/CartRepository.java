package com.example.CoffeeLounge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.CoffeeLounge.domain.Cart;
import com.example.CoffeeLounge.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

    void deleteById(long id);

    void deleteByUser(User user);
}
