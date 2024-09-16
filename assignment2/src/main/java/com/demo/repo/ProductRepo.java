package com.demo.repo;

import com.demo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepo extends JpaRepository<Product, Integer> {
    @Query("SELECT pr FROM Product pr WHERE pr.name LIKE ?1 AND pr.category.id LIKE ?2 AND pr.price BETWEEN ?3 AND ?4")
    Page<Product> search(String keyword, String categoryId, int minPrice, int maxPrice, Pageable pageable);

    @Query("SELECT pr FROM Product pr WHERE (pr.name LIKE ?1 OR pr.category.name LIKE ?1)")
    Page<Product> search1(String keyword, Pageable pageable);
}
