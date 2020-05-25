package wargame.mainController;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import wargame.dao.ChallengeDAO;
import wargame.dao.UserDAO;
import wargame.entity.Challenge;
import wargame.entity.User;
import generalFunction.FileWorking;

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

//	@RequestMapping("addUser")
//	public String addUser(ModelMap model) {
//		User user = new User();
//		model.addAttribute("user", user);
//		return "adminPanel/userManage/add";
//	}

	@RequestMapping(value = "update", params = "email")
	public String update(ModelMap model, @RequestParam("email") String mail) {
		userDao.setFactory(factory);
		User user = userDao.getUserByMail(mail);
		model.addAttribute("user", user);
		return "adminPanel/userManage/update";
	}

	@RequestMapping(value = "update", params = "saveUpdate")
	public String update(ModelMap model, @ModelAttribute("user") User user) {
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

	@RequestMapping("challengeManage")
	public String challengeIndex(ModelMap model) {
		challDao.setFactory(factory);
		model.addAttribute("challenges", challDao.getListChallenge());
		return "adminPanel/challengeManage/challengeIndex";
	}

	@RequestMapping("addChallenge")
	public String addChallenge(ModelMap model) {
		Challenge chall = new Challenge();
		model.addAttribute("chall", chall);
		return "adminPanel/challengeManage/add";
	}

	@Autowired
	ServletContext context;
	String rootPath = "D:/JAVACODE/WargameCTF/";
	
	@RequestMapping(value = "addChallenge", params = "submit")
	public String addChallenge(ModelMap model, @ModelAttribute("chall") Challenge chall,
			@RequestParam("files") MultipartFile[] files) {
		String fileAttach = "";
		for (MultipartFile file : files) {
			fileAttach += file.getOriginalFilename();
			fileAttach += ";";
			try {
				String filePath = rootPath + file.getOriginalFilename();
				file.transferTo(new File(filePath));

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(file.getOriginalFilename());
		}
		chall.setFileAttach(fileAttach);
		challDao.setFactory(factory);
		challDao.insert(chall);
		System.out.println(chall.getChallengeName());
		System.out.println(chall.getMajor());
		System.out.println(chall.getScore());
		System.out.println(chall.getFileAttach());
		return "adminPanel/challengeManage/add";
	}

	@RequestMapping(value = "editChallenge", method = RequestMethod.GET)
	public String editChallenge(ModelMap model, @RequestParam("id") int id) {
		challDao.setFactory(factory);
		Challenge chall = challDao.getChallengeById(id);
		model.addAttribute("chall", chall);
		List<String> filelist = challDao.changeStringFileToMultiPart(rootPath, chall);
		model.addAttribute("filelist", filelist);
		System.out.println(chall.getId());
		System.out.println(chall.getChallengeName());
		System.out.println(chall.getMajor());
		System.out.println(chall.getScore());
		return "adminPanel/challengeManage/update";
	}

	@RequestMapping(value = "editChallenge", params = "update")
	public String editChallenge(ModelMap model, @ModelAttribute("chall") Challenge chall,@RequestParam("files") MultipartFile[] files) {
		String fileAttach="";
		for (MultipartFile file : files) {
			fileAttach += file.getOriginalFilename();
			fileAttach += ";";
			try {
				String filePath = rootPath + file.getOriginalFilename();
				file.transferTo(new File(filePath));

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(file.getOriginalFilename());
		}
		
		
		challDao.setFactory(factory);
		System.out.println(chall.getId());
		System.out.println(chall.getFileAttach());
		System.out.println(chall.getChallengeName());
		System.out.println(chall.getMajor());
		System.out.println(chall.getScore());
		System.out.println(chall.getDescription());
		System.out.println(chall.getHint());
		if(!fileAttach.equals("") && fileAttach!=null) {
			// xoá đi file cũ
			for(String file : challDao.changeStringFileToMultiPart(rootPath, chall)) FileWorking.deleteFile(file);
			// set file mới
			chall.setFileAttach(fileAttach);
		}
		challDao.update(chall);
//		model.addAttribute("message", "Ban da update thanh cong !" + chall.getId());
		return "adminPanel/challengeManage/update";
	}
	
	@RequestMapping(value="deleteChallenge")
	public String deleteChallenge(ModelMap model, @RequestParam("id") int id) {
		challDao.setFactory(factory);
		Challenge chall = challDao.getChallengeById(id);
		if(challDao.delete(chall)) model.addAttribute("message", "Ban da xoa thanh cong!");
		else model.addAttribute("message", "Ban da xoa that bai!");
		return challengeIndex(model);
	}
}
