package com.saikiranBookstoreApp.bookstore_web.Controller;

import com.saikiranBookstoreApp.bookstore_web.Entity.Category;
import com.saikiranBookstoreApp.bookstore_web.Repository.CategoryRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Component
@RequestMapping("/category")
public class CategoryController {

    CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("")
    public List <Category> getCategory(){
        return categoryRepository.findAll();
    }

    @PostMapping("/add")
    public void addCategory(@RequestBody Category category){
        categoryRepository.save(category);
    }

    @PutMapping("/update")
    public void updateCategory(@RequestBody Category category){
        categoryRepository.save(category);
    }

    @DeleteMapping("/delete/{categoryId}")
    public void deleteCategory(@PathVariable Long categoryId){
        Category category = categoryRepository.findByCategoryId(categoryId);
        categoryRepository.deleteById(categoryId);
    }
}
