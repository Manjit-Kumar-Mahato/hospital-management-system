package com.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/view_doctors")
public class ViewDoctors extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        List<Doctor> list = dao.getAllDoctor();

        req.setAttribute("doctorList", list);
        req.setAttribute("doctorCount", dao.countDoctor());
        req.getRequestDispatcher("/admin/view_doctors.jsp")
                .forward(req, resp);
    }
}