package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.Admin;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class IAdmin implements IDAO<Admin> {
    @Override
    public boolean insert(Admin obj) {
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
    public boolean update(Admin obj) {
        return false;
    }

    @Override
    public boolean delete(Admin obj) {
        return false;
    }

    @Override
    public Set<Admin> SelectAll() {
        return Set.of();
    }

    @Override
    public Admin SelectById(int id) {
        return null;
    }

    @Override
    public Set<Admin> SelectByID(int id) {
        return Set.of();
    }
}
