package com.puskesmas.web.util;

public class PasswordUtil {

    public static String hash(String raw) {
        // Tidak lagi menggunakan hash untuk UAS, langsung return teks biasa
        return raw;
    }

    public static boolean matches(String raw, String saved) {
        if (saved == null || raw == null) {
            return false;
        }
        // Bandingkan teks biasa langsung
        return raw.equals(saved);
    }
}
