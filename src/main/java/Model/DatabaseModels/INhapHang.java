package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhapHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class INhapHang implements IDAO<NhapHang> {
    @Override
    public boolean insert(NhapHang obj) {
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
    public boolean update(NhapHang obj) {
        return false;
    }

    @Override
    public boolean delete(NhapHang obj) {
        return false;
    }

    @Override
    public Set<NhapHang> SelectAll() {
        return Set.of();
    }
}
