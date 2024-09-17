/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

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
import model.Category;
import model.Customer;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "editcustomer", urlPatterns = {"/editcustomer"})
public class editcustomer extends HttpServlet {

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
        CategoryDAO dao = new CategoryDAO();
        CustomerDAO cusdao = new CustomerDAO();
        HttpSession session = request.getSession();
        int cusid = Integer.parseInt(request.getParameter("cusid"));
        Customer c = cusdao.getCustomerByID(cusid);
        session.setAttribute("editcusid", cusid);
        session.setAttribute("customerEdit", c);
        request.getRequestDispatcher("editcustomer.jsp").forward(request, response);
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
            DAO dao = new DAO();
            CustomerDAO cusdao = new CustomerDAO();
            CategoryDAO cdao = new CategoryDAO();
            HttpSession session = request.getSession();
            int cusid = (int) session.getAttribute("editcusid");
            String name = request.getParameter("name");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String Email = request.getParameter("email");
            int gender = Integer.parseInt(request.getParameter("gender"));
            cusdao.updateCustomer(cusid, name, gender, dob, phone, Email);
            List<Customer> listCus = cusdao.getAllCustomer();
            session.setAttribute("listCus", listCus);
            request.getRequestDispatcher("customerlist.jsp").forward(request, response);
        } catch (Exception ex) {
         out.print("There are some error");
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
