package com.example.excercise2.controller;

import com.example.excercise2.dao.UserDAO;
import com.example.excercise2.model.UserEntity;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name ="EmailList",urlPatterns ={"/emailList", "/allEmailList"})
public class EmailListServlet extends HttpServlet {
    private UserDAO userDAO;
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        String action = req.getParameter("action");
        System.out.println(servletPath);
        try {
            switch (servletPath) {
                case "/emailList":
                    doPost(req, resp);
                    break;
                case "/allEmailList":
                    if(action.equals("join")) {
                        getServletContext()
                                .getRequestDispatcher("/emailList.jsp")
                                .forward(req, resp);
                    }
                    else
                        showAllEmailList(req, resp);
                    break;
                default:
                    doPost(req, resp);
                    break;
            }
        }catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String url = "/";
        String action = req.getParameter("action");
        String message = "";
        if(action == null) {
            action = "join";
        }
        if(action.equals("join")) {
            url += "emailList.jsp";
        }
        else if(action.equals("add")) {
            String firstName = req.getParameter("firstname");
            String lastName = req.getParameter("lastname");
            String email = req.getParameter("email");
            if(userDAO.isExist(email)) {
                message = "This email address already exists.<br>" +
                        "Please enter another email address.";
                url += "emailList.jsp";
            }
            else {
                UserEntity user = new UserEntity(email, firstName, lastName);
                req.setAttribute("user", user);
                UserDAO.insertUser(user);
                url += "thanksEmailList.jsp";
            }
        }
        req.setAttribute("message", message);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(req, resp);
    }
    public void showAllEmailList(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, IOException, ServletException {
        List<UserEntity> lUser = userDAO.getAllEmailList();
        req.setAttribute("lUser", lUser);
        getServletContext()
                .getRequestDispatcher("/allEmailList.jsp")
                .forward(req, resp);
    }
}
