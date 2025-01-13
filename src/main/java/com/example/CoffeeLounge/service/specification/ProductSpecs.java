package com.example.CoffeeLounge.service.specification;

import org.springframework.data.jpa.domain.Specification;

import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }
}
