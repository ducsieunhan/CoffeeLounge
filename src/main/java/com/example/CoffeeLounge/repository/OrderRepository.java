package com.example.CoffeeLounge.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.CoffeeLounge.domain.Order;
import com.example.CoffeeLounge.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order save(Order order);

    List<Order> findAllByUser(User user);

    Page<Order> findAll(Pageable pageable);
}
