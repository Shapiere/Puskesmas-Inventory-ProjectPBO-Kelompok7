<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Home - Stok Obat Puskesmas</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/aos.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
        </head>

        <body class="gradient-bg">
            <div class="d-flex min-vh-100">
                <jsp:include page="/WEB-INF/includes/sidebar.jsp">
                    <jsp:param name="activePage" value="home" />
                </jsp:include>

                <div class="flex-grow-1 p-4 content-area">
                    <!-- Messages -->
                    <jsp:include page="/WEB-INF/includes/messages.jsp" />
                    <!-- Hero Section -->
                    <div class="glass-card p-5 mb-4 text-center" data-aos="fade-up">
                        <div class="icon-circle mx-auto mb-4" style="width: 120px; height: 120px; font-size: 56px;">
                            <i class="fa-solid fa-hospital"></i>
                        </div>
                        <h1 class="text-white fw-bold mb-2">Selamat Datang!</h1>
                        <h3 class="text-info mb-3">Sistem Manajemen Stok Obat Puskesmas</h3>
                        <p class="text-white-50 mb-4" style="max-width: 700px; margin: 0 auto; font-size: 1.1rem;">
                            Website ini merupakan solusi digital untuk membantu puskesmas dalam mengelola
                            persediaan obat secara efisien, akurat, dan terorganisir. Dengan sistem ini,
                            proses pencatatan stok, transaksi masuk-keluar, serta pelaporan menjadi lebih mudah dan
                            cepat.
                        </p>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary btn-lg px-4">
                                <i class="fa-solid fa-gauge me-2"></i>Lihat Dashboard
                            </a>
                            <a href="${pageContext.request.contextPath}/about"
                                class="btn btn-outline-light btn-lg px-4">
                                <i class="fa-solid fa-users me-2"></i>Tentang Kami
                            </a>
                        </div>
                    </div>

                    <!-- Why This System Section -->
                    <div class="glass-card p-4 mb-4" data-aos="fade-up">
                        <h4 class="text-white fw-bold mb-3"><i
                                class="fa-solid fa-lightbulb me-2 text-warning"></i>Mengapa Sistem Ini Dibuat?</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <p class="text-white-50 mb-3">
                                    Pengelolaan stok obat di puskesmas seringkali masih dilakukan secara manual
                                    menggunakan
                                    buku catatan atau spreadsheet sederhana. Hal ini menimbulkan berbagai masalah
                                    seperti:
                                </p>
                                <ul class="text-white-50">
                                    <li>Kesulitan memantau stok obat secara real-time</li>
                                    <li>Risiko kekosongan stok yang tidak terdeteksi</li>
                                    <li>Pencatatan transaksi yang tidak terorganisir</li>
                                    <li>Sulitnya membuat laporan yang akurat</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <p class="text-white-50 mb-3">
                                    Sistem ini hadir sebagai solusi untuk mengatasi permasalahan tersebut dengan
                                    menyediakan:
                                </p>
                                <ul class="text-white-50">
                                    <li>Dashboard monitoring stok secara real-time</li>
                                    <li>Peringatan otomatis ketika stok menipis</li>
                                    <li>Pencatatan transaksi masuk & keluar yang terstruktur</li>
                                    <li>Laporan bulanan yang informatif dengan grafik</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Features Section -->
                    <h4 class="text-white mb-3" data-aos="fade-up"><i
                            class="fa-solid fa-star me-2 text-warning"></i>Fitur Utama</h4>
                    <div class="row g-3 mb-4">
                        <div class="col-md-3" data-aos="fade-up" data-aos-delay="50">
                            <div class="info-card gradient-card-1 h-100 text-center">
                                <i class="fa-solid fa-database fa-2x mb-3"></i>
                                <h6 class="fw-bold">Data Obat</h6>
                                <small>Kelola data obat lengkap dengan kategori, stok, dan kadaluarsa</small>
                            </div>
                        </div>
                        <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
                            <div class="info-card gradient-card-2 h-100 text-center">
                                <i class="fa-solid fa-circle-down fa-2x mb-3"></i>
                                <h6 class="fw-bold">Obat Masuk</h6>
                                <small>Catat setiap obat yang masuk dari supplier dengan detail lengkap</small>
                            </div>
                        </div>
                        <div class="col-md-3" data-aos="fade-up" data-aos-delay="150">
                            <div class="info-card gradient-card-3 h-100 text-center">
                                <i class="fa-solid fa-circle-up fa-2x mb-3"></i>
                                <h6 class="fw-bold">Obat Keluar</h6>
                                <small>Rekam obat yang diberikan ke pasien atau ruangan</small>
                            </div>
                        </div>
                        <div class="col-md-3" data-aos="fade-up" data-aos-delay="200">
                            <div class="info-card gradient-card-4 h-100 text-center">
                                <i class="fa-solid fa-chart-line fa-2x mb-3"></i>
                                <h6 class="fw-bold">Laporan</h6>
                                <small>Lihat laporan dan grafik transaksi bulanan</small>
                            </div>
                        </div>
                    </div>

                    <!-- Tech Stack -->
                    <div class="glass-card p-4" data-aos="fade-up">
                        <h5 class="text-white fw-bold mb-3"><i class="fa-solid fa-code me-2 text-info"></i>Teknologi
                            yang Digunakan</h5>
                        <div class="d-flex flex-wrap gap-3">
                            <span class="badge bg-primary px-3 py-2 fs-6"><i class="fa-brands fa-java me-2"></i>Java
                                Servlet</span>
                            <span class="badge bg-success px-3 py-2 fs-6"><i
                                    class="fa-solid fa-file-code me-2"></i>JSP</span>
                            <span class="badge bg-info px-3 py-2 fs-6"><i
                                    class="fa-brands fa-bootstrap me-2"></i>Bootstrap 5</span>
                            <span class="badge bg-warning text-dark px-3 py-2 fs-6"><i
                                    class="fa-solid fa-database me-2"></i>PostgreSQL</span>
                            <span class="badge bg-danger px-3 py-2 fs-6"><i class="fa-solid fa-server me-2"></i>Apache
                                Tomcat</span>
                        </div>
                    </div>

                    <!-- Footer -->
                    <div class="text-center text-white-50 mt-5 py-3" data-aos="fade-up">
                        <small>&copy; 2026 Sistem Stok Obat Puskesmas - Tugas Kuliah Pemrograman Berorientasi
                            Objek</small>
                    </div>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/aos.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
        </body>

        </html>