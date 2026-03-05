package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/appointment")
public class LoadAppointment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Check user login
        if (session.getAttribute("userObj") == null) {
            resp.sendRedirect("user_login.jsp");
            return;
        }

        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        List<Doctor> list = dao.getAllDoctor();

        req.setAttribute("doctorList", list);

        req.getRequestDispatcher("user_appointment.jsp")
           .forward(req, resp);
    }
}