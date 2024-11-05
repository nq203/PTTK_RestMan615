<%@page import="model.KhachHang615"%>
<%@page import="model.NvKho615"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.ThanhVien615, dao.ThanhVienDAO615" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>Đăng nhập</title>
</head>
<body>
<%
    // Kiểm tra xem có lỗi đăng nhập hay không
    if (request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("timeout")) {
%>
    <h4>Hết phiên làm việc. Làm ơn đăng nhập lại!</h4>
<%
    } else if (request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("fail")) {
%>
    <h4 style="color: red;">Sai tên đăng nhập/mật khẩu!</h4>
<%
    }
%>

<h2>Đăng nhập</h2>
<form name="dangnhap" method="post">
    <table border="0">
        <tr>
            <td>Tên đăng nhập:</td>
            <td><input type="text" name="username" id="username" required /></td>
        </tr>
        <tr>
            <td>Mật khẩu:</td>
            <td><input type="password" name="password" id="password" required /></td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit" /> Đăng Nhập</td>
        </tr>
    </table>
</form>

<%
    // Xử lý đăng nhập sau khi nhấn nút submit
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        ThanhVien615 tv = new ThanhVien615();
        tv.setUsername(username);
        tv.setPassword(password);

        ThanhVienDAO615 dao = new ThanhVienDAO615();
        boolean kq = dao.kiemtraDangnhap(tv);
        System.out.println(kq);
        // Kiểm tra vai trò và điều hướng
        if (kq) {
            if ("khachhang".equalsIgnoreCase(tv.getVaitro())) {
                KhachHang615 khachHang = new KhachHang615(tv.getId(), 
                                     tv.getUsername(), 
                                     tv.getPassword(), 
                                     tv.getName(), 
                                     tv.getAddress(), 
                                     tv.getDate(), 
                                     tv.getPhone(), 
                                     tv.getVaitro());
                session.setAttribute("khachhang", khachHang);
                response.sendRedirect("kh/GDChinhKH615.jsp");
            } else if ("nvkho".equalsIgnoreCase(tv.getVaitro())) {
                NvKho615 nvKho = new NvKho615(tv.getId(), 
                                     tv.getUsername(), 
                                     tv.getPassword(), 
                                     tv.getName(), 
                                     tv.getAddress(), 
                                     tv.getDate(), 
                                     tv.getPhone(), 
                                     tv.getVaitro(), 
                                     "Mô tả cho nhân viên kho"); // Bạn có thể thay đổi giá trị cho mô tả

                session.setAttribute("nvkho", nvKho);
                response.sendRedirect("nv/GDChinhNvKho615.jsp");
            } else {
                response.sendRedirect("DangNhap615.jsp?err=fail");
            }
        } else {
            response.sendRedirect("DangNhap615.jsp?err=fail");
        }
    }
%>
</body>
</html>
