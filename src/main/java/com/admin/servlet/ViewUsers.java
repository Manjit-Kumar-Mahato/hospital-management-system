package com.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/view_users")
public class ViewUsers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UserDao dao = new UserDao(DBConnect.getConn());
        List<User> list = dao.getAllUsers();

        req.setAttribute("userList", list);

        req.getRequestDispatcher("/admin/view_users.jsp")
           .forward(req, resp);
    }
}