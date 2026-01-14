<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Gallery - Stok Obat Puskesmas</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/aos.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
            <style>
                .gallery-item {
                    position: relative;
                    overflow: hidden;
                    border-radius: 12px;
                    background: rgba(255, 255, 255, 0.05);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    cursor: pointer;
                }

                .gallery-item:hover {
                    transform: scale(1.02);
                    box-shadow: 0 10px 40px rgba(106, 90, 249, 0.3);
                }

                .gallery-img-wrapper {
                    height: 200px;
                    overflow: hidden;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background: rgba(0, 0, 0, 0.2);
                    border-radius: 12px 12px 0 0;
                }

                .gallery-img-wrapper img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    transition: transform 0.3s ease;
                }

                .gallery-item:hover .gallery-img-wrapper img {
                    transform: scale(1.05);
                }

                .gallery-caption {
                    padding: 15px;
                    background: rgba(0, 0, 0, 0.4);
                    border-radius: 0 0 12px 12px;
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                }

                .gallery-caption h6 {
                    margin-bottom: 8px;
                }

                .gallery-caption small {
                    flex: 1;
                }

                .gallery-col {
                    display: flex;
                }

                /* Lightbox Modal */
                #lightboxModal .modal-content {
                    background: rgba(20, 20, 40, 0.95);
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    border-radius: 16px;
                }

                #lightboxModal .modal-body {
                    padding: 0;
                }

                #lightboxModal .modal-body img {
                    width: 100%;
                    height: auto;
                    border-radius: 16px;
                }

                #lightboxModal .btn-close {
                    position: absolute;
                    top: -40px;
                    right: 0;
                    filter: invert(1);
                    opacity: 0.8;
                }

                #lightboxModal .btn-close:hover {
                    opacity: 1;
                }

                #lightboxCaption {
                    padding: 15px 20px;
                    text-align: center;
                }
            </style>
        </head>

        <body class="gradient-bg">
            <div class="d-flex min-vh-100">
                <jsp:include page="/WEB-INF/includes/sidebar.jsp">
                    <jsp:param name="activePage" value="gallery" />
                </jsp:include>

                <div class="flex-grow-1 p-4 content-area">
                    <!-- Messages -->
                    <jsp:include page="/WEB-INF/includes/messages.jsp" />

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h3 class="text-white mb-0">Gallery</h3>
                            <p class="text-white-50 mb-0">Screenshot Database & Laporan Aplikasi</p>
                        </div>
                    </div>

                    <!-- Gallery Intro -->
                    <div class="glass-card p-4 mb-4" data-aos="fade-up">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h5 class="text-white fw-bold mb-2"><i
                                        class="fa-solid fa-images me-2 text-info"></i>Dokumentasi Visual</h5>
                                <p class="text-white-50 mb-0">
                                    Halaman ini berisi screenshot dari struktur database PostgreSQL, views, functions,
                                    triggers,
                                    dan tampilan laporan yang dihasilkan oleh sistem. <strong class="text-info">Klik
                                        gambar untuk memperbesar.</strong>
                                </p>
                            </div>
                            <div class="col-md-4 text-end">
                                <span class="badge bg-primary fs-6 px-3 py-2">
                                    <i class="fa-solid fa-database me-2"></i>PostgreSQL
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Tables Section -->
                    <h4 class="text-white mb-3" data-aos="fade-up"><i
                            class="fa-solid fa-table me-2 text-warning"></i>Tabel Database</h4>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="50">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/tableobat.jpeg', 'Tabel obat', 'Menyimpan data master obat seperti kode, nama, kategori, satuan, harga, stok, dan tanggal kadaluarsa.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/tableobat.jpeg"
                                        alt="Tabel Obat">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i class="fa-solid fa-pills me-2 text-info"></i>Tabel
                                        obat</h6>
                                    <small class="text-white-50">Menyimpan data master obat seperti kode, nama,
                                        kategori, satuan, harga, stok, dan tanggal kadaluarsa.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="100">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/tableobatmasuk.jpeg', 'Tabel obat_masuk', 'Mencatat transaksi penerimaan obat dari supplier dengan nomor batch dan tanggal masuk.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/tableobatmasuk.jpeg"
                                        alt="Tabel Obat Masuk">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-circle-down me-2 text-success"></i>Tabel obat_masuk</h6>
                                    <small class="text-white-50">Mencatat transaksi penerimaan obat dari supplier dengan
                                        nomor batch dan tanggal masuk.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="150">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/tableobatkeluar.jpeg', 'Tabel obat_keluar', 'Mencatat transaksi pengeluaran obat ke unit pelayanan dengan tujuan dan keterangan.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/tableobatkeluar.jpeg"
                                        alt="Tabel Obat Keluar">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-circle-up me-2 text-danger"></i>Tabel obat_keluar</h6>
                                    <small class="text-white-50">Mencatat transaksi pengeluaran obat ke unit pelayanan
                                        dengan tujuan dan keterangan.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="200">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/tableusers.jpeg', 'Tabel users', 'Menyimpan data pengguna sistem dengan username, password terenkripsi, dan role akses.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/tableusers.jpeg"
                                        alt="Tabel Users">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i class="fa-solid fa-users me-2 text-warning"></i>Tabel
                                        users</h6>
                                    <small class="text-white-50">Menyimpan data pengguna sistem dengan username,
                                        password terenkripsi, dan role akses.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="250">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/tablesupplier.jpeg', 'Tabel supplier', 'Menyimpan data vendor/supplier obat lengkap dengan alamat, telepon, dan kontak person.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/tablesupplier.jpeg"
                                        alt="Tabel Supplier">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-truck-field me-2 text-primary"></i>Tabel supplier</h6>
                                    <small class="text-white-50">Menyimpan data vendor/supplier obat lengkap dengan
                                        alamat, telepon, dan kontak person.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Views Section -->
                    <h4 class="text-white mb-3" data-aos="fade-up"><i class="fa-solid fa-eye me-2 text-info"></i>Views
                        Database</h4>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="50">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/viewobatmenipis.jpeg', 'view_stok_menipis', 'Menampilkan obat dengan stok di bawah batas minimum untuk peringatan restock.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/viewobatmenipis.jpeg"
                                        alt="View Stok Menipis">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-triangle-exclamation me-2 text-warning"></i>view_stok_menipis
                                    </h6>
                                    <small class="text-white-50">Menampilkan obat dengan stok di bawah batas minimum
                                        untuk peringatan restock.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="100">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/viewlaporanstok.jpeg', 'view_laporan_stok', 'Menampilkan status stok semua obat (Aman/Perhatian/Menipis) dengan nilai total.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/viewlaporanstok.jpeg"
                                        alt="View Laporan Stok">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-chart-pie me-2 text-success"></i>view_laporan_stok</h6>
                                    <small class="text-white-50">Menampilkan status stok semua obat
                                        (Aman/Perhatian/Menipis) dengan nilai total.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="150">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/viewrekapbulanan.jpeg', 'view_rekap_bulanan', 'Merekap transaksi obat masuk dan keluar per bulan untuk analisis tren.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/viewrekapbulanan.jpeg"
                                        alt="View Rekap Bulanan">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-calendar-days me-2 text-primary"></i>view_rekap_bulanan
                                    </h6>
                                    <small class="text-white-50">Merekap transaksi obat masuk dan keluar per bulan untuk
                                        analisis tren.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="200">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/viewobatmendekatikadeluarsa.jpeg', 'view_obat_kadaluarsa', 'Menampilkan obat yang akan kadaluarsa dalam 90 hari ke depan.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/viewobatmendekatikadeluarsa.jpeg"
                                        alt="View Obat Kadaluarsa">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-clock me-2 text-danger"></i>view_obat_kadaluarsa</h6>
                                    <small class="text-white-50">Menampilkan obat yang akan kadaluarsa dalam 90 hari ke
                                        depan.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Functions & Triggers Section -->
                    <h4 class="text-white mb-3" data-aos="fade-up"><i
                            class="fa-solid fa-bolt me-2 text-success"></i>Functions & Triggers</h4>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="50">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/triggerobatmasuk.jpeg', 'trg_obat_masuk', 'Trigger yang otomatis menambah stok obat ketika ada transaksi masuk baru.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/triggerobatmasuk.jpeg"
                                        alt="Trigger Obat Masuk">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-code me-2 text-info"></i>trg_obat_masuk</h6>
                                    <small class="text-white-50">Trigger yang otomatis menambah stok obat ketika ada
                                        transaksi masuk baru.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="100">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/triggerobatkeluar.jpeg', 'trg_obat_keluar', 'Trigger yang otomatis mengurangi stok obat ketika ada transaksi keluar.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/triggerobatkeluar.jpeg"
                                        alt="Trigger Obat Keluar">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-code me-2 text-warning"></i>trg_obat_keluar</h6>
                                    <small class="text-white-50">Trigger yang otomatis mengurangi stok obat ketika ada
                                        transaksi keluar.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 gallery-col" data-aos="fade-up" data-aos-delay="150">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/triggervalidasi.jpeg', 'trg_validate_stok', 'Trigger validasi yang mencegah stok menjadi negatif saat transaksi.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/triggervalidasi.jpeg"
                                        alt="Trigger Validasi">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-shield me-2 text-danger"></i>trg_validate_stok</h6>
                                    <small class="text-white-50">Trigger validasi yang mencegah stok menjadi negatif
                                        saat transaksi.</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- App Screenshots Section -->
                    <h4 class="text-white mb-3" data-aos="fade-up"><i
                            class="fa-solid fa-desktop me-2 text-danger"></i>Screenshot Aplikasi</h4>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6 gallery-col" data-aos="fade-up" data-aos-delay="50">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/dashboard.jpeg', 'Halaman Dashboard', 'Tampilan utama dengan statistik stok, grafik transaksi bulanan, dan peringatan obat menipis.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/dashboard.jpeg"
                                        alt="Halaman Dashboard">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i class="fa-solid fa-gauge me-2 text-info"></i>Halaman
                                        Dashboard</h6>
                                    <small class="text-white-50">Tampilan utama dengan statistik stok, grafik transaksi
                                        bulanan, dan peringatan obat menipis.</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 gallery-col" data-aos="fade-up" data-aos-delay="100">
                            <div class="gallery-item"
                                onclick="openLightbox('${pageContext.request.contextPath}/assets/images/laporan.jpeg', 'Halaman Laporan', 'Fitur laporan dengan grafik visual, tabel rekap bulanan, dan daftar obat stok menipis.')">
                                <div class="gallery-img-wrapper">
                                    <img src="${pageContext.request.contextPath}/assets/images/laporan.jpeg"
                                        alt="Halaman Laporan">
                                </div>
                                <div class="gallery-caption">
                                    <h6 class="text-white mb-1"><i
                                            class="fa-solid fa-chart-line me-2 text-success"></i>Halaman Laporan</h6>
                                    <small class="text-white-50">Fitur laporan dengan grafik visual, tabel rekap
                                        bulanan, dan daftar obat stok menipis.</small>
                                </div>
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

            <!-- Lightbox Modal -->
            <div class="modal fade" id="lightboxModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <div class="modal-body">
                            <img id="lightboxImage" src="" alt="Preview">
                            <div id="lightboxCaption">
                                <h5 id="lightboxTitle" class="text-white mb-2"></h5>
                                <p id="lightboxDesc" class="text-white-50 mb-0"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/aos.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
            <script>
                function openLightbox(imgSrc, title, desc) {
                    document.getElementById('lightboxImage').src = imgSrc;
                    document.getElementById('lightboxTitle').textContent = title;
                    document.getElementById('lightboxDesc').textContent = desc;
                    var modal = new bootstrap.Modal(document.getElementById('lightboxModal'));
                    modal.show();
                }
            </script>
        </body>

        </html>