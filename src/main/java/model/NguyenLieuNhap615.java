/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quanc
 */
public class NguyenLieuNhap615 {
    private int id;
    private NguyenLieu615 nguyenLieu;
    private int soLuong;

    // Constructors
    public NguyenLieuNhap615() {}

    public NguyenLieuNhap615(int id, NguyenLieu615 nguyenLieu, int soLuong) {
        this.id = id;
        this.nguyenLieu = nguyenLieu;
        this.soLuong = soLuong;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public NguyenLieu615 getNguyenLieu() {
        return nguyenLieu;
    }

    public void setNguyenLieu(NguyenLieu615 nguyenLieu) {
        this.nguyenLieu = nguyenLieu;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
}
