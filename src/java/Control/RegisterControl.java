/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;

/**
 *
 * @author ^Zin^
 */
public class RegisterControl extends HttpServlet {

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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        int r;
        String username = request.getParameter("txtUser");
        String pass = request.getParameter("txtPassword");
        String repass = request.getParameter("txtRe-password");
        String email = request.getParameter("txtEmail");
        boolean t = dao.checkAccountExsist(username);
        if (username.isEmpty() || pass.isEmpty() || repass.isEmpty() || email.isEmpty()) {
            r = 1;
            request.setAttribute("error", r);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (t == true) {
            r = 2;
            request.setAttribute("error", r);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (!pass.equals(repass)) {
            r = 3;
            request.setAttribute("error", r);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            Random rd = new Random();
            int n1 = rd.nextInt(10);
            int n2 = rd.nextInt(10);
            int n3 = rd.nextInt(10);
            int n4 = rd.nextInt(10);
            session.setAttribute("username", username);
            session.setAttribute("password", pass);
            session.setAttribute("email", email);
            session.setAttribute("so1", n1);
            session.setAttribute("so2", n2);
            session.setAttribute("so3", n3);
            session.setAttribute("so4", n4);
            dao.sendMail(email,"HMinh-Shop account","Your OTP verify account is: "+n1+n2+n3+n4);
            request.getRequestDispatcher("otp.jsp").forward(request, response);
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
        processRequest(request, response);
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
