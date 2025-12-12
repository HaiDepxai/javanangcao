/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.dao;

import data.impl.LoaithuocImpl;
import data.impl.ThuocImpl;
import data.impl.UserImpl;

/**
 *
 * @author ADMIN
 */
public class Database {
    public static LoaithuocDao getLoaithuocDao(){
        return new LoaithuocImpl();
}
     public static ThuocDao getThuocDao(){
        return new ThuocImpl();
}
      public static UserDao getUserDao(){
        return new UserImpl();
    }
}
