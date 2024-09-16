package com.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name="Categories")
public class Category implements Serializable {
    @Id
    @Column(name = "id")
    String id;

    @Column(name = "name")
    @NotBlank(message = "Tên là bắt buộc")
    String name;
}
