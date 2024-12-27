package com.example.CoffeeLounge.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.service.UserService;

import jakarta.validation.Valid;

@Controller
public class AuthController {

    private UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String getRegister(Model model) {
        model.addAttribute("page_name", "Register");
        model.addAttribute("newUser", new User());
        return "client/auth/register";
    }

    @GetMapping("/login")
    public String getLogin(Model model) {
        model.addAttribute("page_name", "Register");
        return "client/auth/login";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("newUser") User ducsieunhan) {
        System.out.println("run: " + ducsieunhan);
        this.userService.handleSaveUser(ducsieunhan);
        return "redirect:/admin/user";

    }
}

// @RestController
// public class UserController {

// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("/")
// public String getHomePage() {
// return this.userService.handleHello();
// }

// }