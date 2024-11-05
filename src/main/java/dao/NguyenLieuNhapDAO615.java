package dao;

import java.sql.*;
import model.NguyenLieuNhap615;

public class NguyenLieuNhapDAO615 extends DAO615 {

    public NguyenLieuNhapDAO615() {
        super();
    }
    public boolean createNguyenLieuNhap(NguyenLieuNhap615 nguyenLieuNhap, int tblHoaDonNhap615_id) {
        // SQL insert statement
        String sql = "INSERT INTO tblnguyenlieunhap615 (soluong, tblHoaDonNhap615_id, tblNguyenLieu615_id) VALUES (?, ?, ?)";

        try (  // Adjust DatabaseConnection to your connection class
             PreparedStatement stmt = con.prepareStatement(sql)) {
            
            // Set parameters
            stmt.setInt(1, nguyenLieuNhap.getSoLuong());
            stmt.setInt(2, tblHoaDonNhap615_id);
            stmt.setInt(3, nguyenLieuNhap.getNguyenLieu().getId());

            // Execute the query
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;  // Return true if insert was successful

        } catch (SQLException e) {
            e.printStackTrace();  // Print error for debugging
            return false;  // Return false if an error occurred
        }
    }
    

}

    
    // Các phương thức CRUD khác cho NguyenLieuNhap sẽ tương tự như tr
