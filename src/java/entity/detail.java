/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author ^Zin^
 */
public class detail {
    private List<Orderdetail>detail;
    public detail(){
        
    }

    public detail(List<Orderdetail> detail) {
        this.detail = detail;
    }

    public List<Orderdetail> getDetail() {
        return detail;
    }

    public void setDetail(List<Orderdetail> detail) {
        this.detail = detail;
    }
    
}
