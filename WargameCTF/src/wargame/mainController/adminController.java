package wargame.mainController;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import wargame.dao.ChallengeDAO;
import wargame.dao.UserDAO;
import wargame.entity.User;

@Controller
@RequestMapping("adminPanel/")
@Transactional
public class adminController {
	@Autowired
	SessionFactory factory;
	@Autowired
	UserDAO userDao;
	@Autowired
	ChallengeDAO challDao;

	@RequestMapping("adminPanel")
	public String adminPanel() {
		return "adminPanel/adminPanel";
	}

	@RequestMapping("userManage")
	public String userManagement(ModelMap model) {
		userDao.setFactory(factory);
		List<User> users = userDao.getListUser("", "", "");
		model.addAttribute("users", users);
		return "adminPanel/userManage/userManage";
	}

	@RequestMapping(value="update", params="email")
	public String update(ModelMap model,@RequestParam("email") String mail) {
		userDao.setFactory(factory);
		User user = userDao.getUserByMail(mail);
		model.addAttribute("user", user);
		return "adminPanel/userManage/update";
	}
	
	@RequestMapping(value="update", params="saveUpdate")
	public String update(ModelMap model,@ModelAttribute("user") User user) {
//		dao.setFactory(factory);
//		User user = dao.getUserByMail(mail);
//		model.addAttribute("user", user);
		System.out.println(user.getUserName());
		System.out.println(user.getPassWord());
		System.out.println(user.getMail());
		return "adminPanel/userManage/update";
	}

	@RequestMapping(value = "delete", params = "email")
	public String delete(ModelMap model, @RequestParam("email") String mail) {
		userDao.setFactory(factory);
		try {
			User user = userDao.getUserByMail(mail);
			userDao.delete(user);
			model.addAttribute("message", "Ban da xoa thanh cong user: " + mail);
			List<User> users = userDao.getListUser("", "", "");
			model.addAttribute("users", users);
		} catch (Exception e) {
			model.addAttribute("error", "Xoa khong thanh cong !");
		}
		return "adminPanel/userManage/userManage";
	}
	
	public String challengeIndex(ModelMap model) {
		challDao.setFactory(factory);
		model.addAttribute("challenges",challDao.getListChallenge());
		return "adminPanel/challengeManage/challengeIndex";
	}
}
