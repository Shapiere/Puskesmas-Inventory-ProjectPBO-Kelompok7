<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="id">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Data Supplier</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/aos.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
        </head>

        <body class="gradient-bg">
            <div class="d-flex min-vh-100">
                <jsp:include page="/WEB-INF/includes/sidebar.jsp">
                    <jsp:param name="activePage" value="supplier" />
                </jsp:include>

                <div class="flex-grow-1 p-4 content-area">
                    <!-- Messages -->
                    <jsp:include page="/WEB-INF/includes/messages.jsp" />

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h3 class="text-white mb-0">Data Supplier</h3>
                            <small class="text-white-50">Kelola data supplier/vendor obat</small>
                        </div>
                        <c:if test="${canManageSupplier}">
                            <a href="${pageContext.request.contextPath}/supplier"
                                class="btn btn-outline-light btn-sm">Reset Form</a>
                        </c:if>
                    </div>

                    <div class="row g-3">
                        <!-- Form Section - Only visible for Admin -->
                        <c:if test="${canManageSupplier}">
                            <div class="col-lg-4" data-aos="fade-up">
                                <div class="glass-card card">
                                    <div class="card-header bg-transparent text-white fw-semibold">
                                        ${editSupplier == null ? "Tambah Supplier" : "Ubah Supplier"}
                                    </div>
                                    <div class="card-body">
                                        <form method="post" action="${pageContext.request.contextPath}/supplier">
                                            <input type="hidden" name="action"
                                                value="${editSupplier == null ? 'create' : 'update'}">
                                            <c:if test="${editSupplier != null}">
                                                <input type="hidden" name="id" value="${editSupplier.id}">
                                            </c:if>
                                            <div class="mb-2">
                                                <label class="form-label">Kode Supplier</label>
                                                <input type="text" name="kodeSupplier" class="form-control"
                                                    value="${editSupplier.kodeSupplier}" required placeholder="SUP001">
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Nama Supplier</label>
                                                <input type="text" name="namaSupplier" class="form-control"
                                                    value="${editSupplier.namaSupplier}" required
                                                    placeholder="PT Contoh Farma">
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Alamat</label>
                                                <textarea name="alamat" class="form-control" rows="2"
                                                    placeholder="Alamat lengkap">${editSupplier.alamat}</textarea>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Telepon</label>
                                                <input type="text" name="telepon" class="form-control"
                                                    value="${editSupplier.telepon}" placeholder="021-12345678">
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Email</label>
                                                <input type="email" name="email" class="form-control"
                                                    value="${editSupplier.email}" placeholder="email@supplier.com">
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Kontak Person</label>
                                                <input type="text" name="kontakPerson" class="form-control"
                                                    value="${editSupplier.kontakPerson}" placeholder="Nama kontak">
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100 mt-2">
                                                ${editSupplier == null ? "Simpan" : "Update"}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <div class="${canManageSupplier ? 'col-lg-8' : 'col-12'}" data-aos="fade-up"
                            data-aos-delay="100">
                            <div class="glass-card card">
                                <div class="card-header bg-transparent text-white fw-semibold">Daftar Supplier</div>
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table class="table table-dark table-hover mb-0 align-middle">
                                            <thead>
                                                <tr>
                                                    <th>Kode</th>
                                                    <th>Nama</th>
                                                    <th>Telepon</th>
                                                    <th>Email</th>
                                                    <th>Kontak</th>
                                                    <c:if test="${canManageSupplier}">
                                                        <th>Aksi</th>
                                                    </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${supplierList}" var="s">
                                                    <tr>
                                                        <td><span class="badge bg-info">${s.kodeSupplier}</span></td>
                                                        <td>${s.namaSupplier}</td>
                                                        <td>${s.telepon}</td>
                                                        <td>${s.email}</td>
                                                        <td>${s.kontakPerson}</td>
                                                        <c:if test="${canManageSupplier}">
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}/supplier?id=${s.id}"
                                                                    class="btn btn-sm btn-outline-info">
                                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                                </a>
                                                                <form method="post"
                                                                    action="${pageContext.request.contextPath}/supplier"
                                                                    class="d-inline"
                                                                    onsubmit="return confirm('Hapus data?');">
                                                                    <input type="hidden" name="action" value="delete">
                                                                    <input type="hidden" name="id" value="${s.id}">
                                                                    <button class="btn btn-sm btn-outline-danger">
                                                                        <i class="fa-regular fa-trash-can"></i>
                                                                    </button>
                                                                </form>
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty supplierList}">
                                                    <tr>
                                                        <td colspan="${canManageSupplier ? '6' : '5'}"
                                                            class="text-center text-white-50 py-4">
                                                            Belum ada data supplier
                                                        </td>
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