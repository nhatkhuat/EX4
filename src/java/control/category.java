/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author nhatk
 */
@WebServlet(name = "category", urlPatterns = {"/category"})
public class category extends HttpServlet {
    int catid;
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
//            out.println("<title>Servlet category</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet category at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            int index = 1;
            int newid=1;
            
            if (request.getParameter("cid") != null) {
                newid = Integer.parseInt(request.getParameter("cid"));
                catid= newid;
            }
            
            DAO dao = new DAO();
            List<Product> list = dao.getProductByCategoryID(catid);
            int Nopage = getNoPage(list);
            if (request.getParameter("index") != null) {
                index = Integer.parseInt(request.getParameter("index"));
            }

            list = getListIndex(list, index);

            session.setAttribute("listPC", list);
            session.setAttribute("Nopage", Nopage);
            request.setAttribute("currentindex", index);
            request.setAttribute("cname", dao.getCategoryName(catid));
            request.getRequestDispatcher("category.jsp").forward(request, response);
        } catch (Exception e) {
            out.println("Category servlet wrong");
        }
    }

    public int getNoPage(List<Product> list) {
        double page = (double) list.size() / 8;
        page = Math.ceil(page);
        return (int) page;
    }

    public static List<Product> getListIndex(List<Product> list, int index) {
        List<Product> l = new ArrayList<>();
        int size = list.size();
        int start = (8 * index) - 8;
        int end = Math.min((8 * index), size); // Ensure end does not go out of bounds
        for (int i = start; i < end; i++) {
            l.add(list.get(i));
        }
        return l;
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
