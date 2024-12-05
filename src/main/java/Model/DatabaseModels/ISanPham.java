package Model.DatabaseModels;

import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class ISanPham implements IDAO<SanPham> {

    @Override
    public boolean insert(SanPham obj) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(obj);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    @Override
    public boolean update(SanPham obj) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.merge(obj);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    @Override
    public boolean delete(SanPham obj) {
        return false;
    }

    @Override
    public Set<SanPham> SelectAll() {
        Set<SanPham> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng SanPham
            TypedQuery<SanPham> query = entityManager.createQuery("FROM SanPham", SanPham.class);
            result.addAll(query.getResultList());

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

        return result;
    }

    @Override
    public SanPham SelectById(int id) {
        SanPham sanpham=null;
        EntityManager entityManager = null;
        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy danh sách sản phẩm theo loại thuốc
            TypedQuery<SanPham> query = entityManager.createQuery("FROM SanPham sp WHERE sp.id = :id", SanPham.class);
            query.setParameter("id", id);
            //gan gia tri tra ve
            sanpham=query.getSingleResult();

        } catch (Exception e)
        {
            e.printStackTrace();  // Logging tốt hơn là in ra console

        } finally
        {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return sanpham;
    }

    @Override
    public Set<SanPham> SelectByID(int id) {
        Set<SanPham> result = new HashSet<>();
        EntityManager entityManager = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy danh sách sản phẩm theo loại thuốc
            TypedQuery<SanPham> query = entityManager.createQuery("FROM SanPham sp WHERE sp.loaiThuoc.id = :idLoaiThuoc", SanPham.class);
            query.setParameter("idLoaiThuoc", id);

            result.addAll(query.getResultList());
        } catch (Exception e) {
            e.printStackTrace();  // Logging tốt hơn là in ra console
            return Collections.emptySet();  // Trả về Set rỗng thay vì null
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return result;
    }
    //    Tạo ds nơi sản xuất dùng cho bộ lọc
    public Set<SanPham> dsNoiSanXuat() {
        Set<SanPham> result = new HashSet<>();
        EntityManager entityManager = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Truy vấn HQL lấy danh sách các nơi sản xuất (NoiSanXuat) không trùng lặp
            String hql = "SELECT DISTINCT sp.noiSanXuat FROM SanPham sp WHERE sp.noiSanXuat IS NOT NULL";
            TypedQuery<SanPham> query = entityManager.createQuery(hql, SanPham.class);

            result.addAll(query.getResultList());  // Thêm kết quả vào Set
        } catch (Exception e) {
            e.printStackTrace();  // Logging lỗi
        } finally {
            if (entityManager != null) {
                entityManager.close();  // Đảm bảo đóng EntityManager
            }
        }
        return result;
    }

    //    Tạo ds thương hiệu dùng cho bộ lọc
    public Set<SanPham> dsThuongHieu() {
        Set<SanPham> result = new HashSet<>();
        EntityManager entityManager = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Truy vấn HQL lấy danh sách các thương hiệu (ThuongHieu) không trùng lặp
            String hql = "SELECT DISTINCT sp.thuongHieu FROM SanPham sp WHERE sp.thuongHieu IS NOT NULL";
            TypedQuery<SanPham> query = entityManager.createQuery(hql, SanPham.class);

            result.addAll(query.getResultList());  // Thêm kết quả vào Set
        } catch (Exception e) {
            e.printStackTrace();  // Logging lỗi
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return result;
    }

    //    Bộ lọc sản phẩm chuẩn
    public Set<SanPham> filterSanPham(String danhMucID, String loaiThuocID, String priceRange,
                                      String doTuoiID, String noiSanXuat, String thuongHieu) {
        EntityManager entityManager = null;
        Set<SanPham> result = new HashSet<>();

        try {
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Base query
            StringBuilder hql = new StringBuilder("SELECT sp FROM SanPham sp WHERE 1=1");

            // Danh mục thuốc
            if (danhMucID != null && !danhMucID.isEmpty()) {
                hql.append(" AND sp.loaiThuoc.danhMucThuoc.id = :danhMucID");
            }

            // Loại thuốc
            if (loaiThuocID != null && !loaiThuocID.isEmpty()) {
                hql.append(" AND sp.loaiThuoc.id = :loaiThuocID");
            }

            // Giá
            if (priceRange != null && !priceRange.isEmpty()) {
                switch (priceRange) {
                    case "0-100000":
                        hql.append(" AND EXISTS (SELECT 1 FROM sp.cacChiTietSanPham c WHERE c.giaBan BETWEEN 0 AND 100000)");
                        break;
                    case "100000-300000":
                        hql.append(" AND EXISTS (SELECT 1 FROM sp.cacChiTietSanPham c WHERE c.giaBan BETWEEN 100000 AND 300000)");
                        break;
                    case "300000-500000":
                        hql.append(" AND EXISTS (SELECT 1 FROM sp.cacChiTietSanPham c WHERE c.giaBan BETWEEN 300000 AND 500000)");
                        break;
                    case "500000+":
                        hql.append(" AND EXISTS (SELECT 1 FROM sp.cacChiTietSanPham c WHERE c.giaBan >= 500000)");
                        break;
                }
            }
            // Độ tuổi sử dụng
            if (doTuoiID != null && !doTuoiID.isEmpty()) {
                hql.append(" AND :doTuoiID IN (SELECT d.id FROM sp.dsDoTuoiSuDung d)");
            }

            // Độ tuổi sử dụng
            if (noiSanXuat != null && !noiSanXuat.isEmpty()) {
                hql.append(" AND sp.noiSanXuat = :noiSanXuat");
            }

            // Độ tuổi sử dụng
            if (thuongHieu != null && !thuongHieu.isEmpty()) {
                hql.append(" AND sp.thuongHieu = :thuongHieu");
            }

            TypedQuery<SanPham> query = entityManager.createQuery(hql.toString(), SanPham.class);

            // Set parameters
            if (danhMucID != null && !danhMucID.isEmpty()) {
                query.setParameter("danhMucID", Integer.parseInt(danhMucID));
            }
            if (loaiThuocID != null && !loaiThuocID.isEmpty()) {
                query.setParameter("loaiThuocID", Integer.parseInt(loaiThuocID));
            }
            if (doTuoiID != null && !doTuoiID.isEmpty()) {
                query.setParameter("doTuoiID", Integer.parseInt(doTuoiID));
            }
            if(noiSanXuat != null && !noiSanXuat.isEmpty()) {
                query.setParameter("noiSanXuat", noiSanXuat);
            }
            if(thuongHieu != null && !thuongHieu.isEmpty()) {
                query.setParameter("thuongHieu", thuongHieu);
            }

            result.addAll(query.getResultList());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return result;
    }
}
