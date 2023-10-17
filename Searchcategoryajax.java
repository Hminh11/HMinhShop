    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Control;

import dao.DAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ^Zin^
 */
public class Searchcategoryajax extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        String categoryID= request.getParameter("he");
        List<Product>list = dao.getallProductbyID(categoryID);
        List<Category>listC = dao.getallCategory();
        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);
        PrintWriter out = response.getWriter();
        for (Product o : list){
            out.println("<div class=\"col-lg-3 col-md-6 col-sm-12 pb-1\">\n"
                    + "                        <div class=\"pd card product-item border-0 mb-4\">\n"
                    + "                            <div class=\"card-header product-img position-relative overflow-hidden bg-transparent border p-0\">\n"
                    + "                                <img class=\"img-fluid w-100\" src=\"" + o.getImage() + "\" alt=\"\">\n"
                    + "                            </div>\n"
                    + "                            <div class=\"card-body border-left border-right text-center p-0 pt-4 pb-3\">\n"
                    + "                                <h6 class=\"text-truncate mb-3\">" + o.getName() + "</h6>\n"
                    + "                                <div class=\"d-flex justify-content-center\">\n"
                    + "                                    <h6>" + o.getPrice() + "VNÐ</h6><h6 class=\"text-muted ml-2\">\n"
                    + "                                </div>\n"
                    + "                            </div>\n"
                    + "                            <div class=\"card-footer d-flex justify-content-between bg-light border\">\n"
                    + "                                <a href=\"Detail?pid="+o.getId()+"\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-eye text-primary mr-1\"></i>View Detail</a>\n"
                    + "                                <a href=\"\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-shopping-cart text-primary mr-1\"></i>Add To Cart</a>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "                    </div>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
