package com.example.CoffeeLounge.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {

    @GetMapping("/product/{id}")
    private String getDetailProductPage(Model model, @PathVariable long id) {
        return "client/product/detail";
    }
}
