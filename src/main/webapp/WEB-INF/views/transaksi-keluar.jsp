<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Obat Keluar</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/aos.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
        </head>

        <body class="gradient-bg">
            <div class="d-flex min-vh-100">
                <jsp:include page="/WEB-INF/includes/sidebar.jsp">
                    <jsp:param name="activePage" value="transaksi-keluar" />
                </jsp:include>

                <div class="flex-grow-1 p-4 content-area">
                    <!-- Messages -->
                    <jsp:include page="/WEB-INF/includes/messages.jsp" />

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h3 class="text-white mb-0">Transaksi Obat Keluar</h3>
                            <small class="text-white-50">Catat obat yang diberikan ke pasien/poli</small>
                        </div>
                    </div>

                    <div class="row g-3">
                        <!-- Form Section - All roles can add obat keluar -->
                        <c:if test="${canManageObatKeluar}">
                            <div class="col-lg-4" data-aos="fade-up">
                                <div class="glass-card card">
                                    <div class="card-header bg-transparent text-white fw-semibold">Tambah Obat Keluar
                                    </div>
                                    <div class="card-body">
                                        <form method="post"
                                            action="${pageContext.request.contextPath}/transaksi-keluar">
                                            <div class="mb-2">
                                                <label class="form-label">Obat</label>
                                                <select name="idObat" class="form-select" required>
                                                    <c:forEach items="${obatList}" var="o">
                                                        <option value="${o.id}">${o.namaObat} (${o.kodeObat}) - Stok:
                                                            ${o.stokSaatIni}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Tanggal Keluar</label>
                                                <input type="date" name="tanggalKeluar" class="form-control" required>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Jumlah</label>
                                                <input type="number" name="jumlah" class="form-control" required>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Tujuan / Poli</label>
                                                <input type="text" name="tujuan" class="form-control">
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Keterangan</label>
                                                <textarea name="keterangan" class="form-control" rows="2"></textarea>
                                            </div>
                                            <button class="btn btn-primary w-100 mt-2" type="submit">Simpan</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="${canManageObatKeluar ? 'col-lg-8' : 'col-12'}" data-aos="fade-up"
                            data-aos-delay="100">
                            <div class="glass-card card">
                                <div class="card-header bg-transparent text-white fw-semibold">Riwayat Obat Keluar</div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-dark table-hover mb-0 align-middle">
                                            <thead>
                                                <tr>
                                                    <th>Tanggal</th>
                                                    <th>Obat</th>
                                                    <th>Jumlah</th>
                                                    <th>Tujuan</th>
                                                    <th>Keterangan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${keluarList}" var="k">
                                                    <tr>
                                                        <td>${k.tanggalKeluar}</td>
                                                        <td>${k.namaObat}</td>
                                                        <td><span class="badge bg-warning text-dark">${k.jumlah}
                                                                ${k.satuan}</span></td>
                                                        <td>${k.tujuan}</td>
                                                        <td>${k.keterangan}</td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty keluarList}">
                                                    <tr>
                                                        <td colspan="5" class="text-center text-white-50 py-3">Belum ada
                                                            transaksi</td>
                                                    </tr>
                                                </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/aos.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
        </body>

        </html>