package Model.DatabaseModels;

import Model.BusinessModels.TKDoiTuongSuDung.TKNhanVien;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class ITKNhanVien implements IDAO<TKNhanVien> {
    @Override
    public boolean insert(TKNhanVien obj) {
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
    public boolean update(TKNhanVien obj) {
        return false;
    }

    @Override
    public boolean delete(TKNhanVien obj) {
        return false;
    }

    @Override
    public Set<TKNhanVien> SelectAll() {
        return Set.of();
    }
}
