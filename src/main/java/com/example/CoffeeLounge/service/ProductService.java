package com.example.CoffeeLounge.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.CoffeeLounge.domain.Category;
import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.domain.Status;
import com.example.CoffeeLounge.repository.CategoryRepository;
import com.example.CoffeeLounge.repository.ProductRepository;
import com.example.CoffeeLounge.repository.StatusRepository;

@Service
public class ProductService {
    private ProductRepository productRepository;
    private StatusRepository statusRepository;
    private CategoryRepository categoryRepository;

    public ProductService(ProductRepository productRepository, StatusRepository statusRepository,
            CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.statusRepository = statusRepository;
        this.categoryRepository = categoryRepository;
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    public List<Category> getAllCategories() {
        return this.categoryRepository.findAll();
    }

    public Category getCategoryByName(String name) {
        return this.categoryRepository.getCategoryByName(name);
    }

    public Status getStatusByName(String name) {
        return this.statusRepository.getStatusByName(name);
    }

    public Category getCategoryById(long Id) {
        return this.categoryRepository.getCategoryById(Id);
    }

    public Status getStatusById(long Id) {
        return this.statusRepository.getStatusById(Id);
    }

    public void handleSaveProduct(Product newProduct) {
        this.productRepository.save(newProduct);
    }

    public Product getById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }
}
