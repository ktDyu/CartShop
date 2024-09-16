package com.demo.service;

import com.demo.model.Category;
import com.demo.model.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {
    List<Product> list = new ArrayList<>();

    public List<Product> getAll(){
        return list;
    }

    public Product findById(int id) {
        for(Product p : list){
            if(p.getId() == id) return p;
        }
        return null;
    }
}
