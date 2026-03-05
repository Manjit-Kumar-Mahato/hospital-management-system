package com.doctor.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;
import com.entity.Doctor;

@WebServlet("/doctor/index")
public class DoctorDashboard extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Doctor d = (Doctor) session.getAttribute("doctObj");

        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

        int total = dao.countAppointmentByDoctorId(d.getId());
        int pending = dao.countPendingAppointmentByDoctorId(d.getId());
        int approved = dao.countApprovedAppointmentByDoctorId(d.getId());

        List<Appointment> todayList = dao.getTodayAppointmentsByDoctor(d.getId());

        req.setAttribute("totalApp", total);
        req.setAttribute("pendingApp", pending);
        req.setAttribute("approvedApp", approved);
        req.setAttribute("todayList", todayList);

        req.getRequestDispatcher("/doctor/index.jsp").forward(req, resp);
    }
}
