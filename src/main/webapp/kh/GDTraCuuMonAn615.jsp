<%@page import="model.ThanhVien615"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.MonAnDAO615" %>
<%@ page import="model.MonAn615" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tìm Kiếm Món Ăn</title>
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
    <h2>Tìm Kiếm Món Ăn</h2>
    <form action="GDTraCuuMonAn615.jsp" method="get">
        <label id="lblTenMon">Tên Món Ăn</label>
        <input type="text" name="tenMon" value="<%= request.getParameter("tenMon") != null ? request.getParameter("tenMon") : "" %>">
        <button id="btnTimKiem" type="submit">Tìm Kiếm</button>
    </form>

    <%
        String tenMon = request.getParameter("tenMon");
        List<MonAn615> listMonAn = null;
        
        if (tenMon != null && !tenMon.trim().isEmpty()) {
            MonAnDAO615 monAnDAO = new MonAnDAO615();
            listMonAn = monAnDAO.getMonAnTheoTen(tenMon);
            session.setAttribute("listMonAn", listMonAn);
        }
    %>
    <table id="tbMonAn" border="1">
        <tr>
            <th>Tên Món</th>
            <th>Giá</th>
            <th>Xem Chi Tiết</th>
        </tr>
        <%
            if (listMonAn != null && !listMonAn.isEmpty()) {
                for (MonAn615 monAn : listMonAn) {
        %>
           <tr>
                <td><%= monAn.getName() %></td>
                <td><%= monAn.getGia() %></td>
                <td>
                     <a href="ChiTietMonAn615.jsp?id=<%= monAn.getId() %>">Xem Chi Tiết</a>
                </td>
            </tr>
        <%
                }
            } else {
            if(tenMon != null){
        %>
            <tr>
                <td colspan="3">Không tìm thấy món ăn nào.</td>
            </tr>
        <%
            }
            }
        %>
    </table>
</body>
</html>

