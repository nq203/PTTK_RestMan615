<%@page import="model.ThanhVien615"%>
<%@page import="model.NguyenLieu615"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="model.HoaDonNhap615"%>
<%@page import="model.NguyenLieuNhap615"%>
<%@page import="model.NhaCungCap615"%>
<%@page import="model.NvKho615"%>
<%@page import="dao.HoaDonNhapDAO615"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content:  flex-start;
            height: 100vh; /* Full viewport height */
            margin: 0;
            font-family: Arial, sans-serif; /* Font styling */
        }

        h1, h2 {
            text-align: center; /* Center the headings */
        }

        table {
            margin-top: 20px; /* Space above the table */
            border-collapse: collapse; /* Collapse table borders */
            width: 80%; /* Width of the table */
        }

        th, td {
            padding: 10px; /* Padding in table cells */
            text-align: center; /* Center text in table cells */
            border: 1px solid #000; /* Border for table cells */
        }

        form {
            margin-top: 20px; /* Space above the form */
            display: flex; /* Use flexbox for form layout */
            flex-direction: column; /* Stack elements vertically */
            align-items: center; /* Center form elements */
        }

        label {
            margin-bottom: 10px; /* Space below the label */
            font-size: 18px; /* Font size for label */
        }

        input[type="text"] {
            padding: 10px; /* Padding for the text input */
            width: 300px; /* Width of the input */
            border: 1px solid #ccc; /* Light gray border */
            border-radius: 5px; /* Rounded corners */
            font-size: 16px; /* Font size for input */
            margin-bottom: 10px; /* Space below the input */
            transition: border-color 0.3s; /* Transition for border color */
        }

        input[type="text"]:focus {
            border-color: #4CAF50; /* Change border color on focus */
            outline: none; /* Remove outline */
        }

        button,input[type="submit"] {
            background-color: #4CAF50; /* Green background */
            border: none; /* Remove borders */
            color: white; /* White text */
            padding: 10px 20px; /* Padding around text */
            text-align: center; /* Center text */
            text-decoration: none; /* Remove underline */
            display: inline-block; /* Make the button inline */
            font-size: 16px; /* Font size */
            margin: 4px 2px; /* Margin around button */
            cursor: pointer; /* Pointer cursor on hover */
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s; /* Transition effect for background color */
        }

        button[type="submit"]:hover {
            background-color: #45a049; /* Darker green on hover */
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Xác Nhận Hóa Đơn Nhập</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
            margin: 0;
            font-family: Arial, sans-serif; /* Font styling */
        }

        h1, h2 {
            text-align: center; /* Center the headings */
        }

        table {
            margin-top: 20px; /* Space above the table */
            border-collapse: collapse; /* Collapse table borders */
        }

        th, td {
            padding: 10px; /* Padding in table cells */
            text-align: center; /* Center text in table cells */
            border: 1px solid #000; /* Border for table cells */
        }

        form {
            margin-top: 20px; /* Space above the form */
        }
    </style>
    <script>
        function showAlert(message) {
            alert(message);
            window.location.href = "GDChinhNvKho615.jsp"; // Redirect after alert
        }
    </script>
</head>
<body>
    <h1>Xác Nhận Hóa Đơn Nhập</h1>
    <%
        List<NguyenLieuNhap615> listNLNhap = (List<NguyenLieuNhap615>) session.getAttribute("listNLNhap");
        NhaCungCap615 nhaCC = (NhaCungCap615) session.getAttribute("nhaCC");
        String totalGiaParam = request.getParameter("totalGia");
        double totalGia = 0.0;

        if (totalGiaParam != null && !totalGiaParam.trim().isEmpty()) {
            totalGia = Double.parseDouble(totalGiaParam);
        } else {
            out.println("<p>Lỗi: Tham số 'totalGia' không được truyền hoặc rỗng.</p>");
        }
        
        Date ngayNhap = new Date(System.currentTimeMillis()); // Lấy thời gian hiện tại
        NvKho615 nvKho = (NvKho615) session.getAttribute("nvkho");

        HoaDonNhap615 hoaDonNhap = new HoaDonNhap615(1, listNLNhap, (float) totalGia, ngayNhap, nhaCC, nvKho);
        session.setAttribute("hoaDonNhap", hoaDonNhap);
    %>

    <h2>Thông Tin Hóa Đơn</h2>
    <p>Nhà Cung Cấp: <%= hoaDonNhap.getNhaCungCap().getName() %></p>
    <p>Ngày Nhập: <%= hoaDonNhap.getNgayNhap() %></p>
    <p>Nhân Viên Kho: <%= hoaDonNhap.getNvKho().getName() %></p>
    <p>Tổng Tiền: <%= hoaDonNhap.getGia() %></p>
    
    <table>
        <tr>
            <th>Tên Nguyên Liệu</th>
            <th>Đơn giá</th>
            <th>Số lượng Nhập</th>
            <th>Thành tiền</th>
        </tr>
        <%
            for (NguyenLieuNhap615 nlNhap : listNLNhap) {
                NguyenLieu615 nguyenLieu = nlNhap.getNguyenLieu();
                int soLuongNhap = nlNhap.getSoLuong();
                double thanhTien = nguyenLieu.getGia() * soLuongNhap;
        %>
            <tr>
                <td><%= nguyenLieu.getTen() %></td>
                <td><%= nguyenLieu.getGia() %></td>
                <td><%= soLuongNhap %></td>
                <td><%= thanhTien %></td>
            </tr>
        <%
            }
        %>
    </table>

    <form method="post">
        <input type="submit" name="btnXacNhan" value="Lưu"/>
    </form>

    <%
        // Kiểm tra xem nút "Lưu" có được nhấn không
        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("btnXacNhan") != null) {
            HoaDonNhapDAO615 hoaDonNhapDAO = new HoaDonNhapDAO615();
            boolean isSaved = hoaDonNhapDAO.createHoaDonNhap(hoaDonNhap);

            if (isSaved) {
                // Xóa hết các session attribute ngoại trừ nvKho
                session.removeAttribute("listNLNhap");
                session.removeAttribute("nhaCC");
                session.removeAttribute("hoaDonNhap");
                
                // Chuyển hướng với thông báo
                out.println("<script>showAlert('Hóa đơn nhập đã được lưu thành công!');</script>");
            } else {
                out.println("<p>Lưu hóa đơn nhập thất bại!</p>");
            }
        }
    %>
</body>
</html>
