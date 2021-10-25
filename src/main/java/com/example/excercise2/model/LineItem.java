package com.example.excercise2.model;

import java.io.Serializable;
import java.text.NumberFormat;

public class LineItem  implements Serializable{
    private ProductEntity product;
    private int quantity;

    public LineItem() {
    }

    public void setProduct(ProductEntity p) {
        product = p;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getTotal() {
        double total = product.getPrice() * quantity;
        return total;
    }

    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.getTotal());
    }
}
