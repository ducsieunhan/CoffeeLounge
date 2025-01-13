package com.example.CoffeeLounge.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.service.UserService;

import jakarta.validation.Valid;

@Controller
public class UserController {

    private UserService userService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;

        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {

        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<User> prs = this.userService.getAllUsers(pageable);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("users", prs.getContent());

        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserPage(Model model, @PathVariable long id) {
        model.addAttribute("page_name", "User Detail");
        User user = this.userService.getById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        model.addAttribute("page_name", "User Update");
        User currentUser = this.userService.getById(id);
        model.addAttribute("updateUser", currentUser);
        model.addAttribute("id", id);

        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(@ModelAttribute("updateUser") User ducsieunhan) {
        User user = this.userService.getById(ducsieunhan.getId());
        user.setFullName(ducsieunhan.getFullName());
        user.setPhone(ducsieunhan.getPhone());
        user.setRole(this.userService.getRoleByName(ducsieunhan.getRole().getName()));
        this.userService.handleSaveUser(user);

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("page_name", "Delete User");
        User currentUser = this.userService.getById(id);
        model.addAttribute("deleteUser", currentUser);
        model.addAttribute("id", id);

        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(@ModelAttribute("deleteUser") User ducsieunhan) {

        this.userService.deleteById(ducsieunhan.getId());

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postCreateNewUser(@ModelAttribute("newUser") @Valid User ducsieunhan,
            BindingResult newUseBindingResult) {

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUseBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        ducsieunhan.setRole(this.userService.getRoleByName(ducsieunhan.getRole().getName()));

        ducsieunhan.setPassword(passwordEncoder.encode(ducsieunhan.getPassword()));

        this.userService.handleSaveUser(ducsieunhan);

        return "redirect:/admin/user";
    }

}
