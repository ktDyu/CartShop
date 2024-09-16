package com.demo.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity @Table(name="Products")
public class Product implements Serializable {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @Column(name = "name")
    @NotBlank(message = "Tên là bắt buộc")
    String name;

    @Column(name = "price")
    @Min(value = 0, message = "giá >=0")
    @NotNull(message = "Giá là bắt buộc")
    Integer price;

    @ManyToOne @JoinColumn(name="Categoryid")
    Category category;

    @Column(name = "image")
    String image;
    @Column(name = "available")
    boolean available;
    @Column(name = "createdate")
    private LocalDateTime createdate;
}
