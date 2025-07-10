/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.com.model;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.Serializable;
/**
 *
 * @author Firdaus
 */
public class admin implements Serializable {
    private String category;
    private String place;
    private String donationDate;
    
    public admin(String c, String p, String d){
        this.category = c;
        this.place = p;
        this.donationDate=d;
        
}
    
    public void setCat(String c){
        this.category =c;
    }
    public void setPlace(String p){
        this.place=p;
    }
    public void setDate(String d){
        this.donationDate=d;
    }
    public String getCat(){
        return category;
    }
    public String getPlace(){
        return place;
    }
    
    public String getDate(){
        return donationDate;
    }
}