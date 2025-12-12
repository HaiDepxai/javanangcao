/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.UserDao;
import data.driver.MySQLDriver;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class UserImpl implements UserDao {
    Connection con = MySQLDriver.getConnection();
    @Override
    public User find(String emailphone, String password) {
        String sql;
        if(emailphone.contains("@"))
            sql ="select * from users where email='"+emailphone+"' and password='"+password+"'";
        else 
            sql ="select * from users where phone='"+emailphone+"' and password='"+password+"'";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm .executeQuery();
            if(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String pass = rs.getString("password");
                String role = rs.getString("role");
                return new User(id,name, email, phone, pass, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean insert(String name, String email, String phone, String password) {
        String sql = "insert into users(name, email, phone, password, role)"
                + "values('"+name+"','"+email+"','"+phone+"','"+password+"','')";
        PreparedStatement sttm;
        try {
            sttm = con.prepareStatement(sql);
            return sttm.executeUpdate()>0;
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean check(String emailphone) {
        String sql;
        if(emailphone.contains("@"))
            sql ="select 1 from users where email='"+emailphone+"'";
        else 
            sql ="select 1 from users where phone='"+emailphone+"'";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm .executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
}
