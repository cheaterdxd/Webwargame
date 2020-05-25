package wargame.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import wargame.entity.Challenge;
import wargame.entity.Solved;
import wargame.entity.User;

@Repository
public class UserDAO {
	private SessionFactory factory;

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public void insert(User user) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {
			// lưu tạm dữ liệu
			session.save(user);

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

	public void update(User user) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// update
			session.update(user);

			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {
			System.out.println("Xay ra loi trong khi update user !");
			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {

			// đóng session
			session.close();
		}
	}
	
	public void delete(User user) {
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// xoá
			session.delete(user);

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
	
	public User getUserByMail(String mail) {
		Session session = factory.openSession();

		// check mail info
		String checkMailhql = "FROM User WHERE mail=:mail";
		Query query2 = session.createQuery(checkMailhql);
		query2.setParameter("mail", mail);
		User userRequestDatabase2 = (User) query2.uniqueResult();
		System.out.println("Get user by mail:" + userRequestDatabase2.getUserName() );
		return userRequestDatabase2;
	}

	public boolean isMailExist(String mail) {
		User userRequestDatabase2 = getUserByMail(mail);
		System.out.println("check exist:" + userRequestDatabase2 );
		// nếu tồn tại
		if (userRequestDatabase2.getMail().equals(mail)) {
			return true;
		}
		return false;
	}

	public boolean isUsernameExist(String username) {
		
		User userRequestDatabase = getUserByUsername(username);
		if (userRequestDatabase != null) {
			return true;
		}
		return false;
	}

	public User getUserByUsername(String username) {
		Session session = factory.getCurrentSession();

		// check mail info
		String checkUsernamelhql = "FROM User WHERE userName=:username";
		Query query = session.createQuery(checkUsernamelhql);
		query.setParameter("username", username);
		User userRequestDatabase = (User) query.uniqueResult();
		return userRequestDatabase;
	}
	
	public List<User> getListUser(String username, String password, String mail) {
		Session session = factory.getCurrentSession();
		String hql = "FROM User ";
		if (!mail.equals(""))
			hql += "AND mail =:mail ";
		if (!username.equals(""))
			hql += "WHERE userName= :username ";
		if (!password.equals(""))
			hql += "AND passWord= :password";

		Query query = session.createQuery(hql);
		if (!mail.equals(""))
			query.setParameter("mail", mail);
		if (!username.equals(""))
			query.setParameter("username", username);
		if (!password.equals(""))
			query.setParameter("password", password);

		List<User> list = query.list();
		return list;
	}
	
	public List<Solved> getListSolved(String mail){
		User user = getUserByMail(mail);
        System.out.println("User: " + user.getUserName());
        List<Solved> solves = user.getSolves();
        return solves;
	}
}
//Session session = factory.getCurrentSession();
//String checkUsernamelhql = "FROM Solved WHERE userName=:username";
//Query query = session.createQuery(checkUsernamelhql);
//query.setParameter("username", username);
//User userRequestDatabase = (User) query.uniqueResult();
//Session session = factory.openSession();
//Transaction trans = session.beginTransaction();
//User user= (User)session.load(User.class, mail);
