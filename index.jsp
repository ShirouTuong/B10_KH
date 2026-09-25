<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            width: 80%;
            max-width: 700px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #111;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        th {
            font-weight: bold;
            color: #000;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .avatar {
            width: 50px;
            height: 60px;
            object-fit: cover;
            border-radius: 3px;
        }
    </style>
</head>
<body>

<%
    // Tự động khởi tạo dữ liệu nếu chạy trực tiếp index.jsp không qua Servlet
    if (request.getAttribute("customerList") == null) {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://via.placeholder.com/50x60?text=Hoan"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://via.placeholder.com/50x60?text=Nam"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://via.placeholder.com/50x60?text=Hoa"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://via.placeholder.com/50x60?text=Khoa"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://via.placeholder.com/50x60?text=Thi"));
        request.setAttribute("customerList", customerList);
    }
%>

<div class="container">
    <h2>Danh sách khách hàng</h2>
    <table>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td><c:out value="${customer.name}" /></td>
                    <td><c:out value="${customer.dob}" /></td>
                    <td><c:out value="${customer.address}" /></td>
                    <td>
                        <img src="${customer.image}" alt="${customer.name}" class="avatar" />
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
