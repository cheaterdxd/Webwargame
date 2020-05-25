package wargame.mainController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import wargame.dao.ChallengeDAO;
import wargame.dao.SolvedDAO;
import wargame.dao.UserDAO;
import wargame.dao.ViewRankDAO;
import wargame.entity.Challenge;
import wargame.entity.Solved;
import wargame.entity.SolvedKey;
import wargame.entity.User;
import wargame.entity.ViewRank;

@Controller
@Transactional
public class MainPage {
	@Autowired
	SessionFactory factory;
	@Autowired
	ViewRankDAO rankDao;
	@Autowired
	ChallengeDAO challDao;
	@Autowired
	SolvedDAO sovledDao;
	@Autowired
	UserDAO userDao;

	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		return "index";
	}

	@RequestMapping(value = "rank")
	public String rank(ModelMap model) {
		rankDao.setFactory(factory);
		List<ViewRank> rank = rankDao.getListRank();
		model.addAttribute("rank", rank);
		return "rank";
	}

	@RequestMapping(value = "challenge")
	public String challenge(ModelMap model) {
		challDao.setFactory(factory);
		List<Challenge> challs = challDao.getListChallenge();
		model.addAttribute("challs", challs);
//		for (Challenge c : challs) {
//			System.out.println(c.getFileAttach());
//			for (String a : c.changeStringFileToList()) {
//				System.out.println(a);
//			}
//		}
		return "challenge";
	}

	@RequestMapping(value = "challenge", params = "submitFlag")
	public String challenge(ModelMap model, HttpServletRequest request, @RequestParam("flag") String flag,
			@RequestParam("id") int id) {
		System.out.println("vao ham");
		challDao.setFactory(factory);
		userDao.setFactory(factory);
		HttpSession sessionHttp = request.getSession();
//		System.out.println("flag" + flag + "with" + id);
		Challenge chall = challDao.getChallengeById(id);
		User user = (User) sessionHttp.getAttribute("user");
//		User user2 = userDao.getUserByMail(user.getMail());
		if (chall.isSovledBy(user.getMail())) {
			System.out.println("giai roi");
			return "challenge";
		}
		if (chall.getFlag().equals(flag)) {
			sovledDao.setFactory(factory);
			Solved solved = new Solved();
			SolvedKey solvedkey = new SolvedKey();
			solvedkey.setUser(user);
			solvedkey.setChall(chall);
			solved.setSolvedKey(solvedkey);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			solved.setDateSolved(formatter.format(new Date()));
			sovledDao.insert(solved);
		}
		
		model.addAttribute("challs", challDao.getListChallenge());
		return "redirect:challenge.htm";
	}
}
