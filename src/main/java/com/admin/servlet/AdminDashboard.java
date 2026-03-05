package com.admin.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;

@WebServlet("/admin_dashboard")
public class AdminDashboard extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        UserDao udao = new UserDao(DBConnect.getConn());


        req.setAttribute("doctorCount", dao.countDoctor());
        req.setAttribute("userCount", udao.countUser());  

        req.getRequestDispatcher("/admin/index.jsp")
           .forward(req, resp);
    }
}