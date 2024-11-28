package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.NhanVien.NhanVien;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.HashSet;
import java.util.Set;

public class INhanVien implements IDAO<NhanVien> {
    @Override
    public boolean insert(NhanVien obj) {
        return false;
    }

    @Override
    public boolean update(NhanVien obj) {
        return false;
    }

    @Override
    public boolean delete(NhanVien obj) {
        return false;
    }

    @Override
    public Set<NhanVien> SelectAll() {
        Set<NhanVien> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng SanPham
            TypedQuery<NhanVien> query = entityManager.createQuery("FROM NhanVien ", NhanVien.class);
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
    public NhanVien SelectById(int id) {
        return null;
    }

    @Override
    public Set<NhanVien> SelectByID(int id) {
        return Set.of();
    }
}
