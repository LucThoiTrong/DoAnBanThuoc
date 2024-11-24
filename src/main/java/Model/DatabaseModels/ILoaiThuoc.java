package Model.DatabaseModels;

import Model.BusinessModels.SanPham.LoaiThuoc;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

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
        return Set.of();
    }
}
