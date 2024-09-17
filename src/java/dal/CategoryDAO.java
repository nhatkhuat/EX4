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
import model.Category;
import model.Customer;
import model.Product;

/**
 *
 * @author hihihihaha
 */
public class CategoryDAO extends DBContext {

    public Category getCategoryByID(int id) {
        Category c = null;
        String sql = """
                     SELECT * FROM Category
                     WHERE CategoryID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int catid = rs.getInt("CategoryID");
                String name = rs.getString("Name");
                String des = rs.getString("Description");
                c = new Category(catid, name, des);
            }
        } catch (SQLException e) {
        }
        return c;
    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        System.out.println(dao.getCategoryByID(3));

    }

    public void addCategory(String catname, String description) {
        String sql = """
                     insert into Category
                     values(?,?)""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, catname);
            st.setString(2, description);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void deleteCategory(int cid) {
        String sql = """
                    delete from Product
                    where CategoryID = ? 
                     
                     delete from Category
                     where CategoryID = ?
                     
                     """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cid);
            st.setInt(2, cid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void editCategory(String name, String des, int id) {
        String sql = """
                     Update Category
                       set [Name] = ?,
                       [Description] = ? 
                       where CategoryID = ?
                     """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, name);
            st.setString(2, des);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
