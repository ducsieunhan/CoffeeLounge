package com.example.CoffeeLounge.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.CoffeeLounge.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashboardController {
    private UserService userService;

    public DashboardController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashBoardPage(Model model) {
        model.addAttribute("users", this.userService.countUser());
        model.addAttribute("products", this.userService.countProduct());
        model.addAttribute("orders", this.userService.countOrders());

        return "admin/dashboard/show";
    }

}
