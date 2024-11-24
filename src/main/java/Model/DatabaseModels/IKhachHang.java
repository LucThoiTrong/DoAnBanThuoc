package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.KhachHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class IKhachHang implements IDAO<KhachHang> {

    @Override
    public boolean insert(KhachHang kh) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            entityManager.persist(kh);
            transaction.commit();
            System.out.println("Khách hàng đã được lưu thành công.");
            return true;
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback(); // Rollback transaction on error
            }
            e.printStackTrace(); // In case of error, print the stack trace
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close(); // Close EntityManager
            }
        }
    }

    @Override
    public boolean update(KhachHang obj) {
        return false;
    }

    @Override
    public boolean delete(KhachHang obj) {
        return false;
    }

    @Override
    public Set<KhachHang> SelectAll() {
        return Set.of();
    }
}
