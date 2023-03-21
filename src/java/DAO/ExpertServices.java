/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Account;
import Models.Expert;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class ExpertServices {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Get list Experts of Account
    public ArrayList<Account> getListExpertsOfAccount() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account where role = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get list profileOfExperts
    public ArrayList<Expert> getListProfileOfExperts() {
        ArrayList<Expert> list = new ArrayList<>();
        String query = "select * from ProfileOfExpert";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String avatar = rs.getString(4);

                Expert expert = new Expert(username, title, description, avatar);
                list.add(expert);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get list of accounts
    public ArrayList<Account> getListAccounts() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Update Account of Expert
    public void updateAccountOfExpert(String username, String fullname, int age, String address, String email, String phone) {
        String query = "Update Account set fullname=?,age=?,address=?,email=?, phone=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setInt(2, age);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Update Profile of Expert
    public void updateProfileOfExpert(String username, String description) {
        String query = "Update ProfileOfExpert set description=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, description);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Get Expert account by username
    public Account getExpertByUsername(String username) {
        ArrayList<Account> getListAccounts = getListAccounts();
        for (Account account : getListAccounts) {
            if (account.getUsername().equals(username)) {
                return account;
            }
        }
        return null;
    }

    // Get Profile Expert by username
    public Expert getProfileExpertByUsername(String username) {
        ArrayList<Expert> listProfileOfExpert = getListProfileOfExperts();
        for (Expert expert : listProfileOfExpert) {
            if (expert.getUsername().equals(username)) {
                return expert;
            }
        }
        return null;
    }

    // Get fullname of Expert
    public String getFullNameOfExpert(String username) {
        ArrayList<Account> listAccounts = getListAccounts();
        for (Account account : listAccounts) {
            if (username.equals(account.getUsername())) {
                return account.getFullname();
            }
        }
        return null;
    }

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
    
    // Change Account Password of Expert
    public void changePasswordOfExpert(String username, String password) {
        password = getMd5(password);
        String query = "Update Account set password=? where username=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Get list Expert of Account for manage
    public ArrayList<Account> getListExpertsOfAccountForManage() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account where role = 1 or role = -1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Manager Lock Expert
    public void managerLockExpert(String username, int role) {
        String query = "Update Account set role=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, -1);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Manager UnLock Expert
    public void managerUnlockExpert(String username, int role) {
        String query = "Update Account set role=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Search Expert by name and courseId
    public ArrayList<Account> getlistSearchNameExperts(String nameSearch) {
        ArrayList<Account> listSearchExperts = new ArrayList<>();
        String query = "select * from Account a\n"
                + "where a.username like ? and (role=1 or role=-1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            nameSearch = "%" + nameSearch + "%";
            ps.setString(1, nameSearch);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                listSearchExperts.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSearchExperts;
    }

    // Search Student by name and courseId
    public ArrayList<Account> getlistSearchExperts(String nameSearch, int courseId) {
        ArrayList<Account> listSearchStudents = new ArrayList<>();
        String query = "select *\n"
                + "from Account a, Course c where a.username = c.username and a.username like ? and c.courseId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            nameSearch = "%" + nameSearch + "%";
            ps.setString(1, nameSearch);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                listSearchStudents.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSearchStudents;
    }

    public static void main(String[] args) {
        ExpertServices expertServices = new ExpertServices();
        ArrayList<Account> list = expertServices.getlistSearchExperts("a",1);
        for (Account account : list) {
            System.out.println(account.toString());
        }
    }
}
