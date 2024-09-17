/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AccountDAO;
import dal.CartDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet login</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet login at " + request.getContextPath () + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        String r = request.getParameter("rem");
        // tao 3 cookie: name, pass, remember me
        Cookie cu = new Cookie("cuser", u);
        Cookie cp = new Cookie("cpass", p);
        Cookie cr = new Cookie("crem", r);
        if (r != null) {
            cu.setMaxAge(60 * 60 * 24 * 7);// 7 ngay
            cp.setMaxAge(60 * 60 * 24 * 7);// 7 ngay
            cr.setMaxAge(60 * 60 * 24 * 7);// 7 ngay
        } else {
            cu.setMaxAge(0);// 7 ngay
            cp.setMaxAge(0);// 7 ngay
            cr.setMaxAge(0);// 7 ngay
        }
        // luu vao browser
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);
        
        Account acc = new Account();
        AccountDAO accdao = new AccountDAO();
        DAO dao = new DAO();
        CartDAO cdao = new CartDAO();
        List<Account> l = accdao.getListAccount(u, p);
        Account admin = new Account();
        for (Account a : l) {
            if (a.getIsAdmin() == 1) {
                admin = a;
            }
            if (u != null && p != null && u.equals(a.getUsername())) {
                if (p.equals(a.getPassword())) {
                    String hello = a.getUsername();
                    Account cusAcc = accdao.getAccount(u, p);
                    session.setAttribute("customerAcc", cusAcc);
                    Customer cus = accdao.getCustomerByAccID(cusAcc.getAccID());
                    session.setAttribute("customer", cus);
                    int NumberOfItem = cdao.NumberOfCart(cus.getCusID());
                    session.setAttribute("NoItem", NumberOfItem);
                    int TotalOfCart = cdao.TotalOfCartOfCustomer(cus.getCusID());
                    session.setAttribute("TotalOfCart", TotalOfCart);
                    if (u.equals(admin.getUsername()) && p.equals(admin.getPassword())) {
                        response.sendRedirect("dashboard");
                    } else {
                        response.sendRedirect("home");
                    }
                }
            }
        }
//              session.removeAttribute(user); // xóa 1 session
//              session.invalidate(); xóa tất cả session
        String result = "Incorrect userID or password!";
        request.setAttribute("dt", result);
        if (!response.isCommitted()) {
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
