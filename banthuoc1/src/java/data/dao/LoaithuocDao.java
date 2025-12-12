/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.Loaithuoc;

/**
 *
 * @author ADMIN
 */
public interface LoaithuocDao {
    public List<Loaithuoc> findAll();
    public boolean insert(Loaithuoc loaithuoc);
    public boolean update(Loaithuoc loaithuoc);
    public boolean delete(int id);
    public Loaithuoc find(int id);
    
}
