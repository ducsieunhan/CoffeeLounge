package com.example.CoffeeLounge.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.CoffeeLounge.domain.Cart;
import com.example.CoffeeLounge.domain.CartDetail;
import com.example.CoffeeLounge.domain.Category;
import com.example.CoffeeLounge.domain.Order;
import com.example.CoffeeLounge.domain.OrderDetail;
import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.domain.Status;
import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.repository.CartDetailRepository;
import com.example.CoffeeLounge.repository.CartRepository;
import com.example.CoffeeLounge.repository.CategoryRepository;
import com.example.CoffeeLounge.repository.OrderDetailRepository;
import com.example.CoffeeLounge.repository.OrderRepository;
import com.example.CoffeeLounge.repository.ProductRepository;
import com.example.CoffeeLounge.repository.StatusRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private ProductRepository productRepository;
    private StatusRepository statusRepository;
    private CategoryRepository categoryRepository;
    private CartRepository cartRepository;
    private CartDetailRepository cartDetailRepository;
    private UserService userService;
    private OrderRepository orderRepository;
    private OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, StatusRepository statusRepository,
            CategoryRepository categoryRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.statusRepository = statusRepository;
        this.categoryRepository = categoryRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
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

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public List<Order> getAllOrders(User user) {
        return this.orderRepository.findAllByUser(user);
    }

    public void handleProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            // save cart_detail
            // tìm product by id

            Product realProduct = this.productRepository.findById(productId);
            CartDetail cartExist = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

            if (realProduct != null) {
                if (cartExist != null) {
                    cartExist.setQuantity(cartExist.getQuantity() + 1);
                    cartExist.setPrice(realProduct.getPrice());
                    this.cartDetailRepository.save(cartExist);
                } else {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);
                    this.cartDetailRepository.save(cd);

                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    cart = this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                }

            }

        }
    }

    public void deleteProductCart(long id, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(id);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart cart = cartDetail.getCart();

            this.cartDetailRepository.deleteById(id);

            if (cart.getSum() > 1) {
                int s = cart.getSum() - 1;
                cart.setSum(s);
                session.setAttribute("sum", s);
            } else if (cart.getSum() == 1) {
                this.cartRepository.deleteById(cart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    @Transactional
    public void handlePlaceOrder(User user, HttpSession session, Order order) {
        Cart cart = this.cartRepository.findByUser(user);

        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {
                order.setUser(user);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotal(sum);
                order = this.orderRepository.save(order);

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }

                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                cart.setSum(0);
                this.cartRepository.save(cart);

                session.setAttribute("sum", 0);
            }
        }
    }

}