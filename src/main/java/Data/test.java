package Data;

import Model.DatabaseModels.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class test {
    public static void main(String[] args) {
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Lấy EntityManager từ HibernateUtil
            entityManager = HibernateUtil.getEntityManagerFactory().createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

//            // Tạo và thiết lập khách hàng
//            Customer customer = new Customer();
//            customer.setName("Nguyễn Văn A"); // Thiết lập tên khách hàng
//            customer.setPhoneNumber("0123456789"); // Thiết lập số điện thoại
//            customer.setAddress("Hà Nội, Việt Nam"); // Thiết lập địa chỉ
//
//            // Lưu khách hàng vào cơ sở dữ liệu
//            entityManager.persist(customer);
            transaction.commit();
//            System.out.println("Khách hàng đã được lưu thành công.");
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback(); // Rollback transaction on error
            }
            e.printStackTrace(); // In case of error, print the stack trace
        } finally {
            if (entityManager != null) {
                entityManager.close(); // Close EntityManager
            }
        }
    }
}
