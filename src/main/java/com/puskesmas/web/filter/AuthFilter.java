package com.puskesmas.web.filter;

import com.puskesmas.web.model.User;
import com.puskesmas.web.util.RolePermission;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String path = req.getRequestURI();
        boolean isAsset = path.contains("/assets/") || path.endsWith(".css") || path.endsWith(".js")
                || path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".jpeg");
        boolean isLogin = path.endsWith("/login") || path.endsWith("login.jsp");

        if (isAsset || isLogin) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Check role-based permission for the path
        String userRole = user.getRole();
        if (!RolePermission.canAccessPath(userRole, path)) {
            // User doesn't have permission - redirect to home with error
            session.setAttribute("errorMessage", "Anda tidak memiliki akses ke halaman tersebut.");
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        // Store user role in request for JSP access
        req.setAttribute("userRole", userRole);
        req.setAttribute("canManageObat", RolePermission.hasPermission(userRole, RolePermission.MANAGE_OBAT));
        req.setAttribute("canManageSupplier", RolePermission.hasPermission(userRole, RolePermission.MANAGE_SUPPLIER));
        req.setAttribute("canManageObatMasuk",
                RolePermission.hasPermission(userRole, RolePermission.MANAGE_OBAT_MASUK));
        req.setAttribute("canManageObatKeluar",
                RolePermission.hasPermission(userRole, RolePermission.MANAGE_OBAT_KELUAR));
        req.setAttribute("canViewLaporan", RolePermission.hasPermission(userRole, RolePermission.VIEW_LAPORAN));
        req.setAttribute("canViewObatMasuk", RolePermission.hasPermission(userRole, RolePermission.VIEW_OBAT_MASUK));

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }
}
