/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quanc
 */
public class NguyenLieu615 {
    private int id;
    private String ten;
    private String mota;
    private int soLuong;
    private float gia;

    // Constructors
    public NguyenLieu615() {}

    public NguyenLieu615(int id, String ten, String mota, int soLuong, float gia) {
        this.id = id;
        this.ten = ten;
        this.mota = mota;
        this.soLuong = soLuong;
        this.gia = gia;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }
}
