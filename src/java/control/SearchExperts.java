/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.AccountServices;
import DAO.CourseServices;
import DAO.ExpertServices;
import DAO.StudentServices;
import Models.Account;
import Models.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class SearchExperts extends HttpServlet {

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
            out.println("<title>Servlet SearchStudents</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchStudents at " + request.getContextPath() + "</h1>");
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
    
    AccountServices accountServices = new AccountServices();
    ExpertServices expertService = new ExpertServices();
    CourseServices courseServices = new CourseServices();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        PrintWriter out = response.getWriter();
        try {
            String[] content = request.getParameter("content").split("///");
            int courseId = Integer.parseInt(content[1]);
            String name = content[0];
            ArrayList<Account> listExperts = new ArrayList<>();
            if (courseId == 0) {
                listExperts = expertService.getlistSearchNameExperts(name);
            } else {
                listExperts = expertService.getlistSearchExperts(name, courseId);
            }
            String t = "";
            for (Account s : listExperts) {
                t = " <tr>\n"
                        + "                                                        <td>\n"
                        + "                                                            <h2 class=\"table-avatar\">\n"
                        + "                                                                <a href=\"managerViewStudent?username=" + s.getUsername() + "\" class=\"avatar avatar-sm me-2\"><img class=\"avatar-img rounded-circle\" src=\"" + expertService.getProfileExpertByUsername(s.getUsername()).getAvatar() + "\" alt=\"User Image\"></a>\n"
                        + "                                                                <a href=\"managerViewStudent?username=" + s.getUsername() + "\">" + s.getFullname() + "<span>" + s.getUsername() + "</span></a>\n"
                        + "                                                            </h2>\n"
                        + "                                                        </td>\n"
                        + "                                                        <td>Student</td>\n"
                        + "                                                        <td>" + s.getLastAccess() + "</td>\n"
                        + "                                                        <td><a href=\"viewSchedule?username=" + s.getUsername() + "\" class=\"btn btn-sm bg-success-light me-2\" title=\"Normal\">\n"
                        + "                                                                <i class=\"fe fe-calendar\"></i>\n"
                        + "                                                            </a></td>\n"
                        + "                                                        <td>\n"
                        + "                                                            <div class=\"actions\">\n";
                if (s.getRole() != 1) {
                    t += "<a onclick=\"managerUnlockExpert('" + s.getUsername() + "')\" class=\"btn btn-sm bg-success-light me-2\" title=\"Locked\">\n"
                            + "     <i class=\"fe fe-disabled\"></i>\n"
                            + "             </a>\n";
                } else if (s.getRole() == 1) {
                    t
                            += "          <a onclick=\"managerLockExpert('" + s.getUsername() + "')\" class=\"btn btn-sm bg-success-light me-2\" title=\"Normal\">\n"
                            + "     <i class=\"fe fe-check\"></i>\n"
                            + "           </a>\n";
                }

                t += "                                                            </div>\n"
                        + "                                                        </td>\n"
                        + "                                                        <td class=\"text-end\">\n"
                        + "                                                            <div class=\"views\" style=\"display: flex;justify-content: flex-end;\"> \n";
                if (s.getRole() != 1) {
                    t += "                                                                    <a onclick=\"managerUnlockExpert('" + s.getUsername() + "')\" class=\"btn btn-sm bg-success-light me-2\" title=\"Edit\">\n"
                            + "                                                                        <i class=\"fe fe-edit\"></i>\n"
                            + "                                                                    </a>\n";
                } else if (s.getRole() == 1) {
                    t
                            += "                                                                    <a onclick=\"managerLockExpert('" + s.getUsername() + "')\" class=\"btn btn-sm bg-success-light me-2\" title=\"Edit\">\n"
                            + "                                                                        <i class=\"fe fe-edit\"></i>\n"
                            + "                                                                    </a>\n";
                }
                t
                        += "                                                                <a href=\"managerViewExpert?username=" + s.getUsername() + "\" class=\"btn btn-sm bg-success-light me-2\" title=\"View\">\n"
                        + "                                                                    <i class=\"fe fe-eye\"></i>\n"
                        + "                                                                </a>\n"
                        + "                                                            </div>\n"
                        + "                                                        </td>\n"
                        + "                                                    </tr>";
                out.println(t);
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
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
        AccountServices accountServices = new AccountServices();
        ExpertServices expertServices = new ExpertServices();
        CourseServices courseServices = new CourseServices();

        String nameSearch = request.getParameter("nameSearch");
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");

        if (courseId == 0) {
            if (nameSearch != null) {
                List<Course> listCourses = courseServices.getListCourse();
                ArrayList<Account> listExperts = expertServices.getlistSearchNameExperts(nameSearch);

                session.setAttribute("courseId", courseId);

                session.setAttribute("nameSearch", nameSearch);
                request.setAttribute("listCourses", listCourses);
                request.setAttribute("listExperts", listExperts);
                request.setAttribute("expertServices", expertServices);
//                session.setAttribute("account", account);

                request.getRequestDispatcher("Views/searchExperts.jsp").forward(request, response);
            }
            List<Course> listCourses = courseServices.getListCourse();
            response.sendRedirect("manageExperts");
        } else {
            List<Course> listCourses = courseServices.getListCourse();
            ArrayList<Account> listExperts = expertServices.getlistSearchExperts(nameSearch, courseId);

            session.setAttribute("courseId", courseId);

            session.setAttribute("nameSearch", nameSearch);
            request.setAttribute("listCourses", listCourses);
            request.setAttribute("listExperts", listExperts);
            request.setAttribute("expertServices", expertServices);
//            session.setAttribute("account", account);

            request.getRequestDispatcher("Views/searchExperts.jsp").forward(request, response);
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
