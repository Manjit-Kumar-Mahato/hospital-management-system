package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctorProfile")
public class UpdateDoctorProfile extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String mobno = req.getParameter("mobno");
        String password = req.getParameter("password");

        Doctor d = new Doctor();
        d.setId(id);
        d.setFullName(fullname);
        d.setEmail(email);
        d.setMobNo(mobno);
        d.setPassword(password);

        DoctorDao dao = new DoctorDao(DBConnect.getConn());

        boolean f = dao.updateDoctorProfile(d);

        HttpSession session = req.getSession();

        if (f) {
            session.setAttribute("succMsg", "Profile Updated");
        } else {
            session.setAttribute("errorMsg", "Something went wrong");
        }

        resp.sendRedirect("doctor/edit_profile.jsp");
        System.out.println("Updating Doctor ID: " + id);
        System.out.println("New Password: " + password);
    }
}