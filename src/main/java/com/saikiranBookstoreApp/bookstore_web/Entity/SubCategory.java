package com.saikiranBookstoreApp.bookstore_web.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class SubCategory {

    @Id
    @GeneratedValue
    public long subCategoryId;
    public String subCategoryName;

    @ManyToOne
    public Category category;

}
