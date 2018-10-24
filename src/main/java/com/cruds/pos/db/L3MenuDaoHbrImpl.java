package com.cruds.pos.db;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cruds.pos.entity.L2Menu;
import com.cruds.pos.entity.L3Menu;
import com.cruds.pos.entity.Tax;

@Repository
@Transactional
public class L3MenuDaoHbrImpl implements L3MenuDao {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean createL3menu(String name,Long l2mmId,Double price,Long taxId) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		L2Menu l2mm = session.load(L2Menu.class, l2mmId);
		Tax dbTax = session.load(Tax.class, taxId);
		L3Menu l3Menu = new L3Menu(name, l2mm,price, dbTax);
		session.saveOrUpdate(l3Menu);
		
		tx.commit();
		session.close();
		System.out.println("Hibernate DAO Create user Method");
		return true;
	}

}
