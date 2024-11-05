/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.NhaCungCap615;

public class NhaCungCapDAO615 extends DAO615 {

    public NhaCungCapDAO615() {
        super();
    }

    public boolean addNhaCungCap(NhaCungCap615 ncc) {
        String sql = "INSERT INTO tblNhaCungCap615 (id, name, phone, address) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, ncc.getId());
            ps.setString(2, ncc.getName());
            ps.setString(3, ncc.getPhone());
            ps.setString(4, ncc.getAddress());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<NhaCungCap615> getNhaCungCapTheoTen(String tenNhaCungCap) {
    List<NhaCungCap615> danhSachNhaCungCap = new ArrayList<>();
    String sql = "SELECT * FROM tblNhaCungCap615 WHERE name LIKE ?"; // Đảm bảo tên bảng chính xác

    try (PreparedStatement pstmt = con.prepareStatement(sql)) { // Sử dụng con từ lớp cha
        pstmt.setString(1, "%" + tenNhaCungCap + "%");
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            NhaCungCap615 nhaCungCap = new NhaCungCap615(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("phone"),
                rs.getString("address")
            );
            danhSachNhaCungCap.add(nhaCungCap);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return danhSachNhaCungCap;
}
    
    // Các phương thức CRUD khác cho NhaCungCap sẽ tương tự như trên
}
