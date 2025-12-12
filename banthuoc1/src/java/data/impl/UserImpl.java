/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.UserDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserImpl implements UserDao {
     Connection con = MySQLDriver.getConnection();
    @Override
    public User find(String emailphone, String password) {
        String sql;
        if(emailphone.contains("@"))
            sql ="select * from user where email='"+emailphone+"' and password='"+password+"'";
        else 
            sql ="select * from user where phone='"+emailphone+"' and password='"+password+"'";
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
String sql = "INSERT INTO `user`(name, email, phone, password) VALUES (?,?,?,?)";
try (PreparedStatement sttm = con.prepareStatement(sql)) {
    sttm.setString(1, name);
    sttm.setString(2, email);
    sttm.setString(3, phone);
    sttm.setString(4, password);

    int rows = sttm.executeUpdate();
    System.out.println("Rows inserted: " + rows);
    return rows > 0;
} catch (SQLException ex) {
    ex.printStackTrace();
}
return false;

}

    @Override
    public boolean check(String emailphone) {
        String sql;
        if(emailphone.contains("@"))
            sql ="select 1 from user where email='"+emailphone+"'";
        else 
            sql ="select 1 from user where phone='"+emailphone+"'";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm .executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    @Override
public java.util.List<User> getAll() {
    java.util.List<User> list = new java.util.ArrayList<>();
    String sql = "SELECT * FROM user";
    try (PreparedStatement sttm = con.prepareStatement(sql)) {
        ResultSet rs = sttm.executeQuery();
        while (rs.next()) {
            User u = new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getString("password"),
                rs.getString("role")
            );
            list.add(u);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return list;
}

@Override
public User getById(int id) {
    String sql = "SELECT * FROM user WHERE id=?";
    try (PreparedStatement sttm = con.prepareStatement(sql)) {
        sttm.setInt(1, id);
        ResultSet rs = sttm.executeQuery();
        if (rs.next()) {
            return new User(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("phone"),
                rs.getString("password"),
                rs.getString("role")
            );
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return null;
}

@Override
public boolean update(User user) {
    String sql = "UPDATE user SET name=?, email=?, phone=?, password=?, role=? WHERE id=?";
    try (PreparedStatement sttm = con.prepareStatement(sql)) {
        sttm.setString(1, user.getName());
        sttm.setString(2, user.getEmail());
        sttm.setString(3, user.getPhone());
        sttm.setString(4, user.getPassword());
        sttm.setString(5, user.getRole());
        sttm.setInt(6, user.getId());
        return sttm.executeUpdate() > 0;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return false;
}

@Override
public boolean delete(int id) {
    String sql = "DELETE FROM user WHERE id=?";
    try (PreparedStatement sttm = con.prepareStatement(sql)) {
        sttm.setInt(1, id);
        return sttm.executeUpdate() > 0;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return false;
}
@Override
public boolean insert(User u) {
    String sql = "INSERT INTO user(name, email, phone, password, role) VALUES (?,?,?,?,?)";
    try (PreparedStatement sttm = con.prepareStatement(sql)) {
        sttm.setString(1, u.getName());
        sttm.setString(2, u.getEmail());
        sttm.setString(3, u.getPhone());
        sttm.setString(4, u.getPassword());
        sttm.setString(5, u.getRole());
        return sttm.executeUpdate() > 0;
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return false;
}

    
    
}
