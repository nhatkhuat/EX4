/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AccountDAO;
import dal.CartDAO;
import dal.CustomerDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Customer;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "profile", urlPatterns = {"/profile"})
public class profile extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        AccountDAO accdao = new AccountDAO();
        CustomerDAO cdao = new CustomerDAO();
        if (session.getAttribute("customer") == null) {
            request.setAttribute("loginRequire", "You have to login before access to profile!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Account acc = (Account) session.getAttribute("customerAcc");
            Customer cus = accdao.getCustomerByAccID(acc.getAccID());
            session.setAttribute("customer", cus);
            response.sendRedirect("profile.jsp");
        }
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        CustomerDAO cdao = new CustomerDAO();
        AccountDAO accdao = new AccountDAO();
//        int cusid = Integer.parseInt(request.getParameter("cusid"));
        int cusid = Integer.parseInt(request.getParameter("customerid"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        cdao.updateCustomer(cusid, name, gender, dob, phone, email);
        
        accdao.updateAccount(cusid, username, password);
        Account acc = (Account) session.getAttribute("customerAcc");
        Customer cus = accdao.getCustomerByAccID(acc.getAccID());
        Account cusAcc = accdao.getAccount(username, password);
        session.setAttribute("customerAcc", cusAcc);
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        session.setAttribute("customer", cus);
        response.sendRedirect("profile.jsp");
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
