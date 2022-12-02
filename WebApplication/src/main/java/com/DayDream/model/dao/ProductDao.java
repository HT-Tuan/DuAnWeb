package com.DayDream.model.dao;

<<<<<<< HEAD
import com.DayDream.model.entity.Invoice;
import java.util.ArrayList;
=======
>>>>>>> f198efadec4c4f5414e7dad3992b0d5dae76d6bf
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.DayDream.model.entity.Product;
import com.DayDream.utils.HibernateUtils;
import org.hibernate.Transaction;

public class ProductDao extends HibernateDao<Product> implements IHibernateDao<Product> {
   private SessionFactory sessionfactory = HibernateUtils.getFACTORY();
   
    @Override
    public boolean insert(Product product) {
        return super.insert(product);
    }
    
    @Override
    public boolean update(Product product) {
        return super.update(product);
    }
    
    @Override
    public boolean delete(Product product) {
        return super.delete(product);
    }
    
    public Product get(Product product) {
        return null;
    }

    public List<Product> getAllProducts()
    {
        Session session = sessionfactory.openSession();
        try {
            String hql = "FROM Product";
            Query query = session.createQuery(hql);
            return query.list();

        } catch (Exception e) {
            // TODO: handle exception\\\
            System.out.println("Loi khong the lay tat ca san pham");
            e.printStackTrace();
        }
        finally
        {
            session.close();
        }
        return null;
    }

    public List<Product> getProGood()
    {
        Session session = sessionfactory.openSession();
        try {
            String hql = "FROM Product p WHERE p.description = 'good'";
            Query query = session.createQuery(hql);
            return query.list();

        } catch (Exception e) {
            // TODO: handle exception\\\
            System.out.println("Co loi khong the lay San pham");
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    
        public Product getProductByID(int id)
    {
         Product entity = null;
		Transaction transaction = null;
		try (Session session = sessionfactory.openSession()) {
			transaction = session.beginTransaction();

			entity = session.get(Product.class, id);

			session.flush();		
			session.refresh(entity);		
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return entity;
    }
    
}
