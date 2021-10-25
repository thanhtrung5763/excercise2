package com.example.excercise2.dao;

import com.example.excercise2.model.UserEntity;
import com.example.excercise2.util.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UserDAO {
    public UserEntity getUser(int id) {
        Transaction transaction = null;
        UserEntity usersEntity = null;

        try(Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            usersEntity = session.get(UserEntity.class, id);
            transaction.commit();
        } catch(Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return usersEntity;
    }
    public boolean isExist(String Email) {
        Transaction transaction = null;
        UserEntity usersEntity = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            usersEntity = (UserEntity) session.createQuery("FROM UserEntity U WHERE U.email = :Email")
                    .setParameter("Email", Email)
                    .uniqueResult();
            if (usersEntity != null) {
                return true;
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }
    public static UserEntity getUser(String Email) {
        Transaction transaction = null;
        UserEntity usersEntity = null;

        try(Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            usersEntity = (UserEntity) session.createQuery("FROM UserEntity U WHERE U.email = :Email")
                    .setParameter("Email", Email)
                    .uniqueResult();
            if (usersEntity != null) {
                return usersEntity;
            }
            transaction.commit();
        } catch(Exception e) {
            if(transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return usersEntity;
    }
    public static void insertUser(UserEntity user){
        Transaction transaction = null;
        try(Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch(Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public List<UserEntity> getAllEmailList() {

        Transaction transaction = null;
        List <UserEntity> listOfEmail = null;
        // start a transaction
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            // get an user object

            listOfEmail = session.createQuery("from UserEntity ").getResultList();

            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listOfEmail;
    }
}
