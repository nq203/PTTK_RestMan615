package model;
import java.util.Date;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
public class ThanhVien615 {
    private int id;
    private String username;
    private String password;
    private String name;
    private String address;
    private Date date;
    private String phone;
    private String vaitro;

    // Constructors
    public ThanhVien615() {}

    public ThanhVien615(int id, String username, String password, String name, String address, Date date, String phone, String vaitro) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.address = address;
        this.date = date;
        this.phone = phone;
        this.vaitro = vaitro;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setVaitro(String vaitro) {
        this.vaitro = vaitro;
    }

    // Getters and Setters
    // ...

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public Date getDate() {
        return date;
    }

    public String getPhone() {
        return phone;
    }

    public String getVaitro() {
        return vaitro;
    }
}
