/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

public class Donation implements Serializable {
    private String username;
    private String cause;
    private double amount;
    private String date;
    private String paymentMethod;

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getCause() { return cause; }
    public void setCause(String cause) { this.cause = cause; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
}

