package dao;

import java.sql.*;
import java.util.List;
import model.HoaDonNhap615;
import model.NguyenLieuNhap615;

public class HoaDonNhapDAO615 extends DAO615 {
    private NguyenLieuNhapDAO615 nguyenLieuNhapDAO;
    private NguyenLieuDAO615 nguyenLieuDAO;
    public HoaDonNhapDAO615() {
        super();
        nguyenLieuNhapDAO = new NguyenLieuNhapDAO615(); // Khởi tạo đối tượng NguyenLieuNhapDAO615
        nguyenLieuDAO = new NguyenLieuDAO615();
    }

    public boolean createHoaDonNhap(HoaDonNhap615 hoaDonNhap) {
    String query = "INSERT INTO restman615.tblhoadonnhap615 (gia, ngaynhap, tblNvKho615_id, tblNhaCungCap615_id) VALUES (?, ?, ?, ?)";
    
    try {
        // Start transaction for HoaDonNhap only
        con.setAutoCommit(false);

        try (PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setFloat(1, hoaDonNhap.getGia());
            ps.setDate(2, hoaDonNhap.getNgayNhap());
            ps.setInt(3, hoaDonNhap.getNvKho().getId());
            ps.setInt(4, hoaDonNhap.getNhaCungCap().getId());
            
            int rowsInserted = ps.executeUpdate();
            
            if (rowsInserted > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int hoaDonNhapId = rs.getInt(1);
                    System.out.println("hoa don nhap id tra ve :" + hoaDonNhapId);
                    
                    // Commit transaction for HoaDonNhap before inserting NguyenLieuNhap
                    con.commit();

                    // Insert NguyenLieuNhap records in separate transactions
                    for (NguyenLieuNhap615 nguyenLieuNhap : hoaDonNhap.getNguyenLieuNhapList()) {
                        try {
                            con.setAutoCommit(false); // Start new transaction for each NguyenLieuNhap
                            
                            boolean createdNguyenLieuNhap = nguyenLieuNhapDAO.createNguyenLieuNhap(
                                nguyenLieuNhap, hoaDonNhapId
                            );

                            if (createdNguyenLieuNhap) {
                                boolean updateSL = nguyenLieuDAO.updateSoLuongNguyenLieu(
                                    nguyenLieuNhap.getNguyenLieu().getId(), nguyenLieuNhap.getSoLuong()
                                );
                                if (!updateSL) {
                                    System.err.println("Failed to update quantity for material ID: " + nguyenLieuNhap.getNguyenLieu().getId());
                                }
                            } else {
                                System.err.println("Failed to create material entry for material ID: " + nguyenLieuNhap.getNguyenLieu().getId());
                            }

                            con.commit(); // Commit transaction for this NguyenLieuNhap
                        } catch (SQLException e) {
                            con.rollback(); // Rollback transaction for this NguyenLieuNhap on failure
                            e.printStackTrace();
                        }
                    }
                }
                return true;
            } else {
                con.rollback(); // Rollback transaction for HoaDonNhap if no rows were inserted
                return false;
            }
        } catch (SQLException e) {
            con.rollback(); // Rollback transaction for HoaDonNhap on failure
            e.printStackTrace();
            return false;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    } finally {
        // Restore auto-commit mode
        try {
            con.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


    
}
