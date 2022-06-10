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

@WebServlet(name = "UpdateProductServlet", value = "/employees/update")
public class UpdateEmployeeServlet extends HttpServlet {
    EmployeeService service = RetrofitServiceGenerator.createService(EmployeeService.class);

    public UpdateEmployeeServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        } catch (Exception e) {
            resp.getWriter().println(e);
        }
        if (id <= 0) {
            resp.getWriter().println("Is valid information");
            return;
        }
        Employee obj = service.findById(id).execute().body();
        if (obj == null) {
            resp.setStatus(404);
            resp.getWriter().println("Not found");
            return;
        }
        req.setAttribute("employee", obj);
        req.getRequestDispatcher("/_id.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        int id = 0;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        } catch (Exception e) {
            resp.getWriter().println(e);
        }
        if (id <= 0) {
            resp.getWriter().println("Is valid information");
            return;
        }
        Employee obj = service.findById(id).execute().body();
        if (obj == null) {
            resp.setStatus(404);
            resp.getWriter().println("Not found");
            return;
        }
        BigDecimal price = new BigDecimal(0);
        String name = req.getParameter("name");
        try {
            price = new BigDecimal(req.getParameter("price"));
        } catch (Exception e) {
            System.err.println(e);
        }
        obj.setName(name);
        obj.setSalary(price);
        if (Boolean.TRUE.equals(service.update(id, obj).execute().body())) {
            resp.sendRedirect("/employees");
        } else {
            req.setAttribute("failure", "Updated fail");
            req.getRequestDispatcher("/_id.jsp").forward(req, resp);
        }


    }
}
