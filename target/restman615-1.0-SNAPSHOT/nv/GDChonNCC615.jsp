<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.NhaCungCapDAO615"%>
<%@page import="model.NhaCungCap615"%>

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

        button[type="submit"] {
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
    <title>Chọn Nhà Cung Cấp</title>
</head>
<body>
    <h1>Chọn Nhà Cung Cấp</h1>

    <form method="post" action="GDChonNCC615.jsp">
        <input type="text" name="tenNhaCungCap" placeholder="Nhập tên nhà cung cấp" required>
        <input type="submit" value="Tìm kiếm">
    </form>

    <%
        // Nhận tên nhà cung cấp từ form
        String tenNhaCungCap = request.getParameter("tenNhaCungCap");
        List<NhaCungCap615> danhSachNhaCungCap = null;

        if (tenNhaCungCap != null && !tenNhaCungCap.isEmpty()) {
            NhaCungCapDAO615 nhaCungCapDAO = new NhaCungCapDAO615();
            danhSachNhaCungCap = nhaCungCapDAO.getNhaCungCapTheoTen(tenNhaCungCap);
            session.setAttribute("listNCC", danhSachNhaCungCap);
        }
    %>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Tên Nhà Cung Cấp</th>
            <th>Điện Thoại</th>
            <th>Địa Chỉ</th>
            <th>Chọn</th>
        </tr>
        <%
            if (danhSachNhaCungCap != null && !danhSachNhaCungCap.isEmpty()) {
                for (NhaCungCap615 nhaCungCap : danhSachNhaCungCap) {
        %>
            <tr>
                <td><%= nhaCungCap.getName() %></td>
                <td><%= nhaCungCap.getPhone() %></td>
                <td><%= nhaCungCap.getAddress() %></td>
                <td>
                     <a href="GDChonNguyenLieu615.jsp?id=<%= nhaCungCap.getId() %>">Chọn</a>
                </td>
              
            </tr>
        <%
                }
            } else {
                if(tenNhaCungCap != null){
        %>
            <tr>
                <td colspan="4">Không tìm thấy nhà cung cấp nào.</td>
            </tr>
        <%
            }
            }
        %>
    </table>
    
    
</body>
</html>
