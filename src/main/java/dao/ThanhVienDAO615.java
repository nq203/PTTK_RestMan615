package dao;
import java.sql.*;
import model.ThanhVien615;
        
public class ThanhVienDAO615 extends DAO615 {

    public ThanhVienDAO615() {
        super();
    }
     ResultSet rs = null;
    boolean isValidUser = false;
    public boolean kiemtraDangnhap(ThanhVien615 tv) {
        String sql = "SELECT * FROM tblthanhvien615 WHERE username = ? AND password = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tv.getUsername());
            ps.setString(2, tv.getPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                // Đăng nhập thành công, thiết lập thông tin người dùng
                tv.setId(rs.getInt("id"));
                tv.setName(rs.getString("name"));
                tv.setAddress(rs.getString("address"));
                tv.setPhone(rs.getString("phone"));
                tv.setVaitro(rs.getString("vaitro"));

                isValidUser = true; // Xác nhận người dùng hợp lệ
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValidUser;
    }
    
    // Các phương thức CRUD khác cho Thanhvien sẽ tương tự như trên
}
