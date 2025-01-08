package com.example.CoffeeLounge.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.domain.dto.RegisterDTO;
import com.example.CoffeeLounge.service.UserService;

import jakarta.validation.Valid;

@Controller
public class AuthController {

    private UserService userService;
    private PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/auth/register")
    public String getRegister(Model model) {
        model.addAttribute("page_name", "Register");
        model.addAttribute("newUser", new RegisterDTO());
        return "client/auth/register";
    }

    @GetMapping("/login")
    public String getLogin(Model model) {
        model.addAttribute("page_name", "My Account");
        model.addAttribute("loginUser", new User());

        return "client/auth/login";
    }

    @PostMapping("/register")
    public String handleRegister(Model model, @ModelAttribute("newUser") @Valid RegisterDTO ducsieunhan,
            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("page_name", "Register Account");
            return "client/auth/register";
        }

        User newUser = this.userService.RegisterDTOtoUser(ducsieunhan);
        newUser.setPassword(this.passwordEncoder.encode(newUser.getPassword()));
        newUser.setRole(this.userService.getRoleByName("USER"));

        this.userService.handleSaveUser(newUser);
        return "redirect:/auth/login";

    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        model.addAttribute("page_name", "Access Deny");

        return "client/auth/deny";
    }
}
