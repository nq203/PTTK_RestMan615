/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.MonAn615;

public class MonAnDAO615 extends DAO615 {

    public MonAnDAO615() {
        super();
    }

    public List<MonAn615> getMonAnTheoTen(String tenMon) {
        List<MonAn615> list = new ArrayList<>();
        String query = "SELECT * FROM tblmonan615 WHERE name LIKE ?";
        
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, "%" + tenMon + "%");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                MonAn615 monAn = new MonAn615();
                monAn.setId(rs.getInt("id"));
                monAn.setName(rs.getString("name"));
                monAn.setMota(rs.getString("mota"));
                monAn.setGia(rs.getFloat("gia"));
                
                list.add(monAn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    // Các phương thức CRUD khác cho MonAn sẽ tương tự như trên
}
