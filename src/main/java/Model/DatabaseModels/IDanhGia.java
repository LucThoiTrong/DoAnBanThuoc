package Model.DatabaseModels;

import Model.BusinessModels.SanPham.DanhGia;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.HashSet;
import java.util.Set;

public class IDanhGia implements IDAO<DanhGia> {
    @Override
    public boolean insert(DanhGia obj) {
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
    public boolean update(DanhGia obj) {
        return false;
    }

    @Override
    public boolean delete(DanhGia obj) {
        return false;
    }

    @Override
    public Set<DanhGia> SelectAll() {
        Set<DanhGia> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng SanPham
            TypedQuery<DanhGia> query = entityManager.createQuery("FROM DanhGia", DanhGia.class);
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
    public DanhGia SelectById(int id) {
        return null;
    }

    @Override
    public Set<DanhGia> SelectByID(int id) {
        return Set.of();
    }
}