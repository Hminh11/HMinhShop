/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import dao.DAO;
import entity.Cart;
import entity.Item;
import entity.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ^Zin^
 */
public class AddtoCartControl extends HttpServlet {

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
        int quantity=1;
        String id;
        DAO dao = new DAO();
        id = request.getParameter("pid");
        Product p = dao.getProductbyID(id);
        if(request.getParameter("tnum")!=null){
        quantity = Integer.parseInt(request.getParameter("tnum"));
        }
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            Cart cart = new Cart();
            List<Item> list = new ArrayList<>();
            Item item = new Item();
            item.setProduct(p);
            item.setQuantity(quantity);
            item.setPrice(p.getPrice()*quantity);
            list.add(item);
            cart.setItems(list);
            session.setAttribute("cart", cart);
        } else {
            Cart cart = (Cart) session.getAttribute("cart");
            List<Item> list = cart.getItems();
            boolean check = false;
            for (Item i : list) {
                if (i.getProduct().getId() == p.getId()) {
                    i.setPrice(i.getPrice()+(p.getPrice()*quantity));
                    i.setQuantity(i.getQuantity() + quantity);
                    check = true;
                }
            }
            if (check == false) {
                Item item = new Item();
                item.setProduct(p);
                item.setQuantity(quantity);
                item.setPrice(p.getPrice()*quantity);
                list.add(item);
            }
            session.setAttribute("cart", cart);
        }
        Cart cart = (Cart) session.getAttribute("cart");
        List<Item> listt = cart.getItems();
        if (listt.isEmpty()) {
            session.setAttribute("cartsize", null);
        } else {
            session.setAttribute("cartsize", listt.size());
        }
        session.setAttribute("quantity", quantity);
        response.sendRedirect("Homepage");

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

    public static void main(String[] agrs) {
        Cart cart = new Cart();
        List<Item> list = new ArrayList<Item>();
        Item t = new Item();
        list = cart.getItems();
        System.out.println(list.size());
    }
}
