package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import Model.BusinessModels.SanPham.LoaiThuoc;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class IKhachHang implements IDAO<KhachHang> {

    @Override
    public boolean insert(KhachHang kh) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(kh);
            transaction.commit();
            System.out.println("Khách hàng đã được lưu thành công.");
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback(); // Rollback transaction on error
            }
            e.printStackTrace(); // In case of error, print the stack trace
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close(); // Close EntityManager
            }
        }
    }

    @Override
    public boolean update(KhachHang obj) {
        return false;
    }

    @Override
    public boolean delete(KhachHang obj) {
        return false;
    }

    @Override
    public Set<KhachHang> SelectAll() {
        Set<KhachHang> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng SanPham
            TypedQuery<KhachHang> query = entityManager.createQuery("FROM KhachHang", KhachHang.class);
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
    public KhachHang SelectById(int id) {
        EntityManager entityManager = null;
        KhachHang result = null; // We'll return this single KhachHang object

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy khách hàng theo id
            TypedQuery<KhachHang> query = entityManager.createQuery("FROM KhachHang kh WHERE kh.id = :idKhachHang", KhachHang.class);
            query.setParameter("idKhachHang", id);

            // If a record is found, it will be returned as a single object
            result = query.getSingleResult(); // This returns a single KhachHang object

        } catch (Exception e) {
            e.printStackTrace(); // Proper logging
            // Return null or handle the exception as needed
        } finally {
            if (entityManager != null) {
                entityManager.close(); // Always close the entity manager
            }
        }

        return result; // Return the KhachHang object or null if not found
    }

    @Override
    public Set<KhachHang> SelectByID(int id) {
        return Set.of();
    }

}
