package com.saikiranBookstoreApp.bookstore_web.Entity;

import org.springframework.lang.NonNull;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {

    @Id
    //@GeneratedValue
    @GeneratedValue
    public long categoryId;

    @NonNull
    public String categoryName;

}
