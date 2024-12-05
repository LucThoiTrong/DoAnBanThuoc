package Model.DatabaseModels;

import Model.BusinessModels.SanPham.ChiTietSanPham;
import Model.BusinessModels.SanPham.DonViTinh;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class IChiTietSanPham implements IDAO<ChiTietSanPham>{

    @Override
    public boolean insert(ChiTietSanPham obj)
    {
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

        ChiTietSanPham chiTietSanPham=null;
        EntityManager entityManager = null;
        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy danh sách sản phẩm theo loại thuốc
            TypedQuery<ChiTietSanPham> query = entityManager.createQuery("FROM ChiTietSanPham ctsp WHERE ctsp.sanPham.id = :id", ChiTietSanPham.class);
            query.setParameter("id", id);
            //gan gia tri tra ve
//            chiTietSanPham=query.getSingleResult();
            List<ChiTietSanPham> results = query.getResultList(); // Thay vì getSingleResult
            if (!results.isEmpty()) {
                chiTietSanPham = results.get(0); // Lấy kết quả đầu tiên nếu có
            }

        } catch (Exception e)
        {
            e.printStackTrace();  // Logging tốt hơn là in ra console

        } finally
        {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return chiTietSanPham;
    }

    @Override
    public Set<ChiTietSanPham> SelectByID(int id) {
        Set<ChiTietSanPham> result = new HashSet<>();
        EntityManager entityManager = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy danh sách sản phẩm theo loại thuốc
            TypedQuery<ChiTietSanPham> query = entityManager.createQuery("FROM ChiTietSanPham sp WHERE sp.sanPham.id = :id", ChiTietSanPham.class);
            query.setParameter("id", id);

            result.addAll(query.getResultList());
        } catch (Exception e) {
            e.printStackTrace();  // Logging tốt hơn là in ra console
            return Collections.emptySet();  // Trả về Set rỗng thay vì null
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return result;
    }

    public ChiTietSanPham SelectBySanPhamDonViTinh(int idSanPham, int idDonViTinh) {
        ChiTietSanPham ctsp;
        EntityManager entityManager = null;
        try {
            // Mở EntityManager để tạo giao dịch cho truy vấn
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Sử dụng JPQL để truy vấn ChiTietSanPham dựa trên idSanPham và idDonViTinh
            String jpql = "SELECT ctsp FROM ChiTietSanPham ctsp WHERE ctsp.sanPham.id = :idSanPham AND ctsp.donViTinh.id = :idDonViTinh";

            // Tạo truy vấn và thiết lập tham số
            TypedQuery<ChiTietSanPham> query = entityManager.createQuery(jpql, ChiTietSanPham.class);
            query.setParameter("idSanPham", idSanPham);
            query.setParameter("idDonViTinh", idDonViTinh);

            // Thực thi truy vấn và lấy kết quả
            ctsp = query.getSingleResult();

        } catch (NoResultException e) {
            ctsp = null; // Nếu không tìm thấy kết quả, trả về null
        } finally {
            // Đảm bảo EntityManager được đóng sau khi sử dụng
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return ctsp;
    }
}