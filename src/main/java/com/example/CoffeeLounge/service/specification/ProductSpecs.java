package com.example.CoffeeLounge.service.specification;

import org.springframework.data.jpa.domain.Specification;

import com.example.CoffeeLounge.domain.Category;
import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.domain.Product_;

import jakarta.persistence.criteria.Join;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> categoryName(String category) {
        return (root, query, criteriaBuilder) -> {
            Join<Category, Product> categoryProduct = root.join("category");
            return criteriaBuilder.like(categoryProduct.get("name"), "%" + category + "%");
        };
    }

    public static Specification<Product> priceIn(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(criteriaBuilder.gt(root.get(Product_.price), min),
                criteriaBuilder.le(root.get(Product_.price), max));
    }
}
