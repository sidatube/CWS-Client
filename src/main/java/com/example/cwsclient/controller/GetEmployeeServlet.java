package com.example.cwsclient.controller;

import com.example.cwsclient.Service.EmployeeService;
import com.example.cwsclient.entity.Employee;
import com.example.cwsclient.retrofiet.RetrofitServiceGenerator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/employees")
public class GetEmployeeServlet extends HttpServlet {
    EmployeeService service = RetrofitServiceGenerator.createService(EmployeeService.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Employee> products = service.getProducts().execute().body();
        req.setAttribute("employees",products );
        req.getRequestDispatcher("/employees.jsp").forward(req, resp);
    }

}
