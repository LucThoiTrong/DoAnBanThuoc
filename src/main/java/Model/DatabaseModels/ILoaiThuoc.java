package Model.DatabaseModels;

import Model.BusinessModels.SanPham.LoaiThuoc;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.HashSet;
import java.util.Set;

public class ILoaiThuoc implements IDAO<LoaiThuoc>{
    @Override
    public boolean insert(LoaiThuoc obj) {
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
    public boolean update(LoaiThuoc obj) {
        return false;
    }

    @Override
    public boolean delete(LoaiThuoc obj) {
        return false;
    }

    @Override
    public Set<LoaiThuoc> SelectAll() {
        Set<LoaiThuoc> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng SanPham
            TypedQuery<LoaiThuoc> query = entityManager.createQuery("FROM LoaiThuoc ", LoaiThuoc.class);
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
    public LoaiThuoc SelectById(int id) {
        return null;
    }

    @Override
    public Set<LoaiThuoc> SelectByID(int id) {
        return Set.of();
    }
}
