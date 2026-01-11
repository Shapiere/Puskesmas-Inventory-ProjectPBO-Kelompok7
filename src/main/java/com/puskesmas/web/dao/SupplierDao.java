package com.puskesmas.web.dao;

import com.puskesmas.web.config.DBConnection;
import com.puskesmas.web.model.Supplier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SupplierDao {

    public List<Supplier> findAll() throws SQLException {
        String sql = "SELECT * FROM supplier ORDER BY nama_supplier";
        List<Supplier> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(map(rs));
            }
        }
        return list;
    }

    public Supplier findById(int id) throws SQLException {
        String sql = "SELECT * FROM supplier WHERE id_supplier = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return map(rs);
                }
            }
        }
        return null;
    }

    public void create(Supplier supplier) throws SQLException {
        String sql = "INSERT INTO supplier (kode_supplier, nama_supplier, alamat, telepon, email, kontak_person) VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            int idx = 1;
            ps.setString(idx++, supplier.getKodeSupplier());
            ps.setString(idx++, supplier.getNamaSupplier());
            ps.setString(idx++, supplier.getAlamat());
            ps.setString(idx++, supplier.getTelepon());
            ps.setString(idx++, supplier.getEmail());
            ps.setString(idx++, supplier.getKontakPerson());
            ps.executeUpdate();
        }
    }

    public void update(Supplier supplier) throws SQLException {
        String sql = "UPDATE supplier SET kode_supplier=?, nama_supplier=?, alamat=?, telepon=?, email=?, kontak_person=?, updated_at=CURRENT_TIMESTAMP WHERE id_supplier=?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            int idx = 1;
            ps.setString(idx++, supplier.getKodeSupplier());
            ps.setString(idx++, supplier.getNamaSupplier());
            ps.setString(idx++, supplier.getAlamat());
            ps.setString(idx++, supplier.getTelepon());
            ps.setString(idx++, supplier.getEmail());
            ps.setString(idx++, supplier.getKontakPerson());
            ps.setInt(idx++, supplier.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM supplier WHERE id_supplier=?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    private Supplier map(ResultSet rs) throws SQLException {
        Supplier s = new Supplier();
        s.setId(rs.getInt("id_supplier"));
        s.setKodeSupplier(rs.getString("kode_supplier"));
        s.setNamaSupplier(rs.getString("nama_supplier"));
        s.setAlamat(rs.getString("alamat"));
        s.setTelepon(rs.getString("telepon"));
        s.setEmail(rs.getString("email"));
        s.setKontakPerson(rs.getString("kontak_person"));
        Timestamp cAt = rs.getTimestamp("created_at");
        if (cAt != null) {
            s.setCreatedAt(cAt.toLocalDateTime());
        }
        Timestamp uAt = rs.getTimestamp("updated_at");
        if (uAt != null) {
            s.setUpdatedAt(uAt.toLocalDateTime());
        }
        return s;
    }
}
