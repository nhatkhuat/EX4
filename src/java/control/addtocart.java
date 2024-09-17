/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.CartDAO;
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
import model.*;

/**
 *
 * @author Dell
 */
@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        CartDAO cdao = new CartDAO();
        session.setAttribute("dao", dao);
        if (session.getAttribute("customer") == null) {
            request.setAttribute("loginRequire", "You have to login before add to cart!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        Customer customer = (Customer) session.getAttribute("customer");
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product product = dao.getProductByProductID(pid);
        if (product.getAvailable() <= 0) {
            response.sendRedirect("home");
        } else {
            List<Cart> CartList = dao.getCartByCustomerID(customer.getCusID());
            boolean exist = false;
            boolean increase = true;
            for (Cart cart : CartList) {
                if (cart.getProductID() == pid) {
                    exist = true;
                    if (cart.getQuantity() >= product.getAvailable() || product.getAvailable() == 0) {
                        increase = false;
                    }
                }
            }
            if (exist == true) {
                if (increase == true) {
                    cdao.increaseProductByN(1, pid, customer.getCusID());
                }
            } else {
                cdao.addCart(pid, customer.getCusID());
            }
            if (!response.isCommitted()) {
                response.sendRedirect("home");
            }
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
        processRequest(request, response);
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
