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
        EntityManager entityManager = null;
        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Sử dụng HQL để truy vấn dữ liệu
            String hql = "FROM DanhMucThuoc"; // HQL truy vấn tất cả từ entity DanhMucThuoc
            return Set.copyOf(entityManager.createQuery(hql, DanhMucThuoc.class).getResultList());
        } catch (Exception e) {
            e.printStackTrace();
            return Set.of(); // Trả về tập hợp rỗng nếu có lỗi
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    @Override
    public DanhMucThuoc SelectById(int id) {
        return null;
    }

    @Override
    public Set<DanhMucThuoc> SelectByID(int id) {
        return Set.of();
    }
}
