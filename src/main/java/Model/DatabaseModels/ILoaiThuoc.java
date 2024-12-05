package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import Model.BusinessModels.SanPham.LoaiThuoc;
import Model.BusinessModels.SanPham.SanPham;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class ILoaiThuoc implements IDAO<LoaiThuoc>{
    //thêm sản phẩm vào loại thuốc đó
    public void ThemSanPham(LoaiThuoc lt) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Dùng merge để tái kết nối đối tượng với EntityManager
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();
            //cập nhật lại

            entityManager.merge(lt);
            transaction.commit();

        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        }
    }
    //thêm loại thuốc
    @Override
    public boolean insert(LoaiThuoc obj)
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
    public boolean update(LoaiThuoc obj) {
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
    public boolean delete(LoaiThuoc obj) {
        return false;
    }

    @Override
    public Set<LoaiThuoc> SelectAll() {
        Set<LoaiThuoc> result = new HashSet<>();
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Thực hiện truy vấn HQL để lấy toàn bộ dữ liệu từ bảng SanPham
            TypedQuery<LoaiThuoc> query = entityManager.createQuery("FROM LoaiThuoc ", LoaiThuoc.class);
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
    public LoaiThuoc SelectById(int id) {
        LoaiThuoc lt = null;
        EntityManager entityManager = null;

        try {
            // Mở EntityManager để thực hiện giao dịch
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Sử dụng JPQL để truy vấn ChiTietDatHang dựa trên id
            String jpql = "SELECT loaithuoc FROM LoaiThuoc loaithuoc WHERE loaithuoc.id = :id";

            // Tạo truy vấn và thiết lập tham số
            TypedQuery<LoaiThuoc> query = entityManager.createQuery(jpql, LoaiThuoc.class);
            query.setParameter("id", id);

            // Thực thi truy vấn và lấy kết quả
            lt = query.getSingleResult();

        } catch (NoResultException e) {
            lt = null; // Nếu không tìm thấy kết quả, trả về null
        } finally {
            // Đảm bảo đóng EntityManager sau khi sử dụng
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return lt;
    }

    @Override
    public Set<LoaiThuoc> SelectByID(int id) {
        Set<LoaiThuoc> result = new HashSet<>();
        EntityManager entityManager = null;
        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy danh sách sản phẩm theo loại thuốc
            String hql = "FROM LoaiThuoc lt WHERE lt.danhMucThuoc.id = :idDanhMuc";
            TypedQuery<LoaiThuoc> query = entityManager.createQuery(hql, LoaiThuoc.class);
            query.setParameter("idDanhMuc", id);

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

}