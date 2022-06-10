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
import java.math.BigDecimal;
import java.util.HashMap;

@WebServlet(name = "productServlet", value = "/employees/create")
public class AddEmployeeServlet extends HttpServlet {
    EmployeeService service = RetrofitServiceGenerator.createService(EmployeeService.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/_id.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        BigDecimal price = new BigDecimal(0);
        String name = req.getParameter("name");
        try {
            price = new BigDecimal( req.getParameter("price"));
        } catch (Exception e) {
            System.err.println(e);
        }
        Employee employee = new Employee();
        employee.setName(name);

        employee.setSalary(price);


        if (service.save(employee).execute().isSuccessful()) {
            req.setAttribute("success", "Create success");
        }else {
            req.setAttribute("createFail", "Create fail");
        }

        req.getRequestDispatcher("/_id.jsp").forward(req, resp);    }
}
