/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AccountDAO;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customer;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "signUp", urlPatterns = {"/signUp"})
public class signUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet signUp</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet signUp at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        response.sendRedirect("login.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String Email = request.getParameter("email");
        // Check if the username already exists
        AccountDAO accountDAO = new AccountDAO();
        CustomerDAO cusDAO = new CustomerDAO();
        if (accountDAO.isUsernameTaken(username)) {
            request.setAttribute("signResult", "Username is already taken, please signUp again!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if(cusDAO.getCustomerByMail(Email) == null){
            request.setAttribute("signResult", "Email has existed, please signUp again!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else {
            // If the username is available, create a new Customer, then new account
            Customer cus = new Customer();
            try {
                cusDAO.addCustomer(fullname,Email);
                cus = cusDAO.getCustomerByMail(Email);
                int cusID = cus.getCusID();
                Account account = new Account(0, username, password, 0, cusID);
                accountDAO.addAccountUser(account);
            } catch (SQLException ex) {
                Logger.getLogger(signUp.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("signResult", "SignUp successful, please login!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
