/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import data.dao.ProductDao;
import data.driver.MySQLDriver;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductImpl implements ProductDao {
     Connection con=MySQLDriver.getConnection();

            
    public List<Product> findAll(){
       List<Product> listProduct=new ArrayList<>();
       String sql="select *from products";
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
                int Id_category=rs.getInt("Id_category");
                listProduct.add(new Product(id,name,image,price,quantity,status,Id_category));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
}
    public boolean insert(Product product){
        return true;
}
  
    public boolean update(Product product){
        return true;
}
    public boolean delete(int id){
         return true;
}
    public Product find(int id){
    return null;
}

    
}
