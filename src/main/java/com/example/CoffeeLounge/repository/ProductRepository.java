package com.example.CoffeeLounge.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.CoffeeLounge.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findAll();

    Product save(Product newProduct);

    Product findById(long id);

    void deleteById(long id);

    Page<Product> findAll(Pageable pageable);

    List<Product> findTop5ByOrderBySoldAsc();
}
