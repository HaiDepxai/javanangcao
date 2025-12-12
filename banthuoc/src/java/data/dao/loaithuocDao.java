/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.loaithuoc;

/**
 *
 * @author ADMIN
 */
public interface loaithuocDao {
    public List<loaithuoc> findAll();
    public boolean insert(loaithuoc loaithuoc);
    public boolean update(loaithuoc loaithuoc);
    public boolean delete(int id);
    public loaithuoc find(int id);
}
