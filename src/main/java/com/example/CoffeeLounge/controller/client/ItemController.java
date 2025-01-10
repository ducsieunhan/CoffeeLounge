package com.example.CoffeeLounge.controller.client;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.CoffeeLounge.domain.Cart;
import com.example.CoffeeLounge.domain.CartDetail;
import com.example.CoffeeLounge.domain.Order;
import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.service.ProductService;
import com.example.CoffeeLounge.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ItemController {
    private ProductService productService;
    private UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/product/{id}")
    private String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @GetMapping("/cart")
    private String getCartPage(Model model, HttpServletRequest request) {
        model.addAttribute("page_name", "Cart");
        User currentUser = new User();
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");

        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @GetMapping("/checkout")
    private String getCheckoutPage(Model model, HttpServletRequest request) {
        model.addAttribute("page_name", "Checkout");
        model.addAttribute("placeOrder", new Order());

        User currentUser = new User();
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");

        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");

        this.productService.handleProductToCart(email, id, session);
        return "redirect:/";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String DeleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        long cartDetailId = id;
        this.productService.deleteProductCart(cartDetailId, session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String postPlaceOrder(Model model, @ModelAttribute("placeOrder") @Valid Order order,
            BindingResult newUseBindingResult, HttpServletRequest request) {

        if (newUseBindingResult.hasErrors()) {
            return "client/cart/detail";
        }

        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getById(id);
        this.productService.handlePlaceOrder(currentUser, session, order);

        return "redirect:/checkout";
    }

}
