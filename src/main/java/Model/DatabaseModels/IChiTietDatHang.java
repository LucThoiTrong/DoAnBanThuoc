package Model.DatabaseModels;

import Model.BusinessModels.DoiTuongSuDung.KhacHang.ChiTietDatHang;
import jakarta.persistence.*;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class IChiTietDatHang implements IDAO<ChiTietDatHang>{
    @Override
    public boolean insert(ChiTietDatHang obj) {
        return false;
    }

    @Override
    public boolean update(ChiTietDatHang obj) {
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
    public boolean delete(ChiTietDatHang obj) {
        EntityManager entityManager = null;

        try {
            // Mở EntityManager để thực hiện giao dịch
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Bắt đầu giao dịch
            entityManager.getTransaction().begin();

            // Sử dụng câu lệnh JPQL để xóa đối tượng theo ID
            Query query = entityManager.createQuery("DELETE FROM ChiTietDatHang c WHERE c.id = :id");
            query.setParameter("id", obj.getId());

            int rowsAffected = query.executeUpdate(); // Thực thi câu lệnh DELETE

            // Commit giao dịch nếu có đối tượng bị xóa
            if (rowsAffected > 0) {
                entityManager.getTransaction().commit();
                return true; // Xóa thành công
            } else {
                entityManager.getTransaction().rollback();
                return false; // Không tìm thấy đối tượng để xóa
            }

        } catch (Exception e) {
            // Nếu có lỗi xảy ra, rollback giao dịch
            if (entityManager != null && entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            e.printStackTrace();
            return false; // Có lỗi trong quá trình xóa
        } finally {
            // Đảm bảo đóng EntityManager sau khi sử dụng
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }


    @Override
    public Set<ChiTietDatHang> SelectAll() {
        return Set.of();
    }

    @Override
    public ChiTietDatHang SelectById(int id) {
        ChiTietDatHang chiTietDatHang = null;
        EntityManager entityManager = null;

        try {
            // Mở EntityManager để thực hiện giao dịch
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Sử dụng JPQL để truy vấn ChiTietDatHang dựa trên id
            String jpql = "SELECT ctdh FROM ChiTietDatHang ctdh WHERE ctdh.id = :id";

            // Tạo truy vấn và thiết lập tham số
            TypedQuery<ChiTietDatHang> query = entityManager.createQuery(jpql, ChiTietDatHang.class);
            query.setParameter("id", id);

            // Thực thi truy vấn và lấy kết quả
            chiTietDatHang = query.getSingleResult();

        } catch (NoResultException e) {
            chiTietDatHang = null; // Nếu không tìm thấy kết quả, trả về null
        } finally {
            // Đảm bảo đóng EntityManager sau khi sử dụng
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return chiTietDatHang;
    }

    @Override
    public Set<ChiTietDatHang> SelectByID(int id) {
        Set<ChiTietDatHang> result = new HashSet<>();
        EntityManager entityManager = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Thực hiện truy vấn HQL để lấy danh sách sản phẩm theo loại thuốc
            TypedQuery<ChiTietDatHang> query = entityManager.createQuery("FROM ChiTietDatHang ctdh WHERE ctdh.datHang.id = :idDatHang", ChiTietDatHang.class);
            query.setParameter("idDatHang", id);

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
