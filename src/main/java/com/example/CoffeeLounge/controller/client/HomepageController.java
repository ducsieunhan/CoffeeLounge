package com.example.CoffeeLounge.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.CoffeeLounge.service.ProductService;

@Controller
public class HomepageController {

    private ProductService productService;

    public HomepageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomepage(Model model) {
        model.addAttribute("products", this.productService.getAllProducts());

        return "client/homepage/show";
    }

}
