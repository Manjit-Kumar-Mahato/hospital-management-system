package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.db.DBConnect;

@WebServlet("/changeUserPassword")
public class ChangeUserPassword extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));

		String oldPass = req.getParameter("oldPassword");
		String newPass = req.getParameter("newPassword");

		UserDao dao = new UserDao(DBConnect.getConn());

		HttpSession session = req.getSession();

		boolean f = dao.changePassword(uid, oldPass, newPass);

		if (f) {

			session.setAttribute("succMsg", "Password Changed Successfully");

		} else {

			session.setAttribute("errorMsg", "Old Password Incorrect");

		}

		resp.sendRedirect("user/change_password.jsp");
	}
}