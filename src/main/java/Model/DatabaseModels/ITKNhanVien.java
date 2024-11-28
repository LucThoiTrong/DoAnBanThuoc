package Model.DatabaseModels;

import Model.BusinessModels.TKDoiTuongSuDung.TKNhanVien;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;

import java.util.Set;

public class ITKNhanVien implements IDAO<TKNhanVien> {
    @Override
    public boolean insert(TKNhanVien obj) {
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
    public boolean update(TKNhanVien obj) {
        return false;
    }

    @Override
    public boolean delete(TKNhanVien obj) {
        return false;
    }

    @Override
    public Set<TKNhanVien> SelectAll() {
        return Set.of();
    }

    @Override
    public TKNhanVien SelectById(int id) {
        return null;
    }

    @Override
    public Set<TKNhanVien> SelectByID(int id) {
        return Set.of();
    }

    public TKNhanVien selectTKNhanVien(String username, String password) {
        TKNhanVien tknv = null;
        EntityManager entityManager = null;
        try {
            // Mở EntityManager để thực hiện truy vấn
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();

            // Câu lệnh JPQL để tìm TKNhanVien theo username và password
            String jpql = "SELECT t FROM TKNhanVien t WHERE t.username = :username AND t.password = :password";

            // Thực hiện truy vấn và lấy kết quả
            tknv = entityManager.createQuery(jpql, TKNhanVien.class)
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
        return tknv;  // Trả về kết quả nếu tìm thấy
    }
}
