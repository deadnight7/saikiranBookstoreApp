package com.saikiranBookstoreApp.bookstore_web.Entity;

import org.springframework.lang.NonNull;

import javax.persistence.*;

@Entity
public class Category {

    @Id
    //@GeneratedValue
    @GeneratedValue
    public long categoryId;

    @NonNull
    @Column
    public String categoryName;

}
