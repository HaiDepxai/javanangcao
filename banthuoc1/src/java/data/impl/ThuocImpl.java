/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.ThuocDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Thuoc;

/**
 *
 * @author ADMIN
 */
public class ThuocImpl implements ThuocDao {
     Connection con=MySQLDriver.getConnection();

            
    public List<Thuoc> findAll(){
       List<Thuoc> listThuoc=new ArrayList<>();
       String sql="select *from thuoc";
        try {
            PreparedStatement sttm=con.prepareStatement(sql);
            ResultSet rs=sttm.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                String image=rs.getString("image");
                double price=rs.getDouble("price");
                int quantity=rs.getInt("quantity");
                boolean status=rs.getBoolean("status");
                int id_loai=rs.getInt("id_loai");
                Date hansudung=rs.getDate("hansudung");
                listThuoc.add(new Thuoc(id,name,image,price,quantity,status,id_loai,hansudung));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoaithuocImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listThuoc;
}
    public boolean insert(Thuoc thuoc){
        String sql = "INSERT INTO thuoc(name, image, price, quantity, status, id_loai, hansudung) VALUES(?,?,?,?,?,?,?)";
    try {
        PreparedStatement sttm = con.prepareStatement(sql);
        sttm.setString(1, thuoc.getName());
        sttm.setString(2, thuoc.getImage());
        sttm.setDouble(3, thuoc.getPrice());
        sttm.setInt(4, thuoc.getQuantity());
        sttm.setBoolean(5, thuoc.isStatus());
        sttm.setInt(6, thuoc.getId_loai());
        sttm.setDate(7, new java.sql.Date(thuoc.getHansudung().getTime()));
        return sttm.executeUpdate() > 0;
    } catch (SQLException ex) {
        Logger.getLogger(ThuocImpl.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }
}
  
    public boolean update(Thuoc thuoc){
         String sql = "UPDATE thuoc SET name=?, image=?, price=?, quantity=?, status=?, id_loai=?, hansudung=? WHERE id=?";
    try {
        PreparedStatement sttm = con.prepareStatement(sql);
        sttm.setString(1, thuoc.getName());
        sttm.setString(2, thuoc.getImage());
        sttm.setDouble(3, thuoc.getPrice());
        sttm.setInt(4, thuoc.getQuantity());
        sttm.setBoolean(5, thuoc.isStatus());
        sttm.setInt(6, thuoc.getId_loai());
        sttm.setDate(7, new java.sql.Date(thuoc.getHansudung().getTime()));
        sttm.setInt(8, thuoc.getId());
        return sttm.executeUpdate() > 0;
    } catch (SQLException ex) {
        Logger.getLogger(ThuocImpl.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }
}
    public boolean delete(int id){
          String sql = "DELETE FROM thuoc WHERE id=?";
    try {
        PreparedStatement sttm = con.prepareStatement(sql);
        sttm.setInt(1, id);
        return sttm.executeUpdate() > 0;
    } catch (SQLException ex) {
        Logger.getLogger(ThuocImpl.class.getName()).log(Level.SEVERE, null, ex);
        return false;
    }
}
    public Thuoc find(int id){
     Thuoc thuoc = null;
    String sql = "SELECT * FROM thuoc WHERE id = ?";
    try {
        PreparedStatement sttm = con.prepareStatement(sql);
        sttm.setInt(1, id);
        ResultSet rs = sttm.executeQuery();
        if (rs.next()) {
            String name = rs.getString("name");
            String image = rs.getString("image");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            boolean status = rs.getBoolean("status");
            int id_loai = rs.getInt("id_loai");
            Date hansudung = rs.getDate("hansudung");

            thuoc = new Thuoc(id, name, image, price, quantity, status, id_loai, hansudung);
        }
    } catch (SQLException ex) {
        Logger.getLogger(ThuocImpl.class.getName()).log(Level.SEVERE, null, ex);
    }
    return thuoc;
}
}
