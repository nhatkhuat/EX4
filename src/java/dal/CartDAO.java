/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Customer;
import model.Product;

/**
 *
 * @author hihihihaha
 */
public class CartDAO extends DBContext {

    public List<Cart> getAllCart() {

        List<Cart> sList = new ArrayList<>();
        String sql = "select * from Cart";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("CartID");
                String date = rs.getString("Date");
                int quantity = rs.getInt("Quantity");
                int price = rs.getInt("Price");
                int total = price * quantity;
                int CusID = rs.getInt("CusID");
                int id = rs.getInt("ProductID");
                String name = rs.getString("Name");
                String img = rs.getString("Image");
                Cart s = new Cart(cartID, date, quantity, total, price, CusID, id, name, img, null);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public void increaseProductByN(int n, int pid, int cusid) {
        String sql = """
                     UPDATE Cart
                     set Quantity=Quantity+?,Total=Total + (Price*?)
                     where ProductID=? and CusID=?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, n);
            st.setInt(2, n);
            st.setInt(3, pid);
            st.setInt(4, cusid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void removeItem(int cartid) {
        String sql = """
                     delete from Cart
                     where CartID = ?""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cartid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void checkOut(int invoice, int cartid) {
        // set total = 0 de danh dau da tao hoa don
        // set price = invoiceID
        String sql = """
                     UPDATE Cart
                     set InvoiceID = ? 
                     where CartID=?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, invoice);
            st.setInt(2, cartid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public static void main(String[] args) {
        CartDAO cdao = new CartDAO();
        cdao.checkOut(2, 36);
    }

    public int NumberOfCart(int cusid) {
        int number = 0;
        String sql = """
                     SELECT CusID, COUNT(*) AS Num
                     FROM Cart
                     where CusID=? and InvoiceID is null
                     GROUP BY CusID""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cusid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int TotalOfCartOfCustomer(int cusid) {
        int number = 0;
        String sql = """
                     SELECT CusID, Sum(Total) AS Num
                     FROM Cart
                     where CusID=? and InvoiceID is null
                     GROUP BY CusID""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cusid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }
    public int TotalOfCart(int cusid) {
        int number = 0;
        String sql = """
                     SELECT CusID, Sum(Total) AS Num
                     FROM Cart
                     where CusID=? and InvoiceID is not null
                     GROUP BY CusID""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cusid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int NumberOfCartByMonth(int month) {
        int number = 0;
        String sql = """
                     select sum(Quantity) as Num 
                     from Cart c, Product p
                     where c.ProductID = p.ProductID
                     and month(Date) = ? 
                     and InvoiceID is not null""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public float NumberProductSold() {
        int number = 0;
        String sql = """
                     select sum(Quantity) as Num 
                     from Cart c, Product p
                     where c.ProductID = p.ProductID
                     and InvoiceID is not null""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public float Expense() {
        int number = 0;
        String sql = """
                     SELECT sum(Purchase*Quantity) as Num
                     FROM Product p,Cart c
                     where c.ProductID = p.ProductID
                     and InvoiceID is not null""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public float Revenue() {
        int number = 0;
        String sql = """
                     SELECT Sum(total) AS Num
                     FROM Cart
                     where InvoiceID is not null""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int ExpenseBYMonth(int month) {
        int number = 0;
        String sql = """
                     SELECT sum(Purchase*Quantity) as Num
                     FROM Product p,Cart c
                     where c.ProductID = p.ProductID
                     and InvoiceID is not null 
                     and month(Date) = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public int RevenueByMonth(int month) {
        int number = 0;
        String sql = """
                     SELECT Sum(total) AS Num
                     FROM Cart
                     where InvoiceID is not null 
                     and month(Date) = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, month);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                number = rs.getInt("Num");
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return number;
    }

    public void addCart(int pid, int cusid) {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(date);
        String sql = """
                     INSERT INTO Cart(Date, Quantity,Total,Price,CusID,ProductID)
                     VALUES (?,1,?,?,?,?)""";
        DAO dao = new DAO();
        Product p = dao.getProductByProductID(pid);
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, dateString);
            st.setInt(2, p.getPrice());
            st.setInt(3, p.getPrice());
            st.setInt(4, cusid);
            st.setInt(5, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void minusCart(int cartid) {
        String sql = """
                     UPDATE Cart
                     set Quantity=Quantity-1,Total=Price*(Quantity-1)
                     where CartID=?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cartid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void plusCart(int cartid) {
        String sql = """
                     UPDATE Cart
                     set Quantity=Quantity+1,Total=Price*(Quantity+1)
                     where CartID=?""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cartid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateQuantity(int quantity, int cartid) {
        String sql = """
                     UPDATE Cart
                     set Quantity=?, Total = Price*?
                     where CartID=?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, quantity);
            st.setInt(2, quantity);
            st.setInt(3, cartid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

}
