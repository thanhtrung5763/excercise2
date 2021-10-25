package com.example.excercise2.controller;

import com.example.excercise2.connection.MyDB;
import com.example.excercise2.util.SqlUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "SQLGatewayServlet", value = "/SQLGatewayServlet")
public class SqlGatewayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sqlStatement = req.getParameter("sqlStatement");
        String sqlResult = "";
        if(sqlStatement != null) {
            try {
                Connection connection = MyDB.CreateConnect();

                // create a statement
                Statement statement = connection.createStatement();

                // parse the SQL string
                sqlStatement = sqlStatement.trim();
                if (sqlStatement.length() >= 6) {
                    String sqlType = sqlStatement.substring(0, 6);
                    if (sqlType.equalsIgnoreCase("select")) {
                        // create the HTML for the result set
                        ResultSet resultSet
                                = statement.executeQuery(sqlStatement);
                        sqlResult = SqlUtils.getHtmlTable(resultSet);
                        resultSet.close();
                    } else {
                        int i = statement.executeUpdate(sqlStatement);
                        if (i == 0) { // a DDL statement
                            sqlResult =
                                    "<p>The statement executed successfully.</p>";
                        } else { // an INSERT, UPDATE, or DELETE statement
                            sqlResult =
                                    "<p>The statement executed successfully.<br>"
                                            + i + " row(s) affected.</p>";
                        }
                    }
                }
                statement.close();
                connection.close();
            } catch (SQLException e) {
                sqlResult = "<p>Error executing the SQL statement: <br>"
                        + e.getMessage() + "</p>";
            }
        }
        HttpSession session = req.getSession();
        session.setAttribute("sqlResult", sqlResult);
        session.setAttribute("sqlStatement", sqlStatement);

        String url = "/sqlgateway/sqlGateway.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(req, resp);
    }
}
