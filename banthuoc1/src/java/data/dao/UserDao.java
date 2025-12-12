/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import model.User;

/**
 *
 * @author ADMIN
 */
public interface UserDao {
    public User find(String emailphone, String password);
    public boolean insert(String name, String email, String phone, String password);
    public boolean check(String emailphone);
    
     public java.util.List<User> getAll();         // Lấy tất cả user
    public User getById(int id);                  // Lấy user theo id
    public boolean update(User user);             // Sửa thông tin user
    public boolean delete(int id);    // Xóa user
     // Thêm hàm này 👇
    public boolean insert(User user); 
}
