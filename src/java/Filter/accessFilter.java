/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Filter;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Customer;

/**
 *
 * @author nhatk
 */
@WebFilter(filterName = "access", urlPatterns = {"/.jsp", "/*"} )
public class accessFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public accessFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("access:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("access:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("access:doFilter()");
        }

        doBeforeProcessing(request, response);
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getServletPath();
        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") ||
            uri.endsWith(".jpg") || uri.endsWith(".gif") || uri.endsWith(".woff") || 
            uri.endsWith(".ttf") || uri.endsWith(".svg") || uri.endsWith(".ico")) {
            chain.doFilter(request, response);
            return;
        }
        HttpSession session = req.getSession();
        Customer cus = new Customer();
        AccountDAO accdao = new AccountDAO();
        if (session.getAttribute("customer") != null) {
            // ai đó đã đăng nhập, chưa biết là admin hay user
            cus = (Customer) session.getAttribute("customer");
            int cusid = cus.getCusID();
            Account acc = accdao.getAccountByCusID(cusid);
            if (acc.getIsAdmin() == 0) {
                // day la user
                if (uri.endsWith("login.jsp") == false && uri.endsWith("login") == false
                        && uri.endsWith("retrieve") == false
                        && uri.endsWith("signUp.jsp") == false && uri.endsWith("signUp") == false
                        && uri.endsWith("cart.jsp") == false && uri.endsWith("cart") == false
                        && uri.endsWith("category.jsp") == false && uri.endsWith("category") == false
                        && uri.endsWith("detail.jsp") == false && uri.endsWith("detail") == false
                        && uri.endsWith("logout") == false && uri.endsWith("remove") == false
                        && uri.endsWith("minus") == false && uri.endsWith("plus") == false
                        && uri.endsWith("update") == false && uri.endsWith("forgotPass.jsp") == false
                        && uri.endsWith("home.jsp") == false && uri.endsWith("home") == false
                        && uri.endsWith("invoice.jsp") == false && uri.endsWith("checkout") == false
                        && uri.endsWith("profile.jsp") == false && uri.endsWith("profile") == false
                        && uri.endsWith("search.jsp") == false && uri.endsWith("search") == false) {
                    // những trang trên là trang customer có thể truy cập, 
                    // còn không thì sang trang thông báo bạn ko có quyền truy cập trang này
                    req.getRequestDispatcher("notAllowToAccess.jsp").forward(request, response);
                }

            } else {
                // day la admin
                // co quyen truy cap tat ca trang 
                // -->  khong can filter gi ca
            }
        } else {
            // chua ai dang nhap ca
            // khong co quyen them gio hang, checkout, invoice, profile
            if (uri.endsWith("login.jsp") == false && uri.endsWith("login") == false
                    && uri.endsWith("cart.jsp") == false && uri.endsWith("cart") == false
                    && uri.endsWith("forgotPass.jsp") == false && uri.endsWith("retrieve") == false
                    && uri.endsWith("signUp.jsp") == false && uri.endsWith("signUp") == false
                    && uri.endsWith("category.jsp") == false && uri.endsWith("category") == false
                    && uri.endsWith("detail.jsp") == false && uri.endsWith("detail") == false
                    && uri.endsWith("remove") == false && uri.endsWith("update") == false
                    && uri.endsWith("minus") == false && uri.endsWith("plus") == false
                    && uri.endsWith("home.jsp") == false && uri.endsWith("home") == false
                    && uri.endsWith("search.jsp") == false && uri.endsWith("search") == false) {
                // còn không thì sang trang thông báo bạn ko có quyền truy cập trang này
                req.getRequestDispatcher("notAllowToAccess.jsp").forward(request, response);
            }

        }

        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("access:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("access()");
        }
        StringBuffer sb = new StringBuffer("access(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
