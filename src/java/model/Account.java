/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class Account {
    int AccID;
    String username;
    String password;
    int isAdmin;
    int CusID;

    public Account() {
    }

    public Account(int AccID, String username, String password, int isAdmin, int CusID) {
        this.AccID = AccID;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
        this.CusID = CusID;
    }

    public int getAccID() {
        return AccID;
    }

    public void setAccID(int AccID) {
        this.AccID = AccID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getCusID() {
        return CusID;
    }

    public void setCusID(int CusID) {
        this.CusID = CusID;
    }

    @Override
    public String toString() {
        return "Account{" + "AccID=" + AccID + ", username=" + username + ", password=" + password + ", isAdmin=" + isAdmin + ", CusID=" + CusID + '}';
    }
    
}
