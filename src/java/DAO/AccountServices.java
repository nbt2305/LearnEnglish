/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Account;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84877
 */
public class AccountServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    
    public String getMd5(String input)
    {
        try {
 
            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
 
            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());
 
            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);
 
            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
 
        // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    
    
    public Account getAccountByUsername(String username){

        String query = "select * from Account where username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs=ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1), 
                        rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getBoolean(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getInt(9), rs.getFloat(10), rs.getString(11));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
    }
    
    public void updateWallet(String username, float price){
        String query = "update Account set wallet = ? where username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setFloat(1, price);
            ps.setString(2, username);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
       
    }
    
    public void updateLastAccess(String username){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();
        String query = "update Account set lastAccess = ? where username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, dtf.format(now));
            ps.setString(2, username);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
       
    }
    
    public List<Account> getAllAccountStudent(){
        List<Account> list = new ArrayList<>();
        String query = "select username, fullname from Account";
        Account acc;
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                acc = new Account();
                acc.setUsername(rs.getString(1));
                acc.setFullname(rs.getString(2));
                list.add(acc);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
   
   public void resetPassword(String username, String newPassword){
       String query = "update Account set password = ? where username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, getMd5(newPassword));
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
   }
   
   public void insertAccount(String username, String password, String fullName, int age, boolean  gender, String address, String email, String phone, int role){
       String query = "insert into Account values(?,?,?,?,?,?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, getMd5(password));
            ps.setString(3, fullName);
            ps.setInt(4, age);
            ps.setBoolean(5, gender);
            ps.setString(6, address);
            ps.setString(7, email);
            ps.setString(8, phone);
            ps.setInt(9, role);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
   }
   
    public boolean verifyPassword(String password){
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
        return password.matches(regex);
    }
    
    // Update Avatar
    public void updateAvatar(String username, String path) {
        Account account = getAccountByUsername(username);
        
        String query = "Update ProfileOfStudent set avatar=? where username =?";
        if(account.getRole() == 1)
            query = "Update ProfileOfExpert set avatar=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, path);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    // Get List account for admin
    public ArrayList<Account> listAccountForManage(){
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account where role = 1 or role = 2 or role = -1 or role = -2";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString(1), 
                        rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getBoolean(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getInt(9), rs.getFloat(10), rs.getString(11)));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
    }
    
   
    public static void main(String[] args) {
        AccountServices accountServices = new AccountServices();
//        System.out.println(accountServices.getAccountByUsername("customer"));
//        System.out.println(accountServices.getMd5("123456rgbsdrgwb6435t34535v23"));
        ArrayList<Account> acc = accountServices.listAccountForManage();
        for (Account account : acc) {
            System.out.println(account.toString());
        }
    }
}
