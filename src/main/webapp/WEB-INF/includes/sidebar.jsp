<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Sidebar with role-based menu visibility -->
    <div class="sidebar shadow-lg" data-aos="fade-right">
        <div class="sidebar-brand mb-3"
            style="font-family: 'Roboto Slab', serif; font-size: 22px; letter-spacing: 0.5px; white-space: nowrap;">
            <i class="fa-solid fa-pills me-2"></i>Manajemen Obat
        </div>

        <!-- Public Pages - Everyone -->
        <a href="${pageContext.request.contextPath}/home"
            class="nav-link ${param.activePage == 'home' ? 'active' : ''}">
            <i class="fa-solid fa-house"></i> Home
        </a>
        <a href="${pageContext.request.contextPath}/about"
            class="nav-link ${param.activePage == 'about' ? 'active' : ''}">
            <i class="fa-solid fa-circle-info"></i> About Us
        </a>
        <a href="${pageContext.request.contextPath}/gallery"
            class="nav-link ${param.activePage == 'gallery' ? 'active' : ''}">
            <i class="fa-solid fa-images"></i> Gallery
        </a>

        <hr class="border-secondary my-3">

        <!-- Dashboard - Everyone -->
        <a href="${pageContext.request.contextPath}/dashboard"
            class="nav-link ${param.activePage == 'dashboard' ? 'active' : ''}">
            <i class="fa-solid fa-gauge"></i> Dashboard
        </a>

        <!-- Data Obat - Everyone can view -->
        <a href="${pageContext.request.contextPath}/obat"
            class="nav-link ${param.activePage == 'obat' ? 'active' : ''}">
            <i class="fa-solid fa-capsules"></i> Data Obat
        </a>

        <!-- Data Supplier - Everyone can view -->
        <a href="${pageContext.request.contextPath}/supplier"
            class="nav-link ${param.activePage == 'supplier' ? 'active' : ''}">
            <i class="fa-solid fa-truck-field"></i> Data Supplier
        </a>

        <!-- Obat Masuk - Only Admin & Apoteker -->
        <c:if test="${canViewObatMasuk}">
            <a href="${pageContext.request.contextPath}/transaksi-masuk"
                class="nav-link ${param.activePage == 'transaksi-masuk' ? 'active' : ''}">
                <i class="fa-solid fa-circle-down"></i> Obat Masuk
            </a>
        </c:if>

        <!-- Obat Keluar - Everyone -->
        <a href="${pageContext.request.contextPath}/transaksi-keluar"
            class="nav-link ${param.activePage == 'transaksi-keluar' ? 'active' : ''}">
            <i class="fa-solid fa-circle-up"></i> Obat Keluar
        </a>

        <!-- Laporan - Only Admin & Apoteker -->
        <c:if test="${canViewLaporan}">
            <a href="${pageContext.request.contextPath}/laporan"
                class="nav-link ${param.activePage == 'laporan' ? 'active' : ''}">
                <i class="fa-solid fa-chart-line"></i> Laporan
            </a>
        </c:if>

        <!-- User Info & Logout -->
        <div class="mt-auto pt-4">
            <div class="text-white-50 small mb-2 px-3">
                <i class="fa-solid fa-user me-1"></i> ${sessionScope.user.namaLengkap}
                <span class="badge bg-secondary ms-1">${sessionScope.user.role}</span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="nav-link text-danger">
                <i class="fa-solid fa-right-from-bracket"></i> Keluar
            </a>
        </div>
    </div>