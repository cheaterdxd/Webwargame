package wargame.mainController;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import wargame.dao.ChallengeDAO;
import wargame.dao.UserDAO;
import wargame.entity.Challenge;
import wargame.entity.Solved;
import wargame.entity.SolvedKey;
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
			user.setChalls(null);
			userDao.delete(user);
//			model.addAttribute("message", "Ban da xoa thanh cong user: " + user.getUserName());
			List<User> users = userDao.getListUser();
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
	String rootPath = "D:/JAVACODE/WargameCTF/WebContent/files/";

	@RequestMapping(value = "addChallenge", params = "submit")
	public String addChallenge(ModelMap model, @Validated @ModelAttribute("chall") Challenge chall,
			@RequestParam("files") MultipartFile[] files, BindingResult errors) {

		String challname = chall.getChallengeName();
		if (challname.length() < 1 || challname.length() > 50) {
			errors.rejectValue("challengeName", "chall", "Tên ngắn hơn 50 kí tự");
		}
		String formatter = "[{}._-a-zA-z0-9]+";
		if (!challname.matches(formatter)) {
			errors.rejectValue("challengeName", "chall", "Tên chỉ chứa chữ, số và các kí tự sau: {}._- ");
		}
		if (chall.getScore() < 1 || chall.getScore() > 1000) {
			errors.rejectValue("score", "chall", "Điểm trong khoảng 1-1000");
		}
		if (chall.getDescription().length() > 200) {
			errors.rejectValue("description", "chall", "Không quá 200 kí tự");
		}
		if (chall.getHint().length() > 200) {
			errors.rejectValue("hint", "chall", "Không quá 200 kí tự");
		}

		if (chall.getMajor().equals("") || chall.getMajor().length() > 20) {
			errors.rejectValue("major", "chall", "0-200 kí tự");
		}
		if (!chall.getMajor().matches("\\w+")) {
			errors.rejectValue("major", "chall", "Chi nhan chu cai va so");
		}
		String flag = chall.getFlag();
		if (flag.length() < 1 || flag.length() > 100) {
			errors.rejectValue("flag", "chall", "0-100 ki tu");
		}
		if (!flag.matches("[0-9a-zA-Z_.-]+")) {
			errors.rejectValue("flag", "chall", "Chi gom chu so va ki tu");
		}
		String fileAttach = "";
		System.out.println("file[] length = " + files.length + "\n" + files[0].getOriginalFilename());
		if (files.length > 0) {
			for (MultipartFile file : files) {
				if (!file.getOriginalFilename().equals("")) {
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
			}
		}
		if (!errors.hasErrors()) {
			chall.setFileAttach(fileAttach);
			challDao.setFactory(factory);
			System.out.println(chall);
			challDao.insert(chall);
			System.out.println(chall.getChallengeName());
			System.out.println(chall.getMajor());
			System.out.println(chall.getScore());
			System.out.println(chall.getFileAttach());
			return "adminPanel/challengeManage/challengeIndex";
		}
		return "adminPanel/challengeManage/add";
	}

	@RequestMapping(value = "editChallenge", method = RequestMethod.GET)
	public String editChallenge(ModelMap model, @RequestParam("id") int id) {
		challDao.setFactory(factory);
		Challenge chall = challDao.getChallengeById(id);
		if (chall != null) {
			model.addAttribute("chall", chall);
			List<String> filelist = challDao.changeStringFileToMultiPart(rootPath, chall);
			model.addAttribute("filelist", filelist);
			System.out.println(chall.getId());
			System.out.println(chall.getChallengeName());
			System.out.println(chall.getMajor());
			System.out.println(chall.getScore());
		}
		return "adminPanel/challengeManage/update";
	}

	@RequestMapping(value = "editChallenge", params = "update")
	public String editChallenge(ModelMap model, @ModelAttribute("chall") Challenge chall,
			@RequestParam("files") MultipartFile[] files) {
		String fileAttach = "";
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().contentEquals("")) {
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
		}

		challDao.setFactory(factory);
		System.out.println(chall.getId());
		System.out.println(chall.getFileAttach());
		System.out.println(chall.getChallengeName());
		System.out.println(chall.getMajor());
		System.out.println(chall.getScore());
		System.out.println(chall.getDescription());
		System.out.println(chall.getHint());
		if (!fileAttach.equals("") && fileAttach != null) {
			// xoá đi file cũ
			for (String file : challDao.changeStringFileToMultiPart(rootPath, chall))
				FileWorking.deleteFile(file);
			// set file mới
			chall.setFileAttach(fileAttach);
		}
		challDao.update(chall);
//		model.addAttribute("message", "Ban da update thanh cong !" + chall.getId());
		return "adminPanel/challengeManage/update";
	}

	@RequestMapping(value = "deleteChallenge")
	public String deleteChallenge(ModelMap model, @RequestParam("id") int id) {
		challDao.setFactory(factory);
		Challenge chall = challDao.getChallengeById(id);
		if (chall != null) {
			chall.setSolvedBy(null);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			if (challDao.delete(chall))
				model.addAttribute("message", "Ban da xoa thanh cong!");
			else
				model.addAttribute("message", "Ban da xoa that bai!");
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		}
		return challengeIndex(model);
	}
}
