package com.example.CoffeeLounge.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {
    @Bean
    public ViewResolver viewResolver() {
        final InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/view/");
        bean.setSuffix(".jsp");
        return bean;
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.viewResolver(viewResolver());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/client/css/**").addResourceLocations("/resources/client/css/");
        registry.addResourceHandler("/client/js/**").addResourceLocations("/resources/client/js/");
        registry.addResourceHandler("/client/images/**").addResourceLocations("/resources/client/images/");
        registry.addResourceHandler("/admin/css/**").addResourceLocations("/resources/admin/css/");
        registry.addResourceHandler("/admin/js/**").addResourceLocations("/resources/admin/js/");
        registry.addResourceHandler("/admin/images/**").addResourceLocations("/resources/admin/images/");
        registry.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
    }
}