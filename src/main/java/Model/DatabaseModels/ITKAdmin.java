package Model.DatabaseModels;

import Model.BusinessModels.TKDoiTuongSuDung.TKAdmin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class ITKAdmin implements IDAO<TKAdmin> {
    @Override
    public boolean insert(TKAdmin obj) {
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
    public boolean update(TKAdmin obj) {
        return false;
    }

    @Override
    public boolean delete(TKAdmin obj) {
        return false;
    }

    @Override
    public Set<TKAdmin> SelectAll() {
        return Set.of();
    }
}
