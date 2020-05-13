package wargame.mainController;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import wargame.dao.ChallengeDAO;

@Controller
@Transactional
public class ChallengeController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ChallengeDAO dao;
	
}
