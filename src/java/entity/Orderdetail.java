/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ^Zin^
 */
public class Orderdetail {
    private int oid;
    private Product p;
    private int quantity;
    private int price;
    public Orderdetail(){
        
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Orderdetail(int oid, Product p, int quantity, int price) {
        this.oid = oid;
        this.p = p;
        this.quantity = quantity;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Orderdetail{" + "oid=" + oid + ", p= , quantity=" + quantity + ", price=" + price + '}';
    }

    
}
