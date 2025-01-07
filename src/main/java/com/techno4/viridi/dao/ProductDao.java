package com.techno4.viridi.dao;

import com.techno4.viridi.entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Save a new product
    public boolean saveProduct(Product product) {
        boolean success = false;
        Transaction tx = null;
        try (Session session = this.factory.openSession()) {
            tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace(); // Consider using a logging framework
        }
        return success;
    }

    // Get all products
    public List<Product> getAllProducts() {
        try (Session session = this.factory.openSession()) {
            Query<Product> query = session.createQuery("from Product", Product.class);
            return query.list();
        }
    }

    // Get all products of a given category
    public List<Product> getAllProductsById(int cid) {
        try (Session session = this.factory.openSession()) {
            Query<Product> query = session.createQuery("from Product as p where p.category.categoryId =: id", Product.class);
            query.setParameter("id", cid);
            return query.list();
        }
    }

    // Get all products by farmer ID
    public List<Product> getAllProductsByFarmerId(int farmerId) {
        try (Session session = this.factory.openSession()) {
            Query<Product> query = session.createQuery("from Product as p where p.farmer.id =: farmerId", Product.class);
            query.setParameter("farmerId", farmerId);
            return query.list();
        }
    }

    // Get a product by its ID
    public Product getProductById(int productId) {
        Product product = null;
        try (Session session = this.factory.openSession()) {
            product = session.get(Product.class, productId);
        }
        return product;
    }

    // Get the total count of products
    public long getProductCount() {
        try (Session session = this.factory.openSession()) {
            Long count = (Long) session.createQuery("select count(*) from Product").getSingleResult();
            return count != null ? count : 0;
        }
    }

    // Update an existing product
    public boolean updateProduct(Product product) {
        boolean success = false;
        Transaction tx = null;
        try (Session session = this.factory.openSession()) {
            tx = session.beginTransaction();
            session.update(product);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace(); // Consider using a logging framework
        }
        return success;
    }

    // Delete a product by its ID
    public boolean deleteProduct(int productId) {
        boolean success = false;
        Transaction tx = null;
        try (Session session = this.factory.openSession()) {
            tx = session.beginTransaction();
            Product product = session.get(Product.class, productId);
            if (product != null) {
                session.delete(product);
                success = true;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace(); // Consider using a logging framework
        }
        return success;
    }
}