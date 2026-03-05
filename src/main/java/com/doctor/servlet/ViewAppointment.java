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

@WebServlet("/doctor_appointments")
public class ViewAppointment extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Doctor d = (Doctor) session.getAttribute("doctObj");

        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

        List<Appointment> list = dao.getAppointmentByDoctorId(d.getId());

        req.setAttribute("appointList", list);

        req.getRequestDispatcher("/doctor/view_appointments.jsp").forward(req, resp);

    }
}
