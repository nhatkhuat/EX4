/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AccountDAO;
import dal.CategoryDAO;
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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customer;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "edituser", urlPatterns = {"/edituser"})
public class edituser extends HttpServlet {

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
        AccountDAO accdao = new AccountDAO();
        DAO dao = new DAO();
        CustomerDAO cusdao = new CustomerDAO();
        HttpSession session = request.getSession();
        try {
            int accid = Integer.parseInt(request.getParameter("accid"));
            Account acc = accdao.getAccountByAccID(accid);
            session.setAttribute("acc", acc);
            
            Customer c = accdao.getCustomerByCusID(acc.getCusID());
            
            List<Account> listAcc = accdao.getAllAccount();
            session.setAttribute("listAcc", listAcc);
            request.getRequestDispatcher("edituser.jsp").forward(request, response);
        } catch (Exception e) {
            out.print("There are some wrong");
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
        PrintWriter out = response.getWriter();
        try {
            //        processRequest(request, response);

            AccountDAO accdao = new AccountDAO();
            DAO dao = new DAO();
            CustomerDAO cusdao = new CustomerDAO();
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            int accid = acc.getAccID();
            int cusid = acc.getCusID();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            int role = Integer.parseInt(request.getParameter("role"));
            String phone = request.getParameter("phone");
            
            accdao.updateAccount(accid, username, password, role, cusid);
            
            cusdao.updateCustomer(cusid, name, phone, email);

            List<Account> listAcc = accdao.getAllAccount();
            session.setAttribute("listAcc", listAcc);
            request.getRequestDispatcher("userlists.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException ex) {
            out.print("There are some wrong");
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
