package com.example.CoffeeLounge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.CoffeeLounge.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order save(Order order);

}
