package com.example.CoffeeLounge.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.CoffeeLounge.domain.Order;
import com.example.CoffeeLounge.domain.OrderDetail;
import com.example.CoffeeLounge.repository.OrderDetailRepository;
import com.example.CoffeeLounge.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    public Page<Order> fetchAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        // delete order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        this.orderRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }
}