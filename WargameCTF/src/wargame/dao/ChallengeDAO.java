package wargame.dao;

import java.util.ArrayList;
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

	public boolean insert(Challenge chall) {
		boolean excuteRight = true;
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {
			// lưu tạm dữ liệu
			session.save(chall);

			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {
			excuteRight = false;
			System.out.println("Insert challenge failed \n");
			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {
			
			// đóng session
			session.close();
		}
		return excuteRight;
	}
	
	public boolean update(Challenge chall) {
		boolean excuteRight = true;
		Session session = factory.openSession();
		Transaction trans = session.beginTransaction();
		try {

			// update
			session.update(chall);
			
			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {
			excuteRight = false;
			System.out.println(e.getMessage());
			System.out.println("có lỗi!");
			// nếu có vấn đề thì rollback lại
			trans.rollback();
		} finally {
			// đóng session
			session.close();
		}
		return excuteRight;
	}
	
	public boolean delete(Challenge chall) {
		Session session = factory.openSession();
		boolean excuteRight=true; 
		Transaction trans = session.beginTransaction();
		try {
			System.out.println(chall);
			// xoá
			session.delete(chall);
			// nếu không xảy ra vấn đề thì commit
			trans.commit();
		} catch (Exception e) {
			System.out.println("Delete challenge failed \n");
			System.out.println(e.getMessage()+"\n" + e.getCause());
			// nếu có vấn đề thì rollback lại
			trans.rollback();
			excuteRight = false;
		} finally {
			// đóng session
			session.close();
		}
		return excuteRight;
	}
	
	public List<Challenge> getListChallenge(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Challenge";
		Query query = session.createQuery(hql);
		List<Challenge> list = (List<Challenge>)query.list();
		return list;
	}
	
	public Challenge getChallengeById(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Challenge WHERE id=:idc";
		Query query = session.createQuery(hql);
		query.setParameter("idc", id);
		Challenge chall = (Challenge)query.uniqueResult();
		return chall;
	}
	
	public List<String> changeStringFileToMultiPart(String fileRootPath, Challenge chall) {
		List<String> listFile = new ArrayList<String>();
		String[] fileAtt = chall.getFileAttach().split(";");
		for(String file:fileAtt) {
//			File transFile = new File(fileRootPath+file);
			System.out.println(file.equals(""));
			if(!file.equals("") && file != null )listFile.add(fileRootPath+file);
		}
		return listFile;
	}
	
}
