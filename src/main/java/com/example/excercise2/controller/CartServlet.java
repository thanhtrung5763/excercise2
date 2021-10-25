package com.example.excercise2.controller;

import com.example.excercise2.dao.ProductDAO;
import com.example.excercise2.dao.UserDAO;
import com.example.excercise2.model.Cart;
import com.example.excercise2.model.LineItem;
import com.example.excercise2.model.ProductEntity;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Cart",urlPatterns = {"/cart", "/product", "/checkout"})
public class CartServlet extends HttpServlet {
    private ProductDAO productDAO;
    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        System.out.println(servletPath);
        try {
            switch (servletPath) {
                case "/product":
                    HttpSession session = req.getSession();
                    List<ProductEntity> products = productDAO.getAll();
                    session.setAttribute("products", products);

                    String url = "/cart/product.jsp";
                    getServletContext()
                            .getRequestDispatcher(url)
                            .forward(req, resp);
                    break;
                default:
                    doPost(req, resp);
                    break;
            }
        }catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String servletPath = req.getServletPath();
        if(servletPath.equals("/cart")) {
            String url = "/cart/product.jsp";
            ServletContext sc = getServletContext();

            // get current action
            String action = req.getParameter("action");
            if (action == null) {
                action = "cart";  // default action
            }

            if (action.equals("cart")) {
                String productCode = req.getParameter("productCode");
                String quantityString = req.getParameter("quantity");

                HttpSession session = req.getSession();
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                }

                //if the user enters a negative or invalid quantity,
                //the quantity is automatically reset to 1.
                int quantity = Integer.parseInt(quantityString);
                ProductEntity products = productDAO.getProduct(productCode);
                LineItem lineItem = new LineItem();
                lineItem.setProduct(products);
                lineItem.setQuantity(quantity);
                if (quantity > 0) {
                    cart.addItem(lineItem);
                    System.out.println(cart.getCount());
                } else if (quantity == 0) {
                    cart.removeItem(lineItem);
                }

                session.setAttribute("cart", cart);
                url = "/cart/cart.jsp";
            }
            else if(action.equals("update")) {
                String productCode = req.getParameter("productCode");
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                HttpSession session = req.getSession();
                Cart cart = (Cart) session.getAttribute("cart");
                cart.updateQuantityProduct(productCode, quantity);
                session.setAttribute("cart", cart);
                url = "/cart/cart.jsp";
            }
            else if (action.equals("checkout")) {
                url = "/cart/checkout.jsp";
            }

            sc.getRequestDispatcher(url)
                    .forward(req, resp);
        }

    }
}
