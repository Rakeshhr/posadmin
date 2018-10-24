package com.cruds.pos.db;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cruds.pos.entity.Establishment;
import com.cruds.pos.entity.Floor;


@Repository
@Transactional
public class FloorDAOHbrlmpl implements FloorDAO
{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean createfloor(String name,Long estId) 
	{
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
	    Establishment mm = session.load(Establishment.class, estId);
		Floor floor = new Floor(name, mm);
		session.saveOrUpdate(floor);
		tx.commit();
		session.close();
		System.out.println("Hibernate DAO Create Floor");
		return true;
		
	}

	@Override
	public List<Floor> getAllfloor() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Floor";
		Query query = session.createQuery(hql); 
		List<Floor> results = query.list();
		tx.commit();
		session.close();
		return results;
	}
}
