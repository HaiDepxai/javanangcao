/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import model.User;

/**
 *
 * @author Admin
 */
public interface UserDao {
    public User find(String emailphone, String password);
    public boolean insert(String name, String email, String phone, String password);
    public boolean check(String emailphone);
}
