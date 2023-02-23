package com.reactive.webflux.entities;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import lombok.Data;

@Table("customers")
@Data
public class Customer {
    @Id
    private Integer id;

    private String name;
}
