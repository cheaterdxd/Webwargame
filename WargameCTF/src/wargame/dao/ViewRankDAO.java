package wargame.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import wargame.entity.ViewRank;

@Repository
public class ViewRankDAO {
	private SessionFactory factory;

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	public List<ViewRank> getListRank(){
		Session session = factory.getCurrentSession();
		String hql = "FROM ViewRank order by score desc";
		Query query = session.createQuery(hql);
		List<ViewRank> list = (List<ViewRank>)query.list();
		return list;
	}
}
