/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quanc
 */
import java.sql.Date;
import java.util.List;
public class HoaDonNhap615 {
    private int id;
    private List<NguyenLieuNhap615> nguyenLieuNhapList;
    private float gia;
    private Date ngayNhap;
    private NhaCungCap615 nhaCungCap;
    private NvKho615 nvKho;
   
    
    // Constructors
    public HoaDonNhap615() {}

    public HoaDonNhap615(int id, List<NguyenLieuNhap615> nguyenLieuNhapList, float gia, Date ngayNhap, NhaCungCap615 nhaCungCap, NvKho615 nvKho) {
        this.id = id;
        this.nguyenLieuNhapList = nguyenLieuNhapList;
        this.gia = gia;
        this.ngayNhap = ngayNhap;
        this.nhaCungCap = nhaCungCap;
        this.nvKho = nvKho;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<NguyenLieuNhap615> getNguyenLieuNhapList() {
        return nguyenLieuNhapList;
    }

    public void setNguyenLieuNhapList(List<NguyenLieuNhap615> nguyenLieuNhapList) {
        this.nguyenLieuNhapList = nguyenLieuNhapList;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public Date getNgayNhap() {
        return ngayNhap;
    }

    public void setNgayNhap(Date ngayNhap) {
        this.ngayNhap = ngayNhap;
    }

    public NhaCungCap615 getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(NhaCungCap615 nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }
     public NvKho615 getNvKho() {
        return nvKho;
    }

    public void setNvKho(NvKho615 nvKho) {
        this.nvKho = nvKho;
    }
}
