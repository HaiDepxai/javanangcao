/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Product {
    private int id;
    private String name;
    private int quantity;
    private boolean status;
    private int Id_category;

    private String image;
    private double price;

    public Product(int id, String name, String image, double price, int quantity, boolean status, int Id_category) {
               this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.status = status;
        this.Id_category = Id_category;
        this.image = image;
        this.price = price;
    }


    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getQuantity() {
        return quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public int getId_category() {
        return Id_category;
    }

    public String getImage() {
        return image;
    }

    public double getPrice() {
        return price;
    }


    
}