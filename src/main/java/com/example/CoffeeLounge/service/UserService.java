package com.example.CoffeeLounge.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.CoffeeLounge.domain.Role;
import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.domain.dto.RegisterDTO;
import com.example.CoffeeLounge.repository.OrderRepository;
import com.example.CoffeeLounge.repository.ProductRepository;
import com.example.CoffeeLounge.repository.RoleRepository;
import com.example.CoffeeLounge.repository.UserRepository;

@Service
public class UserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private OrderRepository orderRepository;
    private ProductRepository productRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, OrderRepository orderRepository,
            ProductRepository productRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
    }

    public User handleSaveUser(User newUser) {
        return this.userRepository.save(newUser);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public User getById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.getRoleByName(name);
    }

    public User RegisterDTOtoUser(RegisterDTO registerDTO) {
        User newUser = new User();
        newUser.setEmail(registerDTO.getEmail());
        newUser.setFullName(registerDTO.getFullName());
        newUser.setPhone(registerDTO.getPhone());
        newUser.setPassword(registerDTO.getPassword());
        return newUser;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUser() {
        return this.userRepository.count();
    }

    public long countProduct() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

}
