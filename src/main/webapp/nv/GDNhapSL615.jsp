<%@page import="java.util.List"%>
<%@page import="model.NguyenLieu615"%>
<%@page import="model.NguyenLieuNhap615"%>
<%@page import="dao.NguyenLieuDAO615"%>
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

        input[type="number"] {
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
    <title>Nhập Số Lượng Nguyên Liệu</title>
    <script>
        // Redirect to ingredient selection page after successful addition or update
        function redirectToSelection() {
            window.location.href = 'GDChonNguyenLieu615.jsp'; // Replace with your selection page URL
        }
    </script>
</head>
<body>
    <h1>Nhập Số Lượng Nguyên Liệu</h1>

    <%
        // Lấy ID nguyên liệu từ tham số
        String idParam = request.getParameter("id");
        List<NguyenLieu615> listNguyenLieu = (List<NguyenLieu615>) session.getAttribute("listNguyenLieu");
        NguyenLieu615 nguyenLieu = null;
        boolean addedOrUpdated = false;

        if (listNguyenLieu != null) {
            for (NguyenLieu615 item : listNguyenLieu) {
                if (String.valueOf(item.getId()).equals(idParam)) {
                    nguyenLieu = item;
                    break;
                }
            }
        }

        // Check if ingredient exists
        if (nguyenLieu == null) {
            out.println("<p>Nguyên liệu không tồn tại!</p>");
        } else {
            // Handle form submission for quantity entry
            String soLuongNhapParam = request.getParameter("soLuongNhap");

            if (soLuongNhapParam != null) {
                try {
                    int soLuongNhap = Integer.parseInt(soLuongNhapParam);

                    // Retrieve or initialize the list of `NguyenLieuNhap615` in the session
                    List<NguyenLieuNhap615> listNLNhap = (List<NguyenLieuNhap615>) session.getAttribute("listNLNhap");
                    if (listNLNhap == null) {
                        listNLNhap = new java.util.ArrayList<>();
                        session.setAttribute("listNLNhap", listNLNhap);
                    }

                    // Check if the ingredient is already in the list
                    boolean exists = false;
                    for (NguyenLieuNhap615 existingItem : listNLNhap) {
                        if (existingItem.getNguyenLieu().getId() == nguyenLieu.getId()) {
                            // Update the quantity if the ingredient already exists
                            existingItem.setSoLuong(soLuongNhap);
                            exists = true;
                            out.println("<p>Đã cập nhật số lượng nguyên liệu trong danh sách nhập!</p>");
                            break;
                        }
                    }

                    // If the ingredient is not in the list, add a new entry
                    if (!exists) {
                        NguyenLieuNhap615 nguyenLieuNhap = new NguyenLieuNhap615(listNLNhap.size() + 1, nguyenLieu, soLuongNhap);
                        listNLNhap.add(nguyenLieuNhap);
                        out.println("<p>Đã thêm số lượng nguyên liệu vào danh sách nhập!</p>");
                    }

                    addedOrUpdated = true; // Set flag to true after successful addition or update
                } catch (NumberFormatException e) {
                    out.println("<p>Lỗi: Số lượng nhập không hợp lệ!</p>");
                }
            }
    %>

            <h2>Nguyên Liệu: <%= nguyenLieu.getTen() %></h2>
            <p>Đơn giá: <%= nguyenLieu.getGia() %></p>
            <p>Số lượng còn lại: <%= nguyenLieu.getSoLuong() %></p>

            <!-- Form nhập số lượng -->
            <form method="get" action="GDNhapSL615.jsp">
                <input type="hidden" name="id" value="<%= nguyenLieu.getId() %>">
                <label for="soLuongNhap">Số lượng cần nhập:</label>
                <input type="number" name="soLuongNhap" id="soLuongNhap" min="1" required>
                <br><br>
                <input type="submit" value="Xác nhận nhập">
            </form>

    <%
        }
        
        // If the ingredient was added or updated, execute the JavaScript redirect
        if (addedOrUpdated) {
    %>
            <script>
                redirectToSelection();
            </script>
    <%
        }
    %>
</body>
</html>
