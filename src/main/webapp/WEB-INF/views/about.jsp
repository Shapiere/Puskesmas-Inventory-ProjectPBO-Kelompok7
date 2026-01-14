<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>About Us - Stok Obat Puskesmas</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/aos.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
            <style>
                .team-card {
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                }

                .team-card:hover {
                    transform: translateY(-8px);
                    box-shadow: 0 15px 40px rgba(106, 90, 249, 0.3);
                }

                .team-avatar {
                    width: 100px;
                    height: 100px;
                    border-radius: 50%;
                    background: linear-gradient(135deg, #6a5af9, #21d4fd);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 40px;
                    color: white;
                    margin: 0 auto 15px;
                    border: 4px solid rgba(255, 255, 255, 0.2);
                }
            </style>
        </head>

        <body class="gradient-bg">
            <div class="d-flex min-vh-100">
                <jsp:include page="/WEB-INF/includes/sidebar.jsp">
                    <jsp:param name="activePage" value="about" />
                </jsp:include>

                <div class="flex-grow-1 p-4 content-area">
                    <!-- Messages -->
                    <jsp:include page="/WEB-INF/includes/messages.jsp" />

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h3 class="text-white mb-0">About Us</h3>
                            <p class="text-white-50 mb-0">Tentang Website & Tim Pengembang</p>
                        </div>
                    </div>

                    <!-- About Website Section -->
                    <div class="glass-card p-4 mb-4" data-aos="fade-up">
                        <div class="row align-items-center">
                            <div class="col-md-3 text-center mb-4 mb-md-0">
                                <div class="icon-circle mx-auto" style="width: 130px; height: 130px; font-size: 56px;">
                                    <i class="fa-solid fa-laptop-medical"></i>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <h4 class="text-white fw-bold mb-3">Tentang Website Ini</h4>
                                <p class="text-white-50 mb-3">
                                    <strong class="text-info">Sistem Manajemen Stok Obat Puskesmas</strong> adalah
                                    sebuah aplikasi web
                                    yang dikembangkan sebagai tugas kuliah mata kuliah <strong
                                        class="text-warning">Pemrograman Berorientasi Objek</strong>.
                                    Website ini dirancang untuk membantu puskesmas dalam mengelola persediaan obat
                                    secara digital,
                                    menggantikan sistem manual yang rentan terhadap kesalahan dan tidak efisien.
                                </p>
                                <p class="text-white-50 mb-0">
                                    Aplikasi ini menyediakan fitur lengkap mulai dari pencatatan data obat, transaksi
                                    masuk dan keluar,
                                    hingga pelaporan bulanan dengan visualisasi grafik. Dengan antarmuka yang modern dan
                                    responsif,
                                    pengguna dapat dengan mudah mengakses dan mengelola data dari berbagai perangkat.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Why Built Section -->
                    <div class="glass-card p-4 mb-4" data-aos="fade-up">
                        <h4 class="text-white fw-bold mb-3"><i
                                class="fa-solid fa-question-circle me-2 text-info"></i>Latar Belakang Pembuatan</h4>
                        <div class="row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <h6 class="text-warning fw-bold mb-2"><i
                                        class="fa-solid fa-exclamation-triangle me-2"></i>Permasalahan</h6>
                                <ul class="text-white-50 mb-0">
                                    <li>Pencatatan stok obat masih manual menggunakan buku atau excel</li>
                                    <li>Sulit memantau obat yang akan kadaluarsa</li>
                                    <li>Tidak ada peringatan ketika stok menipis</li>
                                    <li>Pembuatan laporan memakan waktu lama</li>
                                    <li>Data tidak terintegrasi dan sulit diakses</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-success fw-bold mb-2"><i
                                        class="fa-solid fa-check-circle me-2"></i>Solusi</h6>
                                <ul class="text-white-50 mb-0">
                                    <li>Sistem berbasis web yang dapat diakses kapan saja</li>
                                    <li>Notifikasi otomatis untuk stok yang menipis</li>
                                    <li>Fitur CRUD untuk manajemen data yang mudah</li>
                                    <li>Laporan otomatis dengan grafik visual</li>
                                    <li>Session management untuk keamanan akses</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Features Overview -->
                    <div class="glass-card p-4 mb-4" data-aos="fade-up">
                        <h4 class="text-white fw-bold mb-3"><i
                                class="fa-solid fa-puzzle-piece me-2 text-warning"></i>Fitur Website</h4>
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="d-flex align-items-start">
                                    <div class="me-3">
                                        <div class="icon-circle" style="width: 45px; height: 45px; font-size: 18px;">
                                            <i class="fa-solid fa-user-lock"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="text-white mb-1">Autentikasi</h6>
                                        <small class="text-white-50">Login & session management untuk keamanan</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start">
                                    <div class="me-3">
                                        <div class="icon-circle" style="width: 45px; height: 45px; font-size: 18px;">
                                            <i class="fa-solid fa-pills"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="text-white mb-1">CRUD Obat</h6>
                                        <small class="text-white-50">Create, Read, Update, Delete data obat</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start">
                                    <div class="me-3">
                                        <div class="icon-circle" style="width: 45px; height: 45px; font-size: 18px;">
                                            <i class="fa-solid fa-arrows-rotate"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="text-white mb-1">Transaksi</h6>
                                        <small class="text-white-50">Pencatatan obat masuk & keluar</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start">
                                    <div class="me-3">
                                        <div class="icon-circle" style="width: 45px; height: 45px; font-size: 18px;">
                                            <i class="fa-solid fa-bell"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="text-white mb-1">Peringatan</h6>
                                        <small class="text-white-50">Notifikasi stok menipis otomatis</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start">
                                    <div class="me-3">
                                        <div class="icon-circle" style="width: 45px; height: 45px; font-size: 18px;">
                                            <i class="fa-solid fa-chart-bar"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="text-white mb-1">Laporan</h6>
                                        <small class="text-white-50">Grafik & rekap transaksi bulanan</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start">
                                    <div class="me-3">
                                        <div class="icon-circle" style="width: 45px; height: 45px; font-size: 18px;">
                                            <i class="fa-solid fa-mobile-screen"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="text-white mb-1">Responsive</h6>
                                        <small class="text-white-50">Tampilan optimal di semua perangkat</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Team Section -->
                    <h4 class="text-white mb-3" data-aos="fade-up"><i class="fa-solid fa-users me-2 text-info"></i>Tim
                        Pengembang</h4>
                    <div class="row g-3 mb-4">
                        <!-- Member 1 -->
                        <div class="col-lg col-md-4 col-6" data-aos="fade-up" data-aos-delay="50">
                            <div class="glass-card p-3 text-center team-card h-100">
                                <div class="team-avatar" style="width: 80px; height: 80px; font-size: 32px;">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <h6 class="text-white fw-bold mb-1" style="font-size: 0.9rem;">Shapiere Januar
                                    Rafiansyah</h6>
                                <p class="text-info mb-2" style="font-size: 0.75rem;">0110224191</p>
                                <span class="badge bg-primary" style="font-size: 0.7rem;">Team Leader</span>
                            </div>
                        </div>
                        <!-- Member 2 -->
                        <div class="col-lg col-md-4 col-6" data-aos="fade-up" data-aos-delay="100">
                            <div class="glass-card p-3 text-center team-card h-100">
                                <div class="team-avatar"
                                    style="width: 80px; height: 80px; font-size: 32px; background: linear-gradient(135deg, #43cea2, #185a9d);">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <h6 class="text-white fw-bold mb-1" style="font-size: 0.9rem;">Maulidya Syifa Aszahra
                                </h6>
                                <p class="text-info mb-2" style="font-size: 0.75rem;">0110224066</p>
                                <span class="badge bg-success" style="font-size: 0.7rem;">Member</span>
                            </div>
                        </div>
                        <!-- Member 3 -->
                        <div class="col-lg col-md-4 col-6" data-aos="fade-up" data-aos-delay="150">
                            <div class="glass-card p-3 text-center team-card h-100">
                                <div class="team-avatar"
                                    style="width: 80px; height: 80px; font-size: 32px; background: linear-gradient(135deg, #ff758c, #ff7eb3);">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <h6 class="text-white fw-bold mb-1" style="font-size: 0.9rem;">Oryza Ayunda Putri</h6>
                                <p class="text-info mb-2" style="font-size: 0.75rem;">0110224030</p>
                                <span class="badge bg-danger" style="font-size: 0.7rem;">Member</span>
                            </div>
                        </div>
                        <!-- Member 4 -->
                        <div class="col-lg col-md-4 col-6" data-aos="fade-up" data-aos-delay="200">
                            <div class="glass-card p-3 text-center team-card h-100">
                                <div class="team-avatar"
                                    style="width: 80px; height: 80px; font-size: 32px; background: linear-gradient(135deg, #f7971e, #ffd200);">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <h6 class="text-white fw-bold mb-1" style="font-size: 0.9rem;">Muhammad Khoirul Anam
                                </h6>
                                <p class="text-info mb-2" style="font-size: 0.75rem;">0110224027</p>
                                <span class="badge bg-warning text-dark" style="font-size: 0.7rem;">Member</span>
                            </div>
                        </div>
                        <!-- Member 5 -->
                        <div class="col-lg col-md-4 col-6" data-aos="fade-up" data-aos-delay="250">
                            <div class="glass-card p-3 text-center team-card h-100">
                                <div class="team-avatar"
                                    style="width: 80px; height: 80px; font-size: 32px; background: linear-gradient(135deg, #667eea, #764ba2);">
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <h6 class="text-white fw-bold mb-1" style="font-size: 0.9rem;">Fitri Aura Ramadhani</h6>
                                <p class="text-info mb-2" style="font-size: 0.75rem;">0110224096</p>
                                <span class="badge bg-info" style="font-size: 0.7rem;">Member</span>
                            </div>
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