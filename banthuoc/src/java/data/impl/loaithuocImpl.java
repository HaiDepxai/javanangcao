/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.loaithuocDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.loaithuoc;

/**
 *
 * @author ADMIN
 */
public class loaithuocImpl implements loaithuocDao {
     Connection con = MySQLDriver.getConnection();
    public List<loaithuoc> findAll(){
        List<loaithuoc> listloaithuoc = new ArrayList<>();
        String sql = "select * from loaithuoc";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                listloaithuoc.add(new loaithuoc(id,name));
            }
        } catch (SQLException ex) {
            Logger.getLogger(loaithuocImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listloaithuoc;
    }
    public boolean insert(loaithuoc loaithuoc){
        return true;
    }
    public boolean update(loaithuoc loaithuoc){
        return true;
    }
    public boolean delete(int id){
        return true;
    }
    public loaithuoc find(int id){
        return null;
    }
}
