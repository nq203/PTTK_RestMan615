<%@page import="java.util.Date"%>
<%@page import="model.HoaDonNhap615"%>
<%@page import="model.NvKho615"%>
<%@page import="model.NhaCungCap615"%>
<%@page import="model.NguyenLieuNhap615"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.NguyenLieuDAO615"%>
<%@page import="model.NguyenLieu615"%>
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
    <title>Tìm Kiếm Nguyên Liệu</title>
</head>
<body>
    <h1>Tìm Kiếm Nguyên Liệu</h1>
    <%
        // Checking if supplier is set in session
        String idParam = request.getParameter("id");
        List<NhaCungCap615> danhSachNhaCungCap = (List<NhaCungCap615>) session.getAttribute("listNCC");
        List<NguyenLieuNhap615> listNLNhap = (List<NguyenLieuNhap615>) session.getAttribute("listNLNhap");
        NhaCungCap615 nhaCC = (NhaCungCap615) session.getAttribute("nhaCC");
        
        if (danhSachNhaCungCap != null) {
            for (NhaCungCap615 item : danhSachNhaCungCap) {
                if (String.valueOf(item.getId()).equals(idParam)) {
                    nhaCC = item;
                    session.setAttribute("nhaCC", nhaCC);
                    break;
                }
            }
        }
        
        if (nhaCC == null) {
            out.println("<p>Vui lòng chọn nhà cung cấp trước!</p>");
            return;
        }
    %>

    <h2>Nhà Cung Cấp: <%= nhaCC.getName() %></h2>
    <form method="post" action="GDChonNguyenLieu615.jsp">
        <input type="text" name="tenNguyenLieu" placeholder="Nhập tên nguyên liệu" required>
        <input type="submit" value="Tìm kiếm">
    </form>

    <%
        String tenNguyenLieu = request.getParameter("tenNguyenLieu");
        List<NguyenLieu615> listNguyenLieu = null;

        if (tenNguyenLieu != null && !tenNguyenLieu.isEmpty()) {
            NguyenLieuDAO615 nguyenLieuDAO = new NguyenLieuDAO615();
            listNguyenLieu = nguyenLieuDAO.getNguyenLieuTheoTen(tenNguyenLieu);
            session.setAttribute("listNguyenLieu", listNguyenLieu);
        }
    %>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Tên Nguyên Liệu</th>
            <th>Đơn giá</th>
            <th>Số lượng còn lại</th>
            <th>Chọn</th>
        </tr>
        <%
            if (listNguyenLieu != null && !listNguyenLieu.isEmpty()) {
                for (NguyenLieu615 nguyenLieu : listNguyenLieu) {
        %>
            <tr>
                <td><%= nguyenLieu.getTen() %></td>
                <td><%= nguyenLieu.getGia() %></td>
                <td><%= nguyenLieu.getSoLuong() %></td>
                <td>
                    <a href="GDNhapSL615.jsp?id=<%= nguyenLieu.getId() %>">Chọn</a>
                </td>
            </tr>
        <%
                }
            } else if (tenNguyenLieu != null) {
        %>
            <tr>
                <td colspan="4">Không tìm thấy nguyên liệu nào.</td>
            </tr>
        <%
            }
        %>
    </table>

    <h2>Nguyên Liệu Đã Nhập</h2>
    <%
        if (listNLNhap != null && !listNLNhap.isEmpty()) {
    %>
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Tên Nguyên Liệu</th>
                <th>Đơn giá</th>
                <th>Số lượng Nhập</th>
                <th>Thành tiền</th>
            </tr>
            <%
                double totalGia = 0;
                for (NguyenLieuNhap615 nlNhap : listNLNhap) {
                    NguyenLieu615 nguyenLieu = nlNhap.getNguyenLieu();
                    int soLuongNhap = nlNhap.getSoLuong();
                    double thanhTien = nguyenLieu.getGia() * soLuongNhap;
                    totalGia += thanhTien;
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
            <tr>
                <td colspan="3"><strong>Tổng giá trị hóa đơn:</strong></td>
                <td><%= totalGia %></td>
            </tr>
        </table>
        
        <!-- Submit button to confirm the invoice -->
        <form method="post" action="GDXacNhan615.jsp">
            <input type="hidden" name="totalGia" value="<%= totalGia %>">
            <input type="submit" value="Xác nhận hóa đơn">
        </form>
    <%
        } else {
    %>
        <p>Chưa có nguyên liệu nào được nhập.</p>
    <%
        }
    %>
</body>
</html>
