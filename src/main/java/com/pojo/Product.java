package com.pojo;

import java.util.List;

public class Product {

    private int productId;
    private String productName;
    private String description;
    private double price;
    private String color;
    private String details;
    private String patternType;
    private String image;
    private int categoryId;
    private int quantity;

    // Extra field for category name (JOIN purpose)
    private String categoryName;

    // 🔹 Default Constructor
    public Product() {
    }

    // 🔹 Parameterized Constructor
    public Product(int productId, String productName, String description, double price,
                   String color, String details, String patternType,
                   String image, int categoryId) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.color = color;
        this.details = details;
        this.patternType = patternType;
        this.image = image;
        this.categoryId = categoryId;
    }

    // 🔹 Getters and Setters

    public int getId() {
        return productId;
    }

    public void setId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return productName;
    }

    public void setName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getPatternType() {
        return patternType;
    }

    public void setPatternType(String patternType) {
        this.patternType = patternType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // 🔹 Category Name (JOIN)
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}