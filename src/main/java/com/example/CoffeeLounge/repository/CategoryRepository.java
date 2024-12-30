package com.example.CoffeeLounge.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.CoffeeLounge.domain.Category;
import com.example.CoffeeLounge.domain.Status;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    Category getCategoryByName(String name);

    List<Category> findAll();

    Category getCategoryById(long id);

}
