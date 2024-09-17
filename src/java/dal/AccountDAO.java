/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customer;

/**
 *
 * @author hihihihaha
 */
public class AccountDAO extends DBContext {

    public List<Account> getAllAccount() {

        List<Account> sList = new ArrayList<>();
        String sql = "select * from Account ";
//                + "where AccID != 1";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("AccID");
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                int isAdmin = rs.getInt("isAdmin");
                int CusID = rs.getInt("CusID");
                Account s = new Account(id, user, pass, isAdmin, CusID);
                sList.add(s);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public List<Account> getListAccount(String username, String password) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account WHERE Username = ? AND Password = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("AccID");
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                int isAdmin = rs.getInt("isAdmin");
                int CusID = rs.getInt("CusID");
                Account acc = new Account(id, user, pass, isAdmin, CusID);
                list.add(acc);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public Account getAccount(String username, String password) {
        Account acc = new Account();
        String sql = "SELECT * FROM Account WHERE Username = ? AND Password = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("AccID");
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                int isAdmin = rs.getInt("isAdmin");
                int CusID = rs.getInt("CusID");
                acc = new Account(id, user, pass, isAdmin, CusID);

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return acc;
    }

    public Account getAccountByAccID(int accid) {
        Account acc = new Account();
        String sql = "SELECT * FROM Account WHERE AccID =  ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("AccID");
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                int isAdmin = rs.getInt("isAdmin");
                int CusID = rs.getInt("CusID");
                acc = new Account(id, user, pass, isAdmin, CusID);

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return acc;

    }
    public Account getAccountByCusID(int cusid) {
        Account acc = new Account();
        String sql = "SELECT * FROM Account WHERE CusID =  ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cusid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("AccID");
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                int isAdmin = rs.getInt("isAdmin");
                int CusID = rs.getInt("CusID");
                acc = new Account(id, user, pass, isAdmin, CusID);

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return acc;
        
        
    }

    public Customer getCustomerByAccID(int accid) {
        Customer cus = new Customer();
        String sql = """
                     SELECT * FROM Account a, Customer c
                     
                     WHERE a.CusID = c.CusID
                     and a.AccID =  ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accid);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("CusID");
                String fullname = rs.getString("Fullname");
                String dob = rs.getString("Dob");
                int gender = rs.getInt("Gender");
                int CusID = rs.getInt("CusID");
                String pho = rs.getString("PhoneNumber");
                String email = rs.getString("Email");
                cus = new Customer(CusID, fullname, gender, dob, pho, email);

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return cus;
    }

    public Customer getCustomerByCusID(int cusid) {
        Customer cus = new Customer();
        String sql = """
                     SELECT * FROM Account a, Customer c
                     WHERE a.CusID = c.CusID
                     and c.CusID =  ?""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cusid);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("CusID");
                String fullname = rs.getString("Fullname");
                String dob = rs.getString("Dob");
                int gender = rs.getInt("Gender");
                int CusID = rs.getInt("CusID");
                String pho = rs.getString("PhoneNumber");
                String email = rs.getString("Email");
                cus = new Customer(CusID, fullname, gender, dob, pho, email);

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return cus;
    }
//

    public void addAccountUser(Account account) throws SQLException {
        String sql = "INSERT INTO Account(Username, Password,isAdmin,CusID) VALUES (?,?,0,?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setInt(3, account.getCusID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void addAccount(Account account) throws SQLException {
        String sql = "INSERT INTO Account(Username, Password,isAdmin,CusID) VALUES (?,?,?,?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setInt(3, account.getIsAdmin());
            st.setInt(4, account.getCusID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        AccountDAO accdao = new AccountDAO();

        Account account = new Account(0, "newuser", "123", 0, 8);
        accdao.addAccount(account);// add account
    }

    public void updateAccount(int accid, String username, String password,int isAdmin, int cusid) {
        String sql = """
                     update Account
                     set Username = ?,
                     Password = ?,
                     isAdmin = ?,
                     CusID = ?
                     where AccID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, isAdmin);
            st.setInt(4, cusid);
            st.setInt(5, accid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    
    public void updateAccount(int cusid, String username, String password) {
        String sql = """
                     update Account
                     set Username = ?,
                     Password = ?
                     where CusID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, cusid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
        
    }

    public void deleteAccount(int accid) {
        String sql = """
                     delete from Account
                     where AccID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }

    }

    public boolean isUsernameTaken(String username) {
        String sql = "SELECT * FROM Account WHERE Username = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public String retrievePassword(String email) {
        String pass = null;
        String sql = """
                     SELECT * FROM Account a, Customer c
                     WHERE a.CusID = c.CusID
                     and c.Email =  ? """;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                pass = rs.getString("Password");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return pass;
    }

    public String retrieveUsername(String email) {
        String user = null;
        String sql = """
                     SELECT * FROM Account a, Customer c
                     WHERE a.CusID = c.CusID
                     and c.Email =  ? """;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                user = rs.getString("Username");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return user;
        
        
    }


}
