package com.saikiranBookstoreApp.bookstore_web.Entity;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Component
public class Products {

    @GeneratedValue
    @NonNull
    @Size(max = 50)
    @Id
    public long productId;

    @Column
    @NonNull
    public String productName;

    @Column
    public String productDesc;

    @NonNull
    public double price;

    @NonNull
    public long inventoryQuantityRemaining;

    @ManyToOne
    public Category category;

    @ManyToOne
    public SubCategory subCategory;


    public Products() {
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getInventoryQuantityRemaining() {
        return inventoryQuantityRemaining;
    }

    public void setInventoryQuantityRemaining(long inventoryQuantityRemaining) {
        this.inventoryQuantityRemaining = inventoryQuantityRemaining;
    }
}
