package com.example.excercise2.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private ArrayList<LineItem> items;

    public Cart() {
        items = new ArrayList<LineItem>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(LineItem item) {
        String code = item.getProduct().getCode();
        int quantity;
        for (LineItem cartItem : items) {
            // if item exist in cart. then +1 quantity
            if (cartItem.getProduct().getCode().equals(code)) {
                quantity = cartItem.getQuantity() + 1;
                cartItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(LineItem item) {
        String code = item.getProduct().getCode();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(code)) {
                items.remove(i);
                return;
            }
        }
    }
    public void updateQuantityProduct(String productCode, int quantity) {
        for (LineItem item: items
        ) {
            if(item.getProduct().getCode().equals(productCode)) {
                item.setQuantity(quantity);
                return;
            }
        }
    }
}
