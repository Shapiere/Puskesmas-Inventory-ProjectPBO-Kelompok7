-- =====================================================
-- TABEL SUPPLIER (Tabel ke-5)
-- Sistem Manajemen Stok Obat Puskesmas
-- =====================================================

-- Create supplier table
CREATE TABLE public.supplier (
    id_supplier SERIAL PRIMARY KEY,
    kode_supplier VARCHAR(20) UNIQUE NOT NULL,
    nama_supplier VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(20),
    email VARCHAR(100),
    kontak_person VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for faster search
CREATE INDEX idx_supplier_kode ON public.supplier USING btree (kode_supplier);
CREATE INDEX idx_supplier_nama ON public.supplier USING btree (nama_supplier);

-- Insert sample data
INSERT INTO public.supplier (kode_supplier, nama_supplier, alamat, telepon, email, kontak_person) VALUES
('SUP001', 'PT Distributor Farma', 'Jl. Kesehatan No. 123, Jakarta Pusat', '021-12345678', 'info@distributorfarma.co.id', 'Budi Santoso'),
('SUP002', 'CV Medika Jaya', 'Jl. Farmasi No. 45, Bandung', '022-87654321', 'sales@medikajaya.com', 'Siti Rahayu'),
('SUP003', 'PT Kimia Sehat', 'Jl. Obat No. 78, Surabaya', '031-11223344', 'order@kimiasehat.co.id', 'Ahmad Wijaya');

-- Optional: Add foreign key to obat_masuk table
-- ALTER TABLE public.obat_masuk ADD COLUMN id_supplier INTEGER REFERENCES public.supplier(id_supplier);

-- Grant permissions (adjust as needed)
ALTER TABLE public.supplier OWNER TO postgres;
