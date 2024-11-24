package Model.DatabaseModels;

import Model.BusinessModels.SanPham.DonViTinh;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class IDonViTinh implements IDAO<DonViTinh> {
    @Override
    public boolean insert(DonViTinh obj) {
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
    public boolean update(DonViTinh obj) {
        return false;
    }

    @Override
    public boolean delete(DonViTinh obj) {
        return false;
    }

    @Override
    public Set<DonViTinh> SelectAll() {
        return Set.of();
    }
}
