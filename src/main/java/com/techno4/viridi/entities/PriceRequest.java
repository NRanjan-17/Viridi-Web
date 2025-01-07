package com.techno4.viridi.entities;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class PriceRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id") // Assuming you have a user_id column in your price_requests table
    private User user;
    
    
    @ManyToOne
    @JoinColumn(name = "product_id") // Assuming you have a product_id column in your price_requests table
    private Product product;

    private double requestedPrice;
    private String status; // PENDING, ACCEPTED, REJECTED
    private Date requestDate;
    private Date responseDate;
    private String message; // Optional message from user
    private String farmerResponse; // Optional response from farmer

    // Constructors
    public PriceRequest() {
        this.requestDate = new Date();
        this.status = "PENDING";
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser () {
        return user;
    }

    public void setUser (User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getRequestedPrice() {
        return requestedPrice;
    }

    public void setRequestedPrice(double requestedPrice) {
        this.requestedPrice = requestedPrice;
    }

 public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Date getResponseDate() {
        return responseDate;
    }

    public void setResponseDate(Date responseDate) {
        this.responseDate = responseDate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFarmerResponse() {
        return farmerResponse;
    }

    public void setFarmerResponse(String farmerResponse) {
        this.farmerResponse = farmerResponse;
    }
}