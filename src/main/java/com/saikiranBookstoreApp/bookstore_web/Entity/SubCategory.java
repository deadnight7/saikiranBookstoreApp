package com.saikiranBookstoreApp.bookstore_web.Entity;

import javax.persistence.*;

@Entity
public class SubCategory {

    @Id
    @GeneratedValue
    public long subCategoryId;

    @Column
    public String subCategoryName;

    @ManyToOne
    public Category category;

}
