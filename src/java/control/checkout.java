/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.CartDAO;
import dal.DAO;
import dal.InvoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Cart;
import model.Customer;
import model.Product;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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
        DAO dao = new DAO();
        CartDAO cdao = new CartDAO();
        InvoiceDAO idao = new InvoiceDAO();
        int invoice = idao.NumberOfInvoice()+1;
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = formatter.format(date);
        HttpSession session = request.getSession();
        String invoiceID = ""+invoice;
        Customer customer = (Customer) session.getAttribute("customer");
        List<Cart> CartList = dao.getCartByCustomerID(customer.getCusID());
        // set quantity = available nếu avai < quantity
        // cập nhật lên invoice
        for (Cart c : CartList) {//done
            Product p = dao.getProductByProductID(c.getProductID());
            int avai = p.getAvailable();
            int qty = c.getQuantity();
            int remain = avai - qty;
            if (remain <= 0) {
                cdao.updateQuantity(avai, c.getCartID());
            }
            cdao.checkOut(invoice, c.getCartID());
        }
        request.setAttribute("invoicelist", CartList);
        for (Cart c : CartList) {
            Product p = dao.getProductByProductID(c.getProductID());
            int avai = p.getAvailable();
            int qty = c.getQuantity();
            int remain = avai - qty;
            if (remain <= 0) {
                dao.updateProductAvailable(0, p.getProductID());
            } else {
                dao.updateProductAvailable(remain, p.getProductID());
            }
        }
        
        request.setAttribute("invoiceID", invoiceID);
        request.setAttribute("invoiceDate", dateString);
        if (CartList.isEmpty()) {
            if (!response.isCommitted()) {
                response.sendRedirect("home");
            }
        } else {
            session.setAttribute("CartList", CartList);
            invoice++;
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
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
