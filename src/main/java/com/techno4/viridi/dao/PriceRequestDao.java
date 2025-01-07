package com.techno4.viridi.dao;

import com.techno4.viridi.entities.PriceRequest;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class PriceRequestDao {
    private SessionFactory factory;

    public PriceRequestDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean savePriceRequest(PriceRequest request) {
        boolean success = false;
        Transaction tx = null;
        try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            session.save(request);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback(); // Rollback in case of an error
            e.printStackTrace();
        }
        return success;
    }

    public List<PriceRequest> getRequestsByFarmer(int farmerId) {
        try (Session session = factory.openSession()) {
            Query<PriceRequest> query = session.createQuery(
                "from PriceRequest pr where pr.product.farmer.id = :farmerId order by pr.requestDate desc",
                PriceRequest.class
            );
            query.setParameter("farmerId", farmerId);
            return query.list();
        }
    }

    public List<PriceRequest> getRequestsByUser (int userId) {
        try (Session session = factory.openSession()) {
            Query<PriceRequest> query = session.createQuery(
                "from PriceRequest pr where pr.user.id = :userId order by pr.requestDate desc",
                PriceRequest.class
            );
            query.setParameter("userId", userId);
            return query.list();
        }
    }

    public boolean updatePriceRequest(PriceRequest request) {
        boolean success = false;
        Transaction tx = null;
        try (Session session = factory.openSession()) {
            tx = session.beginTransaction();
            session.update(request);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback(); // Rollback in case of an error
            e.printStackTrace();
        }
        return success;
    }

    public PriceRequest getPriceRequestById(int requestId) {
        PriceRequest priceRequest = null;
        try (Session session = factory.openSession()) {
            priceRequest = session.get(PriceRequest.class, requestId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return priceRequest;
    }
public List<PriceRequest> getAllPriceRequests() {
    List<PriceRequest> requests = null;
    try (Session session = factory.openSession()) {
        // Create a Hibernate query to fetch all price requests
        Query<PriceRequest> query = session.createQuery(
            "from PriceRequest pr order by pr.requestDate desc", 
            PriceRequest.class
        );
        
        // Execute the query and get the results
        requests = query.list();
        
    } catch (Exception e) {
        e.printStackTrace();
        // You might want to log the error here
    }
    
    // Return empty list instead of null if no requests found
    return requests != null ? requests : new ArrayList<>();
}    
}