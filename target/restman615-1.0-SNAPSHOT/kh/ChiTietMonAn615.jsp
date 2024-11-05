<%@page import="model.ThanhVien615"%>
<%@page import="java.util.List"%>
<%@page import="model.MonAn615" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi Tiết Món Ăn</title>
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
</head>
<body>
    <%
         ThanhVien615 kh = (ThanhVien615)session.getAttribute("khachhang");
            if(kh==null){
                response.sendRedirect("../DangNhap615.jsp?err=timeout");
            }
    %>
    <%
        String idParam = request.getParameter("id");
        List<MonAn615> listMonAn = (List<MonAn615>) session.getAttribute("listMonAn");
        MonAn615 monAn = null;

        // Kiểm tra xem listMonAn có khác null và không rỗng
        if (listMonAn != null) {
            for (MonAn615 item : listMonAn) {
                // So sánh id của món ăn với idParam
                if (String.valueOf(item.getId()).equals(idParam)) {
                    monAn = item;
                    break; // Dừng vòng lặp khi tìm thấy
                }
            }
        }

        // Xóa session sau khi lấy dữ liệu (nếu cần thiết)
        // session.removeAttribute("listMonAn");
        
        if (monAn != null) {
    %>
        <h2>Chi Tiết Món Ăn</h2>
        <p><strong>ID:</strong> <%= monAn.getId() %></p>
        <p><strong>Tên Món:</strong> <%= monAn.getName() %></p>
        <p><strong>Mô Tả:</strong> <%= monAn.getMota() %></p>
        <p><strong>Giá:</strong> <%= monAn.getGia() %></p>
    <%
        } else {
    %>
        <p>Không tìm thấy thông tin món ăn.</p>
    <%
        }
    %>
</body>
</html>
