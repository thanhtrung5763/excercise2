package com.example.excercise2.util;

import com.example.excercise2.model.ProductEntity;
import com.example.excercise2.model.UserEntity;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateUtils {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        System.out.println(sessionFactory);
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();
                // Hibernate settings equivalent to hibernate.cfg.xml's properties
                Properties settings = new Properties();
                settings.put(Environment.DRIVER, "org.postgresql.Driver");
//                settings.put(Environment.URL, "jdbc:postgresql://localhost:5432/TodoApp");
//                settings.put(Environment.USER, "postgres");
//                settings.put(Environment.PASS, "57632919");
                settings.setProperty(Environment.URL,"jdbc:postgresql://localhost:5432/excercise");
                settings.setProperty(Environment.USER,"postgres");
                settings.setProperty(Environment.PASS,"57632919");
//                settings.setProperty(Environment.URL,"jdbc:postgresql://ec2-34-239-55-93.compute-1.amazonaws.com:5432/d352gr1ttfjolk");
//                settings.setProperty(Environment.USER,"pykyrnqggdnwdj");
//                settings.setProperty(Environment.PASS,"8e1370df19a4fc115ac9e1139b22638a244313d1baeeb8a160c0fd02821f3dd7");
                settings.setProperty(Environment.DIALECT,"org.hibernate.dialect.PostgreSQL95Dialect");
                settings.put(Environment.SHOW_SQL, "true");
                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
                settings.put(Environment.HBM2DDL_AUTO, "update");
                configuration.setProperties(settings);

                configuration.addAnnotatedClass(ProductEntity.class);
                configuration.addAnnotatedClass(UserEntity.class);
                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySettings(configuration.getProperties()).build();
                System.out.println("Hibernate Java Config serviceRegistry created");
                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
                return sessionFactory;

            } catch (Exception e) {
                System.out.println("Hibernate Java Config serviceRegistry created");
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}
