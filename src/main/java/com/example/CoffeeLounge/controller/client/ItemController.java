package com.example.CoffeeLounge.controller.client;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
import com.example.CoffeeLounge.domain.Product_;
import com.example.CoffeeLounge.domain.User;
import com.example.CoffeeLounge.domain.dto.ProductCriteriaDTO;
import com.example.CoffeeLounge.service.ProductService;
import com.example.CoffeeLounge.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

    @GetMapping("/thank-you")
    private String getThankYouPage(Model model) {
        model.addAttribute("page_name", "Thankyou");

        return "client/cart/thankyou";
    }

    @GetMapping("/shop")
    private String getShowProductPage(Model model, ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        model.addAttribute("page_name", "Shop");

        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            }
        } catch (Exception e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 6);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("price-asc")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("price-desc")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent()
                : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);

        model.addAttribute("categories", this.productService.getAllCategories());
        model.addAttribute("top_products", this.productService.getByTop5());
        model.addAttribute("currentPage", page);

        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("totalSize", prs.getTotalElements());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }

    @GetMapping("/order-history")
    private String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");

        currentUser.setId(id);
        model.addAttribute("page_name", "History");
        model.addAttribute("orders", this.productService.getAllOrders(currentUser));
        return "client/cart/history";
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
    public String addProductToCart(@PathVariable long id, HttpServletRequest request,
            @RequestParam(value = "quantity", required = false) Integer quantity) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        if (quantity == null) {
            this.productService.handleProductToCart(email, id, session, 1);
        } else {
            this.productService.handleProductToCart(email, id, session, quantity);
        }
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

        return "redirect:/thank-you";
    }

}
