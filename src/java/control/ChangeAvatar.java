/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.AccountServices;
import DAO.ExpertServices;
import DAO.StudentServices;
import Models.Account;
import Models.Expert;
import Models.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author Trung Nguyễn Bá
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ChangeAvatar extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeAvatar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeAvatar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        try {
            Part filePart = request.getPart("avatar");
            String fileName = filePart.getSubmittedFileName();
            String aa = "E:\\kien\\LearningEnglish";
            for (Part part : request.getParts()) {
                part.write(aa + "\\web\\image\\" + fileName);
            }
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");

            AccountServices accountServices = new AccountServices();
            accountServices.updateAvatar(account.getUsername(), "./image/" + fileName);
            
            ExpertServices expertServices = new ExpertServices();
            Expert expert = expertServices.getProfileExpertByUsername(account.getUsername());

            StudentServices studentServices = new StudentServices();
            Student student = studentServices.getProfileStudentByUsername(account.getUsername());

            session.setAttribute("account", account);
            request.setAttribute("student", student);
            request.setAttribute("expert", expert);

            if (account.getRole() == 2) {
                request.getRequestDispatcher("Views/editMyStudentProfile.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("Views/editMyExpertProfile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.print(e.getMessage());
        }

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
