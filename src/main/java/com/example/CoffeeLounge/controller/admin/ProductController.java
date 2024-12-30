package com.example.CoffeeLounge.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.CoffeeLounge.domain.Product;
import com.example.CoffeeLounge.service.ProductService;
import com.example.CoffeeLounge.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private ProductService productService;
    private UploadService uploadService;

    public ProductController(ProductService prouductService, UploadService uploadService) {
        this.productService = prouductService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        model.addAttribute("products", this.productService.getAllProducts());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        model.addAttribute("categories", this.productService.getAllCategories());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postCreateNewProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newUseBindingResult,
            @RequestParam("ducsieunhan") MultipartFile file) {

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUseBindingResult.hasErrors()) {
            model.addAttribute("categories", this.productService.getAllCategories());
            return "admin/product/create";
        }

        product.setImage(this.uploadService.handleSaveUploadFile(file, "product"));
        product.setStatus(this.productService.getStatusByName(product.getStatus().getName()));
        product.setCategory(this.productService.getCategoryByName(product.getCategory().getName()));
        product.setSold(0);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailpage(Model model, @PathVariable long id) {
        Product product = this.productService.getById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        model.addAttribute("status", this.productService.getStatusById(id).getName());
        model.addAttribute("category", this.productService.getCategoryById(id).getName());

        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getProductUpdatePage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getById(id);
        model.addAttribute("updateProduct", currentProduct);
        model.addAttribute("id", id);

        model.addAttribute("categories", this.productService.getAllCategories());

        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newUseBindingResult,
            @RequestParam("ducsieunhan") MultipartFile file) {

        List<FieldError> errors = newUseBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUseBindingResult.hasErrors()) {
            model.addAttribute("categories", this.productService.getAllCategories());
            return "admin/product/update";
        }

        product.setImage(this.uploadService.handleSaveUploadFile(file, "product"));
        product.setStatus(this.productService.getStatusByName(product.getStatus().getName()));
        product.setCategory(this.productService.getCategoryByName(product.getCategory().getName()));
        product.setSold(0);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getById(id);
        model.addAttribute("deleteProduct", currentProduct);
        model.addAttribute("id", id);

        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(@ModelAttribute("deleteProduct") Product ducsieunhan) {

        this.productService.deleteById(ducsieunhan.getId());

        return "redirect:/admin/product";
    }

}
