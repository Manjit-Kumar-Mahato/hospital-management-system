package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(req.getParameter("id"));
            String fullName = req.getParameter("fullName");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("password");

            Doctor d = new Doctor(id,fullName,dob,qualification,specialist,email,mobno,password);
            

            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateDoctor(d)) {
                session.setAttribute("succMsg", "Doctor Updated Successfully");
                resp.sendRedirect("view_doctors");
            } else {
                session.setAttribute("errorMsg", "Something went wrong");
                resp.sendRedirect("view_doctors");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}