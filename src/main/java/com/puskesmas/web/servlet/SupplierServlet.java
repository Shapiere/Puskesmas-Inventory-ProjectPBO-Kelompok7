package com.puskesmas.web.servlet;

import com.puskesmas.web.dao.SupplierDao;
import com.puskesmas.web.model.Supplier;
import com.puskesmas.web.model.User;
import com.puskesmas.web.util.RolePermission;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SupplierServlet", urlPatterns = { "/supplier" })
public class SupplierServlet extends HttpServlet {

    private final SupplierDao supplierDao = new SupplierDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            Supplier edit = null;
            if (id != null && !id.isEmpty()) {
                edit = supplierDao.findById(Integer.parseInt(id));
            }
            List<Supplier> list = supplierDao.findAll();
            req.setAttribute("supplierList", list);
            req.setAttribute("editSupplier", edit);
            req.getRequestDispatcher("/WEB-INF/views/supplier.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Gagal memuat data supplier", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check permission for managing supplier - Admin only
        User user = getCurrentUser(req);
        if (user == null || !RolePermission.hasPermission(user.getRole(), RolePermission.MANAGE_SUPPLIER)) {
            HttpSession session = req.getSession();
            session.setAttribute("errorMessage", "Anda tidak memiliki izin untuk mengubah data supplier.");
            resp.sendRedirect(req.getContextPath() + "/supplier");
            return;
        }

        String action = req.getParameter("action");
        if (action == null) {
            resp.sendRedirect(req.getContextPath() + "/supplier");
            return;
        }

        try {
            switch (action) {
                case "create":
                    Supplier baru = buildSupplierFromRequest(req);
                    supplierDao.create(baru);
                    break;
                case "update":
                    Supplier update = buildSupplierFromRequest(req);
                    update.setId(Integer.parseInt(req.getParameter("id")));
                    supplierDao.update(update);
                    break;
                case "delete":
                    int id = Integer.parseInt(req.getParameter("id"));
                    supplierDao.delete(id);
                    break;
                default:
                    break;
            }
            resp.sendRedirect(req.getContextPath() + "/supplier");
        } catch (SQLException e) {
            throw new ServletException("Operasi supplier gagal", e);
        }
    }

    private Supplier buildSupplierFromRequest(HttpServletRequest req) {
        Supplier s = new Supplier();
        s.setKodeSupplier(req.getParameter("kodeSupplier"));
        s.setNamaSupplier(req.getParameter("namaSupplier"));
        s.setAlamat(req.getParameter("alamat"));
        s.setTelepon(req.getParameter("telepon"));
        s.setEmail(req.getParameter("email"));
        s.setKontakPerson(req.getParameter("kontakPerson"));
        return s;
    }

    private User getCurrentUser(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session == null)
            return null;
        return (User) session.getAttribute("user");
    }
}
