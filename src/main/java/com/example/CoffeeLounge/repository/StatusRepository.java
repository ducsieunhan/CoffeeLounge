package com.example.CoffeeLounge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.CoffeeLounge.domain.Status;

@Repository
public interface StatusRepository extends JpaRepository<Status, Long> {
    Status getStatusByName(String name);

    Status getStatusById(long id);

}