package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/add_appoint")
public class AddAppointment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            int userId = Integer.parseInt(req.getParameter("userid"));
            String fullName = req.getParameter("fullName");
            String gender = req.getParameter("gender");
            String age = req.getParameter("age");
            String appointDate = req.getParameter("appoint_date");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String diseases = req.getParameter("diseases");
            int doctorId = Integer.parseInt(req.getParameter("doc_id"));
            String address = req.getParameter("address");

            Appointment ap = new Appointment();

            ap.setUserId(userId);
            ap.setFullName(fullName);
            ap.setGender(gender);
            ap.setAge(age);
            ap.setAppoinDate(appointDate);
			ap.setEmail(email);
			ap.setPnNo(phno);
            ap.setDiseases(diseases);
            ap.setDoctorId(doctorId);
            ap.setAddress(address);
            ap.setStatus("Pending");

            AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

            HttpSession session = req.getSession();

            if (dao.addAppointment(ap)) {

                session.setAttribute("succMsg", "Appointment Booked Successfully");
                resp.sendRedirect("user_appointment.jsp");

            } else {

                session.setAttribute("errorMsg", "Something went wrong");
                resp.sendRedirect("user_appointment.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}