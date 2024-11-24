package Model.DatabaseModels;

import Model.BusinessModels.SanPham.DanhMucThuoc;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class IDanhMucThuoc implements IDAO<DanhMucThuoc> {
    @Override
    public boolean insert(DanhMucThuoc obj) {
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
    public boolean update(DanhMucThuoc obj) {
        return false;
    }

    @Override
    public boolean delete(DanhMucThuoc obj) {
        return false;
    }

    @Override
    public Set<DanhMucThuoc> SelectAll() {
        return Set.of();
    }
}
