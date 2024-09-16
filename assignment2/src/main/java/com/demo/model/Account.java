package com.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name="Accounts")
public class Account implements Serializable {
    @Id
    @Column(name = "username")
    @NotBlank(message = "Tên tài khoản là bắt buộc")
    String username;

    @Column(name = "password")
    @NotBlank(message = "Mật khẩu là bắt buộc")
    String password;

    @Column(name = "fullname")
    @NotBlank(message = "Họ tên là bắt buộc")
    String fullname;

    @Column(name = "email")
    @NotBlank(message = "Email là bắt buộc")
    String email;

    @Column(name = "activated")
    boolean activated;

    @Column(name = "admin")
    boolean admin;
}
