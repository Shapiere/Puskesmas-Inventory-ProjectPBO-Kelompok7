package com.puskesmas.web.util;

import java.util.*;

/**
 * Utility class for managing role-based permissions.
 * 
 * Permissions:
 * - Admin: Full access to everything
 * - Apoteker: Can manage obat, transaksi, view reports, but NOT manage
 * suppliers/users
 * - Staff: View obat, do obat keluar only. Cannot add/edit/delete obat, cannot
 * view reports/suppliers
 */
public class RolePermission {

    // Define permissions as constants
    public static final String VIEW_DASHBOARD = "VIEW_DASHBOARD";
    public static final String VIEW_OBAT = "VIEW_OBAT";
    public static final String MANAGE_OBAT = "MANAGE_OBAT"; // Add/Edit/Delete
    public static final String VIEW_SUPPLIER = "VIEW_SUPPLIER";
    public static final String MANAGE_SUPPLIER = "MANAGE_SUPPLIER"; // Add/Edit/Delete
    public static final String VIEW_OBAT_MASUK = "VIEW_OBAT_MASUK";
    public static final String MANAGE_OBAT_MASUK = "MANAGE_OBAT_MASUK";
    public static final String VIEW_OBAT_KELUAR = "VIEW_OBAT_KELUAR";
    public static final String MANAGE_OBAT_KELUAR = "MANAGE_OBAT_KELUAR";
    public static final String VIEW_LAPORAN = "VIEW_LAPORAN";

    // Role constants
    public static final String ROLE_ADMIN = "Admin";
    public static final String ROLE_APOTEKER = "Apoteker";
    public static final String ROLE_STAFF = "Staff";

    private static final Map<String, Set<String>> rolePermissions = new HashMap<>();

    static {
        // Admin - Full access
        Set<String> adminPerms = new HashSet<>();
        adminPerms.add(VIEW_DASHBOARD);
        adminPerms.add(VIEW_OBAT);
        adminPerms.add(MANAGE_OBAT);
        adminPerms.add(VIEW_SUPPLIER);
        adminPerms.add(MANAGE_SUPPLIER);
        adminPerms.add(VIEW_OBAT_MASUK);
        adminPerms.add(MANAGE_OBAT_MASUK);
        adminPerms.add(VIEW_OBAT_KELUAR);
        adminPerms.add(MANAGE_OBAT_KELUAR);
        adminPerms.add(VIEW_LAPORAN);
        rolePermissions.put(ROLE_ADMIN, adminPerms);

        // Apoteker - Can manage obat and transactions, view reports
        Set<String> apotekerPerms = new HashSet<>();
        apotekerPerms.add(VIEW_DASHBOARD);
        apotekerPerms.add(VIEW_OBAT);
        apotekerPerms.add(MANAGE_OBAT);
        apotekerPerms.add(VIEW_SUPPLIER); // Can view but not manage
        apotekerPerms.add(VIEW_OBAT_MASUK);
        apotekerPerms.add(MANAGE_OBAT_MASUK);
        apotekerPerms.add(VIEW_OBAT_KELUAR);
        apotekerPerms.add(MANAGE_OBAT_KELUAR);
        apotekerPerms.add(VIEW_LAPORAN);
        rolePermissions.put(ROLE_APOTEKER, apotekerPerms);

        // Staff - Limited access (view obat, obat keluar only)
        Set<String> staffPerms = new HashSet<>();
        staffPerms.add(VIEW_DASHBOARD);
        staffPerms.add(VIEW_OBAT);
        // Staff cannot MANAGE_OBAT
        staffPerms.add(VIEW_SUPPLIER); // Can view but not manage
        // Staff cannot VIEW_OBAT_MASUK
        staffPerms.add(VIEW_OBAT_KELUAR);
        staffPerms.add(MANAGE_OBAT_KELUAR);
        // Staff cannot VIEW_LAPORAN
        rolePermissions.put(ROLE_STAFF, staffPerms);
    }

    /**
     * Check if a role has a specific permission
     */
    public static boolean hasPermission(String role, String permission) {
        if (role == null || permission == null) {
            return false;
        }
        Set<String> perms = rolePermissions.get(role);
        return perms != null && perms.contains(permission);
    }

    /**
     * Get all permissions for a role
     */
    public static Set<String> getPermissions(String role) {
        return rolePermissions.getOrDefault(role, Collections.emptySet());
    }

    /**
     * Check if user can access a specific URL path based on their role
     */
    public static boolean canAccessPath(String role, String path) {
        if (role == null || path == null) {
            return false;
        }

        // Public pages - everyone can access
        if (path.contains("/home") || path.contains("/about") || path.contains("/gallery")) {
            return true;
        }

        // Dashboard
        if (path.contains("/dashboard")) {
            return hasPermission(role, VIEW_DASHBOARD);
        }

        // Obat
        if (path.contains("/obat")) {
            return hasPermission(role, VIEW_OBAT);
        }

        // Supplier
        if (path.contains("/supplier")) {
            return hasPermission(role, VIEW_SUPPLIER);
        }

        // Transaksi Masuk
        if (path.contains("/transaksi-masuk")) {
            return hasPermission(role, VIEW_OBAT_MASUK);
        }

        // Transaksi Keluar
        if (path.contains("/transaksi-keluar")) {
            return hasPermission(role, VIEW_OBAT_KELUAR);
        }

        // Laporan
        if (path.contains("/laporan")) {
            return hasPermission(role, VIEW_LAPORAN);
        }

        // Default: allow access for unmatched paths
        return true;
    }
}
