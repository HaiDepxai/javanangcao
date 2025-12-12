/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.Thuoc;

/**
 *
 * @author ADMIN
 */
public interface ThuocDao {
     public List<Thuoc> findAll();
    public boolean insert(Thuoc thuoc);
    public boolean update(Thuoc thuoc);
    public boolean delete(int id);
    public Thuoc find(int id); 
}