/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author quanc
 */
public class NvKho615 extends NhanVien615 {
    private String mota;

    // Constructors
    public NvKho615() {}

    public NvKho615(int id, String username, String password, String name, String address, Date date, String phone, String vaitro, String mota) {
        super(id, username, password, name, address, date, phone, vaitro);
        this.mota = mota;
    }

    // Getters and Setters
    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }
}
