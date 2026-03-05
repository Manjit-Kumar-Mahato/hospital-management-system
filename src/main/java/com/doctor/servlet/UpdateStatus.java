package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");

        HttpSession session = req.getSession();
        Doctor d = (Doctor) session.getAttribute("doctObj");

        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

        dao.updateStatus(id, d.getId(), status);

        resp.sendRedirect(req.getContextPath() + "/doctor/view_appointment.jsp");
    }
}