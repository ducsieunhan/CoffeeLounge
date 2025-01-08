package com.example.CoffeeLounge.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.CoffeeLounge.domain.Cart;
import com.example.CoffeeLounge.domain.CartDetail;
import com.example.CoffeeLounge.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);

    void deleteById(long id);
}
