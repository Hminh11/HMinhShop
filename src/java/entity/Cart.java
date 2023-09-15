/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ^Zin^
 */
public class Cart {
    private List<Item>items;
    public Cart(){
        items= new ArrayList<>();
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    

    public Cart(List<Item>items){
        this.items=items;
    }
    public List<Item> getItems() {
        return items;
    }
    public int getquanityById(int id){
        return getItembyID(id).getQuantity();
    }
    
    
    private Item getItembyID(int id){
        for(Item o : items){
            if(o.getProduct().getId()==id){
                return o;
            }
        }
        return null;
    }
    
    public void removeitem(int id){
        if(getItembyID(id)!=null){
            items.remove(getItembyID(id));
        }
    }
    public double getTotalmoney(){
        double t = 0;
        for(Item i: items){
            t+=(i.getQuantity()*i.getPrice());
        }
        return t;
    }
    public Product getProductbyID(int id,List<Product>list){
        for(Product i: list){
            if(i.getId()==id){
                return i;
            }
        }
        return null;
    }
    
    
}
