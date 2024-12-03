package Model.DatabaseModels;

import Model.BusinessModels.SanPham.DanhMucThuoc;
import Model.BusinessModels.SanPham.DoTuoiSuDung;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Set;

public class IDoTuoiSuDung implements IDAO<DoTuoiSuDung> {
    @Override
    public boolean insert(DoTuoiSuDung obj) {
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
    public boolean update(DoTuoiSuDung obj) {
        return false;
    }

    @Override
    public boolean delete(DoTuoiSuDung obj) {
        return false;
    }

    @Override
    public Set<DoTuoiSuDung> SelectAll() {
        EntityManager entityManager = null;
        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Sử dụng HQL để truy vấn dữ liệu
            String hql = "FROM DoTuoiSuDung "; // HQL truy vấn tất cả từ entity DanhMucThuoc
            return Set.copyOf(entityManager.createQuery(hql, DoTuoiSuDung.class).getResultList());
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
    public DoTuoiSuDung SelectById(int id) {
        return null;
    }

    @Override
    public Set<DoTuoiSuDung> SelectByID(int id) {
        return Set.of();
    }
}
