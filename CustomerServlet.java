package com.example.servlet;

import com.example.model.Customer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "images/img1.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "images/img2.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "images/img3.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "images/img4.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "images/img5.jpg"));

        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
