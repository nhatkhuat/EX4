/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class Customer {
    int CusID;
    String FullName;
    int Gender;
    String Dob;
    String PhoneNumber;
    String Email;

    public Customer() {
    }

    public Customer(int CusID, String FullName, int Gender, String Dob, String PhoneNumber, String Email) {
        this.CusID = CusID;
        this.FullName = FullName;
        this.Gender = Gender;
        this.Dob = Dob;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
    }

    public int getCusID() {
        return CusID;
    }

    public void setCusID(int CusID) {
        this.CusID = CusID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public int getGender() {
        return Gender;
    }

    public void setGender(int Gender) {
        this.Gender = Gender;
    }

    public String getDob() {
        return Dob;
    }

    public void setDob(String Dob) {
        this.Dob = Dob;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    @Override
    public String toString() {
        return "Customer{" + "CusID=" + CusID + ", FullName=" + FullName + ", Gender=" + Gender + ", Dob=" + Dob + ", PhoneNumber=" + PhoneNumber + ", Email=" + Email + '}';
    }
    
}
