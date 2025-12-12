package model;

import java.util.Date;

public class Thuoc {
    private int id;
    private String name;
    private int quantity;
    private boolean status;
    private int id_loai;
    private String image;
    private double price;
    private Date hansudung;

    // Constructor rỗng (bắt buộc cho JavaBean)
    public Thuoc() {}

    // Constructor đầy đủ
    public Thuoc(int id, String name, String image, double price, int quantity, boolean status, int id_loai, Date hansudung) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.id_loai = id_loai;
        this.hansudung = hansudung;
    }

    // Getter + Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public boolean isStatus() { return status; }
    public void setStatus(boolean status) { this.status = status; }

    public int getId_loai() { return id_loai; }
    public void setId_loai(int id_loai) { this.id_loai = id_loai; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public Date getHansudung() { return hansudung; }
    public void setHansudung(Date hansudung) { this.hansudung = hansudung; }
}
