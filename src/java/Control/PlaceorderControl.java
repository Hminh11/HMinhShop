/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import dao.DAO;
import entity.Account;
import entity.Cart;
import entity.Item;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

/**
 *
 * @author ^Zin^
 */
public class PlaceorderControl extends HttpServlet {

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
        Account a = (Account) session.getAttribute("acc");
        Cart c = (Cart) session.getAttribute("cart");
        int id = a.getId();
        double money = 0;
        List<Item> list = c.getItems();
        for (Item i : list) {
            money += i.getPrice();
        }
        money = money + 20000;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        String payment = request.getParameter("payment");
        String add = request.getParameter("address");
        String phone = request.getParameter("phone");
        request.setAttribute("diachi", add);
        request.setAttribute("pho", phone);
        Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000;
        dao.insertOrder(randomNumber, id, add, date, money, phone, payment);
        for (Item i : list) {
            dao.insertOrderdetail(randomNumber, i.getProduct().getId(), i.getQuantity(), i.getPrice());
            }
        
        session.removeAttribute("cart");
        session.removeAttribute("cartsize");
        response.sendRedirect("thankyoupage.html");
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
