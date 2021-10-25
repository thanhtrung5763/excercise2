package com.example.excercise2.controller;

import com.example.excercise2.dao.UserDAO;
import com.example.excercise2.model.UserEntity;
import com.example.excercise2.util.CookieUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name ="DownloadServlet",value ="/download")
public class DownloadServlet extends HttpServlet {
    private UserDAO userDAO;
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        req.setAttribute("cookieExist", true);
        if(action == null) {
            action = "viewAlbums";
        }
        String url = "/download/";
        if(action.equals("viewAlbums")) {
            url += "download.jsp";
        }
        else if(action.equals("checkUser")) {
            url += checkUser(req, resp);
        }
        else if(action.equals("viewCookies")) {
            url += "view_cookies.jsp";
        }
        else if(action.equals("deleteCookies")) {
            url += deleteCookies(req, resp);
            req.setAttribute("cookieExist", false);
        }
        else {
            url += "download.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        String url = "/download/";
        if(action.equals("registerUser")) {
            url += registerUser(req, resp);
        }
        else {
            url += "download.jsp";
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(req, resp);
    }

    private String checkUser(HttpServletRequest req, HttpServletResponse resp) {
        String productCode = req.getParameter("productCode");
        HttpSession session = req.getSession();
        session.setAttribute("productCode", productCode);
        UserEntity user = (UserEntity) session.getAttribute("user");

        String url;
        if (user == null) {
            Cookie[] cookies = req.getCookies();
            String emailAddress =
                    CookieUtils.getCookieValue(cookies, "emailCookie");

            // if cookie doesn't exist, go to Registration page
            if (emailAddress == null || emailAddress.equals("")) {
                url = "register.jsp";
            }
            // if cookie exists, create User object and go to Downloads page
            else {
                ServletContext sc = getServletContext();
                user =  UserDAO.getUser(emailAddress);
                session.setAttribute("user", user);
                url = productCode + "_download.jsp";
            }
        }
        // if User object exists, go to Downloads page
        else {
            url = productCode + "_download.jsp";
        }
        return url;
    }
    private String registerUser(HttpServletRequest req,
                                HttpServletResponse resp) {

        // get the user data
        String email = req.getParameter("email");
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String message = "";
        String url;
        if(userDAO.isExist(email)) {
            message = "This email address already exists.<br>" +
                    "Please enter another email address.";
            url = "register.jsp";
        }
        else {
            UserEntity user = new UserEntity(email, firstName, lastName);
            req.setAttribute("user", user);
            UserDAO.insertUser(user);
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            String productCode = (String) session.getAttribute("productCode");
            url = productCode + "_download.jsp";
            // add a cookie that stores the user's email as a cookie
            Cookie c1 = new Cookie("emailCookie", email);
            c1.setMaxAge(60 * 60 * 24 * 365 * 2); // set age to 2 years
            c1.setPath("/");                      // allow entire app to access it
            resp.addCookie(c1);

            // add a cookie that stores the user's as a cookie
            Cookie c2 = new Cookie("firstNameCookie", firstName);
            c2.setMaxAge(60 * 60 * 24 * 365 * 2); // set age to 2 years
            c2.setPath("/");                      // allow entire app to access it
            resp.addCookie(c2);
        }
        System.out.println(url);
        req.setAttribute("message", message);
        return url;
    }
    private String deleteCookies(HttpServletRequest request,
                                 HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0); //delete the cookie
            cookie.setPath("/"); //allow the download application to access it
            response.addCookie(cookie);
        }
        String url = "view_cookies.jsp";
        return url;
    }
}
