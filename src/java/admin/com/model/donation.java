/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.com.model;

import java.io.Serializable;

/**
 *
 * @author Firdaus
 */
public class donation extends admin implements Serializable {
    private String username;
    private double donation;
   public donation(String c, String p, String d, String u, double don){
       super(c,p,d);
       username=u;
       donation = don;
   }
   
   public void setUse(String u){
       username = u;
   }
   public void setDon(double don){
       donation=don;
   }
   
   public String getUse(){
       return username;
   }
   public double getDon(){
       return donation;
   }
}
