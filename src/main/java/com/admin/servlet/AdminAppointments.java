package com.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/admin_appointments")
public class AdminAppointments extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

        List<Appointment> list = dao.getAllAppointment();

        req.setAttribute("appList", list);

        RequestDispatcher rd = req.getRequestDispatcher("admin/all_appointments.jsp");
        rd.forward(req, resp);
    }
}