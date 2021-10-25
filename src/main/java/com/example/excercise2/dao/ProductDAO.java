package com.example.excercise2.dao;

import com.example.excercise2.model.ProductEntity;
import com.example.excercise2.model.UserEntity;
import com.example.excercise2.util.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ProductDAO {
    public List<ProductEntity> getAll() {

        Transaction transaction = null;
        List <ProductEntity> listOfProduct = null;
        // start a transaction
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            // get an user object

            listOfProduct = session.createQuery("from ProductEntity ").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listOfProduct;
    }
    public ProductEntity getProduct(String productCode) {
        Transaction transaction = null;
        ProductEntity productEntity = null;

        try(Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            productEntity = (ProductEntity) session.createQuery("FROM ProductEntity P WHERE P.code = :productCode")
                    .setParameter("productCode", productCode)
                    .uniqueResult();
            if (productEntity != null) {
                return productEntity;
            }
            transaction.commit();
        } catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return productEntity;
    }
}
