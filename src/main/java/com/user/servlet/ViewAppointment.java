package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;
import com.entity.User;

@WebServlet("/user_appointment")
public class ViewAppointment extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();

		User u = (User) session.getAttribute("userObj");

		if (u == null) {
			resp.sendRedirect("ulogin.jsp");
			return;
		}

		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

		List<Appointment> list = dao.getAppointmentByUserId(u.getId());

		req.setAttribute("appointList", list);

		req.getRequestDispatcher("user/view_appointment.jsp").forward(req, resp);
	}
}