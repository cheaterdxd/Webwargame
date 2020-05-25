package wargame.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import wargame.entity.Challenge;
import wargame.entity.Solved;
import wargame.entity.User;

@Repository
public class SolvedDAO {
	private SessionFactory factory;

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public void insert(Solved solved) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// lưu tạm dữ liệu
			session.save(solved);

			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {
			System.out.println("co van de khi them solved");
			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {

			// đóng session
			session.close();
		}
	}
	
	public void delete(Solved solved) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// xoá
			session.delete(solved);

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
	public List<Solved> getListChallByMail(String mail) {
		Session session = factory.getCurrentSession();

		// check mail info
		String hql = "FROM Solved WHERE userMail=:mail";
		Query query = session.createQuery(hql);
		query.setParameter("mail", mail);
		List<Solved> requestDatabase = query.list();
		return requestDatabase;
	}
}
