package com.reactive.webflux.controllers;

import com.reactive.webflux.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.reactive.webflux.repositories.CustomerRepository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/api/v1/customers")
public class CustomerController {
    
    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping
    public Flux<Customer> listOfCustomer() {
        return customerRepository.findAll();
    }

    @PostMapping
    public Mono<Customer> saveCustomer(@RequestBody Customer customer) {
        return customerRepository.save(customer);
    }
}
