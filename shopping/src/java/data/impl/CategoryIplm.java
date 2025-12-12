/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import data.dao.CategoryDao;
import data.driver.MySQLDriver;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author ADMIN
 */
public class CategoryIplm implements CategoryDao {
    Connection con=MySQLDriver.getConnection();
            
    public List<Category> findAll(){
       List<Category> listCategory=new ArrayList<>();
       String sql="select *from categories";
        try {
            PreparedStatement sttm=con.prepareStatement(sql);
            ResultSet rs=sttm.executeQuery();
            while(rs.next()){
                int id=rs.getInt("id");
                String name=rs.getString("name");
                listCategory.add(new Category(id,name));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
}
    public boolean insert(Category category){
        return true;
}
  
    public boolean update(Category category){
        return true;
}
    public boolean delete(int id){
         return true;
}
    public Category find(int id){
    return null;
}

}