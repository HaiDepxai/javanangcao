/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.LoaithuocDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Loaithuoc;

/**
 *
 * @author ADMIN
 */
public class LoaithuocImpl implements LoaithuocDao {
Connection con = MySQLDriver.getConnection();
    public List<Loaithuoc> findAll(){
        List<Loaithuoc> listLoaithuoc = new ArrayList<>();
        String sql = "select * from loaithuoc";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                listLoaithuoc.add(new Loaithuoc(id,name));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoaithuocImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listLoaithuoc;
    }
    public boolean insert(Loaithuoc category){
        return true;
    }
    public boolean update(Loaithuoc category){
        return true;
    }
    public boolean delete(int id){
        return true;
    }
    public Loaithuoc find(int id){
        return null;
    }
}
