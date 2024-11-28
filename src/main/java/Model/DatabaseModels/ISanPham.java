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
        return false;
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
        return null;
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
}
