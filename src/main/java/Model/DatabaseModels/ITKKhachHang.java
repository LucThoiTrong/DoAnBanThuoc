package Model.DatabaseModels;

import Model.BusinessModels.SanPham.SanPham;
import Model.BusinessModels.TKDoiTuongSuDung.TKKhachHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.HashSet;
import java.util.Set;

public class ITKKhachHang implements IDAO<TKKhachHang>{

    @Override
    public boolean insert(TKKhachHang obj) {
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
    public boolean update(TKKhachHang obj) {
        return false;
    }

    @Override
    public boolean delete(TKKhachHang obj) {
        return false;
    }

    @Override
    public Set<TKKhachHang> SelectAll() {
        return Set.of();
    }

    @Override
    public TKKhachHang SelectById(int id) {
        return null;
    }

    @Override
    public Set<TKKhachHang> SelectByID(int id) {
        return Set.of();
    }

    public TKKhachHang selectTKKhachHang(String username, String password) {
        TKKhachHang tkkh = null;
        EntityManager entityManager = null;
        try {
            // Mở EntityManager để tạo giao dịch cho truy vấn
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Câu lệnh JPQL để tìm TKKhachHang theo username và password
            String jpql = "SELECT t FROM TKKhachHang t WHERE t.username = :username AND t.password = :password";

            // Thực hiện truy vấn và lấy kết quả
            tkkh = entityManager.createQuery(jpql, TKKhachHang.class)
                    .setParameter("username", username)  // Gán giá trị cho tham số username
                    .setParameter("password", password)  // Gán giá trị cho tham số password
                    .getSingleResult();  // Lấy duy nhất một kết quả

        } catch (NoResultException e) {
            // Nếu không tìm thấy kết quả nào (NoResultException), trả về null
            return null;
        } catch (Exception e) {
            // Xử lý các ngoại lệ khác, in ra thông báo lỗi
            e.printStackTrace();
            return null;
        } finally {
            // Đảm bảo EntityManager được đóng sau khi sử dụng
            if (entityManager != null) {
                entityManager.close();
            }
        }
        return tkkh;  // Trả về kết quả nếu tìm thấy
    }

}
