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
import com.cruds.pos.entity.FloorTable;


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
	public List<Floor> getAllfloor(Long estId) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Establishment est = session.load(Establishment.class, estId);
		String hql = "FROM Floor where establishment=:establishment";
		Query query = session.createQuery(hql); 
		query.setParameter("establishment", est);
		List<Floor> results = query.list();
		tx.commit();
		session.close();
		return results;
	}

	@Override
	public boolean createTable(String tableName, Long floorId, int maxCap)
	{
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Floor floor = session.load(Floor.class, floorId);
		
		System.out.println("Fllor Loaded!!!");
		FloorTable floorTable = new FloorTable(tableName, floor, maxCap);
		System.out.println("Floor Table Object Created...");
		session.saveOrUpdate(floorTable);
		
		System.out.println("Floor table Stored in database");
		tx.commit();
		session.close();
		System.out.println("Hibernate DAO Create TABLE Successfully");
		return true;
	
	}

	@Override
	public  List<FloorTable> getAllTable(Long floorId)
	{
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Floor flr = session.load(Floor.class, floorId);
		String hql = "FROM FloorTable where floor=:floor";
		Query query = session.createQuery(hql); 
		query.setParameter("floor", flr);
		List<FloorTable> results = query.list();
		tx.commit();
		session.close();
		System.out.println("Getting all table");
		return results;
	}
}
