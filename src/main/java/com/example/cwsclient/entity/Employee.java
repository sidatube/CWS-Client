package com.example.cwsclient.entity;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class Employee {
    private int id;
    private String name;
    private BigDecimal salary;
}
