/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class loaithuoc {
    public static int id;
    public static String name;

    public loaithuoc(int id,String name) {
        this.id=id;
        this.name=name;
    }

    public static int getId() {
        return id;
    }

    public static String getName() {
        return name;
    }
}
