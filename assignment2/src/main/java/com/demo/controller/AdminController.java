package com.demo.controller;

import com.demo.model.Account;
import com.demo.model.Category;
import com.demo.model.Order;
import com.demo.model.Product;
import com.demo.repo.AccountRepo;
import com.demo.repo.CategoryRepo;
import com.demo.repo.OrderDetailRepo;
import com.demo.repo.OrderRepo;
import com.demo.repo.ProductRepo;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    AccountRepo accountRepo;
    @Autowired
    ProductRepo productRepo;
    @Autowired
    CategoryRepo categoryRepo;
    @Autowired
    OrderRepo orderRepo;
    @Autowired
    OrderDetailRepo orderDetailRepo;


    @ModelAttribute("listCate")
    public List<Category> getDsHang() {
        return categoryRepo.findAll();
    }

    //  Category
    @GetMapping("/admin")
    public String listCategory(Model model) {
        model.addAttribute("listC", categoryRepo.findAll());
        return "admin/category/list";
    }

    @GetMapping("/admin/category/create")
    public String createCategory(@ModelAttribute("cate") Category category) {
        return "admin/category/form";
    }
    @PostMapping("/admin/category/create")
    public String createCate(@Valid @ModelAttribute("cate") Category category, BindingResult rs) {
        if (!rs.hasErrors()) {
            categoryRepo.save(category);
            return "redirect:/admin";
        } else {
            return "admin/category/form";
        }
    }
    @GetMapping("/admin/category/update/{id}")
    public String editCategory(@PathVariable String id, Model model) {
        Category category = categoryRepo.findById(id).orElse(null);
        model.addAttribute("cate", category);
        return "admin/category/update";
    }
    @PostMapping("/admin/category/update/{id}")
    public String updateCate(@Valid @PathVariable String id, @ModelAttribute("cate") Category category, BindingResult rs) {
        if (!rs.hasErrors()) {
            categoryRepo.save(category);
            return "redirect:/admin";
        } else {
            return "admin/category/update";
        }
    }
    @GetMapping("/admin/category/delete/{id}")
    public String deleteCate(@PathVariable String id) {
        categoryRepo.deleteById(id);
        return "redirect:/admin";
    }


    //  Product
    @GetMapping("/admin/product")
    public String listProduct(@RequestParam(defaultValue = "")String keyword,
                              @RequestParam(defaultValue = "")String categoryId,
                              @RequestParam(defaultValue = "0")int p,Model model) {

        Pageable pageable = PageRequest.of(p,5, Sort.by(Sort.Direction.DESC, "price"));
        Page<Product> page  = productRepo.search1("%" + keyword + "%", pageable);//findAll(pageable);
        model.addAttribute("page", page);
        model.addAttribute("prod",productRepo.findAll());
        return "admin/product/list";
    }

    @GetMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("pro") Product product) {
        return "admin/product/form";
    }

    @PostMapping("/admin/product/create")
    public String createAcc(@Valid @ModelAttribute("pro") Product product, BindingResult rs) {
        if (!rs.hasErrors()) {
            product.setCreatedate(LocalDateTime.now());
            productRepo.save(product);
            return "redirect:/admin/product";
        } else {
            return "admin/product/form";
        }
    }

    @GetMapping("/admin/product/update/{id}")
    public String editProduct(@PathVariable int id, Model model) {
        Product product = productRepo.findById(id).orElse(null);
        model.addAttribute("pro", product);
        return "admin/product/form";
    }

    @PostMapping("/admin/product/update/{id}")
    public String updatePro(@Valid @PathVariable int id, @ModelAttribute("pro") Product product, BindingResult rs) {
        if (!rs.hasErrors()) {
            product.setId(id);
            product.setCreatedate(LocalDateTime.now());
            productRepo.save(product);
            return "redirect:/admin/product";
        } else {
            return "admin/product/update";
        }
    }

//    @GetMapping("/admin/product/delete/{id}")
//    public String deletePro(@PathVariable int id) {
//        productRepo.deleteById(id);
//        return "redirect:/admin/product";
//    }


    //  Account
    @GetMapping("/admin/account")
    public String listAccount(Model model) {
        model.addAttribute("listAcc", accountRepo.findAll());
        return "admin/account/list";
    }

    @GetMapping("/admin/account/create")
    public String createAccount(@ModelAttribute("acc") Account account) {
        return "admin/account/form";
    }

    @PostMapping("/admin/account/create")
    public String createAcc(@Valid @ModelAttribute("acc") Account account, BindingResult rs) {
        if (!rs.hasErrors()) {
            accountRepo.save(account);
            return "redirect:/admin/account";
        } else {
            return "admin/account/form";
        }
    }

    @GetMapping("/admin/account/update/{username}")
    public String editAccount(@PathVariable String username, Model model) {
        Account account = accountRepo.findById(username).orElse(null);
        model.addAttribute("acc", account);
        return "admin/account/update";
    }

    @PostMapping("/admin/account/update/{username}")
    public String updateAcc(@Valid @PathVariable String username, @ModelAttribute("acc") Account account, BindingResult rs) {
        Account account1 = accountRepo.findById(username).orElse(null);
        if (account1 == null) {
            // Xử lý trường hợp không tìm thấy tài khoản
            return "redirect:/admin/account";
        }
        if (!rs.hasErrors()) {
            account.setUsername(username);
            account.setPassword(account1.getPassword());
            accountRepo.save(account);
            return "redirect:/admin/account";
        } else {
            return "admin/account/update";
        }
    }

    @GetMapping("/admin/account/delete/{username}")
    public String delete(@PathVariable String username, Model model) {
        Account account2 = accountRepo.findById(username).orElse(null);
        if (account2 != null) {
            // Kiểm tra và xóa các liên kết trước khi xóa tài khoản
            List<Order> orders = orderRepo.findByAccountUsername(username);
            for (Order order : orders) {
                orderRepo.delete(order);
            }
            accountRepo.deleteById(username);
        } else {
            model.addAttribute("error", "Tài khoản không tồn tại");
        }
        return "redirect:/admin/account";
    }
}
