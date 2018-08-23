/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import FileJava.CauHoi;
import FileJava.CauHoiDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author UserPC
 */
@WebServlet(name = "ChiTietBaiLamServlet", urlPatterns = {"/ChiTietBaiLamServlet"})
public class ChiTietBaiLamServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String userName = request.getParameter("txtGV");
            String sinhvien = request.getParameter("txtSV");
            String sothutu = request.getParameter("txtStt");
            int x = Integer.parseInt(sothutu);

            String loai = request.getParameter("btn");

            /////////////   KHI NHẤN NÚT NEXT   /////////////
            if ("Next".equals(loai)) {
                x++;
            } /////////////   KHI NHẤN NÚT BACK   /////////////
            else if ("Back".equals(loai)) {
                if (x > 1) {
                    x--;
                }
            }

            // ở đây mặc định có 5 câu hỏi
            if (x < 6) {
                request.setAttribute("giaovien", userName);
                request.setAttribute("sinhvien", sinhvien);
                // Load stt, nội dung, đáp án chính xác của Câu hỏi
                CauHoi c = CauHoiDB.LoadNoiDungCauHoi(sinhvien, x);
                request.setAttribute("sothutu", c.stt);
                request.setAttribute("cauhoi", c.noidung);
                request.setAttribute("dapan", c.dapan);                // đáp án đúng của câu hỏi
                
                // Load câu trả lời của sinh viên
                request.setAttribute("cautraloicuasv", c.cautraloi);   // câu trả lời của sinh viên
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("chitietbailam.jsp?gv="+ userName + "&sv="+ sinhvien + "&stt="+ x);
                requestDispatcher.forward(request, response);
            } 
            else {
                request.setAttribute("username", userName);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("dssvlambai.jsp");
                requestDispatcher.forward(request, response);
            }
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
