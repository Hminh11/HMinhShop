/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBcontext;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.Orderdetail;
import entity.Pid;
import entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ^Zin^
 */
public class DAO {

    Connection con = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public List<Product> getallProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select Product_id,name,description,price,image,category_id,status from Product";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7)));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    public List<Product> getallProductbysellid(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select Product_id,name,description,price,image,category_id,status from Product where seller_id like ?";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7)));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    public List<Product> gettop4Product() {
        List<Product> list = new ArrayList<>();
        String query = "select top 4 Product_id,name,description,price,image,category_id,status from Product";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getnext4Product(int a) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM\n"
                + "    Product\n"
                + "	order by product_id\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT 4 ROWS ONLY;";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, a);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getallCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getallProductbyID(String id) {
        List<Product> list = new ArrayList<>();
        String query = "select Product_id,name,description,price,image,category_id,status from Product where category_id = ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductbyID(String id) {

        String query = "select Product_id,name,description,price,image,category_id,status from Product where Product_id = ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public String getpasswordbyname(String name) {
        String query = "select password from Account where name = ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, name);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }
    public String getemaildbyname(String name) {

        String query = "select email from Account where name = ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, name);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Category getCategorybyID(String id) {
        String query = "select category_id,name,description from Category where category_id =(select category_id from Product where product_id = ?)";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getallProductexceptID(String id) {
        List<Product> list = new ArrayList<>();
        String query = "select Product_id,name,description,price,image,category_id,status from Product where Product_id != ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteProductbyID(String id) {
        List<Product> list = new ArrayList<>();
        String query = "delete from Product where product_id like ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String description, String price, String image, String categoryid, int sellid) {
        String query = "insert into Product(name,description,price,image,category_id,seller_id) \n"
                + "	values (?,?,?,?,?,?)";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, price);
            stm.setString(4, image);
            stm.setString(5, categoryid);
            stm.setInt(6, sellid);
            stm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public void deleteAcc(String id) {
        String query = "delete from Account where id = ?";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public void editProduct(String name, String description, String price, String image, String categoryid, String id, String status) {

        String query = "update Product\n"
                + "set name = ?,\n"
                + "description = ?,\n"
                + "price = ?,\n"
                + "image = ?,\n"
                + "category_id = ?,"
                + "status = ? \n"
                + "where product_id like ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, description);
            stm.setString(3, price);
            stm.setString(4, image);
            stm.setString(5, categoryid);
            stm.setString(6, status);
            stm.setString(7, id);
            stm.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<Product> getallProductbyname(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select Product_id,name,description,price,image,category_id,status from Product where name like ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getallAccexceptid(int id) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account where id != ? ";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Account> getallAcc() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account ";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Pid> getallPidinorderdetailbyorder(int id) {
        List<Pid> list = new ArrayList<>();
        String query = "select * from Orderdetail where oid = ? ";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Pid(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account checklogin(String username, String password) {
        String query = "select * from Account where name like ? and password like ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean checkAccountExsist(String username) {
        String query = "select name from Account where name like ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;

            }
        } catch (Exception e) {
        }
        return false;
    }

    public void RegisterAccount(String username, String password, String email) {
        String query = "insert into Account(name,password,email,admin,seller) values(?,?,?,0,0)";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, email);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void UpdateAccount(String admin,String seller,String id) {
        String query = "update Account set admin=?, seller=? where id = ?";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, admin);
            stm.setString(2, seller);
            stm.setString(3, id);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("6cainongvang@gmail.com", "pjlhclvrbqxxckru");
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("6cainongvang@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);
        } catch (MessagingException e) {

        }

    }

    public void insertOrder(int oid, int id, String add, Date date, double money, String phone, String pay) {
        String query = "insert into Orderp(id,acc_id,addr,date,totalmoney,number,pay,status)\n"
                + "values(?,?,?,?,?,?,?,'Ordered')";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, oid);
            stm.setInt(2, id);
            stm.setString(3, add);
            stm.setDate(4, date);
            stm.setDouble(5, money);
            stm.setString(6, phone);
            stm.setString(7, pay);
            stm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public void insertOrderdetail(int oid, int pid, int quantity, double price) {
        String query = "insert into Orderdetail(oid,pid,quanity,price)\n"
                + "values (?,?,?,?)";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, oid);
            stm.setInt(2, pid);
            stm.setInt(3, quantity);
            stm.setDouble(4, price);
            stm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public List<Order> getOrderbyID(int id) {
        List<Order> list = new ArrayList<>();
        String query = "select * from Orderp where acc_id  = ?";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    public List<Order> getallOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select * from Orderp order by status desc";
        try {
            con = new DBcontext().getConnection();
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return list;
    }

    public void updatestatusOrder(String id) {
        String query = "update Orderp set status ='Confirmed' where id = ?";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public void updatestatusCancelledOrder(String id) {
        String query = "update Orderp set status ='Cancelled' where id = ?";
        try {
            con = DBcontext.getConnection();
            stm = con.prepareStatement(query);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        String pass = dao.getpasswordbyname("minh");
        List<Pid>list = dao.getallPidinorderdetailbyorder(764500);
        List<Orderdetail>listo= new ArrayList<>();
        for(Pid i :list){
            Product p = dao.getProductbyID(i.getPid());
            listo.add(new Orderdetail(i.getOid(),p,i.getQuantity(),i.getPrice()));
        }
        System.out.println(pass);
    }

}
