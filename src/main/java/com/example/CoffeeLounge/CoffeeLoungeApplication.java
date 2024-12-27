package com.example.CoffeeLounge;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// @SpringBootApplication
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class CoffeeLoungeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoffeeLoungeApplication.class, args);
	}

}
