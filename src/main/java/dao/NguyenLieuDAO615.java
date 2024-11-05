/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.NguyenLieu615;

public class NguyenLieuDAO615 extends DAO615 {

    public NguyenLieuDAO615() {
        super();
    }

    public boolean addNguyenLieu(NguyenLieu615 nl) {
        String sql = "INSERT INTO tblNguyenLieu615 (id, ten, mota, soluong, gia) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, nl.getId());
            ps.setString(2, nl.getTen());
            ps.setString(3, nl.getMota());
            ps.setInt(4, nl.getSoLuong());
            ps.setFloat(5, nl.getGia());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<NguyenLieu615> getNguyenLieuTheoTen(String tenNguyenLieu) {
        List<NguyenLieu615> danhSachNguyenLieu = new ArrayList<>();
        String sql = "SELECT * FROM tblnguyenlieu615 WHERE ten LIKE ?"; // Thay đổi tên bảng nếu cần

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + tenNguyenLieu + "%"); // Sử dụng wildcard để tìm kiếm
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                NguyenLieu615 nguyenLieu = new NguyenLieu615();
                nguyenLieu.setId(rs.getInt("id"));
                nguyenLieu.setTen(rs.getString("ten"));
                nguyenLieu.setMota(rs.getString("mota"));
                nguyenLieu.setSoLuong(rs.getInt("soluong")); // Thay đổi tên trường nếu cần
                nguyenLieu.setGia(rs.getFloat("gia"));
                
                danhSachNguyenLieu.add(nguyenLieu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return danhSachNguyenLieu;
    }
    
    public boolean updateSoLuongNguyenLieu(int idNguyenLieu, int soLuong) {
    String sql = "UPDATE tblnguyenlieu615 SET soluong = soluong + ? WHERE id = ?"; // Cộng thêm số lượng
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, soLuong); // Gán giá trị số lượng mới để cộng
        ps.setInt(2, idNguyenLieu); // Gán ID nguyên liệu để cập nhật
        return ps.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; // Trả về false nếu có lỗi xảy ra
    }

    // Các phương thức CRUD khác cho NguyenLieu sẽ tương tự như trên
}
