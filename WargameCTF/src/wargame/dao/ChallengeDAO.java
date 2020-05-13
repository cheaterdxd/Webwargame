package wargame.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import wargame.entity.Challenge;

@Repository
public class ChallengeDAO {
	private SessionFactory factory;

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public void insert(Challenge chall) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {
			// lưu tạm dữ liệu
			session.save(chall);

			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {

			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {

			// đóng session
			session.close();
		}
	}
	
	public void update(Challenge chall) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// update
			session.update(chall);

			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {

			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {

			// đóng session
			session.close();
		}
	}
	
	public void delete(Challenge chall) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// xoá
			session.delete(chall);

			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {

			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {

			// đóng session
			session.close();
		}
	}
	
	public List<Challenge> getListChallenge(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Challenge";
		Query query = session.createQuery(hql);
		List<Challenge> list = (List<Challenge>)query.list();
		return list;
	}
	
}
