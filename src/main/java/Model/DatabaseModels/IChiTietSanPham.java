package Model.DatabaseModels;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.SanPham.DonViTinh;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

import java.util.HashSet;
import java.util.Set;

public class IChiTietSanPham implements IDAO<ChiTietSanPham>{

    @Override
    public boolean insert(ChiTietSanPham obj) {
        return false;
    }

    @Override
    public boolean update(ChiTietSanPham obj) {
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
    public boolean delete(ChiTietSanPham obj) {
        return false;
    }

    @Override
    public Set<ChiTietSanPham> SelectAll() {
        Set<ChiTietSanPham> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng ChiTietSanPham
            TypedQuery<ChiTietSanPham> query = entityManager.createQuery("FROM ChiTietSanPham", ChiTietSanPham.class);
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
    public ChiTietSanPham SelectById(int id) {
        return null;
    }

    @Override
    public Set<ChiTietSanPham> SelectByID(int id) {
        return Set.of();
    }

    ;
}
