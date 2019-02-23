package com.saikiranBookstoreApp.bookstore_web.Repository;

import com.saikiranBookstoreApp.bookstore_web.Entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    List <Category> findAll ();

    Category findByCategoryId  (Long categoryId);

    void deleteById(Long categoryId);
}
