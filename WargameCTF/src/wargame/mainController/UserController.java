package wargame.mainController;

import generalFunction.GenerateRandomCodeValid;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import wargame.bean.Mailer;
import wargame.dao.SolvedDAO;
import wargame.dao.UserDAO;
import wargame.entity.Solved;
import wargame.entity.User;

@Controller
@Transactional
public class UserController {
	@Autowired
	SessionFactory factory;
	@Autowired
	Mailer mailer;
	@Autowired
	UserDAO dao;
	@Autowired
	SolvedDAO solveDao;

	String code; // code dùng để validation account
	String username; //

	// view cho register
	@RequestMapping("register")
	public String register(ModelMap model) {
		model.addAttribute("user", new User());
		return "register";
	}

	// xử lí register khi bấm nút submit
	@RequestMapping(value = "register", params = "submit")
	public String register(ModelMap model, @ModelAttribute("user") User user, HttpServletRequest request) {
//		test
//		System.out.println(user.getMail());
//		System.out.println(user.getUserName());
//		System.out.println(user.getPassWord());

		dao.setFactory(factory);

		// check username info
		if (dao.isUsernameExist(user.getUserName())) {
			model.addAttribute("messageUsername", "Username has been used.");
			return "register";
		}

		// check mail info
		if (dao.isMailExist(user.getMail())) {
			model.addAttribute("messageMail", "Mail has been used.");
			return "register";
		}

		HttpSession sessionHttp = request.getSession();

		// set validation là false
		user.setValidation(false);
		
		try {
			dao.insert(user);

			// set message là thành công
			model.addAttribute("message", "Register succesed!");

			// lưu lại user cho validation
			sessionHttp.setAttribute("user", user);

			// nếu không xảy ra lỗi thì chuyển qua bước validation
			return "accountValidation";

		} catch (Exception e) {

			// set message thất bại
			model.addAttribute("message", "Register failed!");
		}
		return "register";

		// return v�? validation
	}

	// view xác thực account
	@RequestMapping("accountValidation")
	public String accountValidation() {
		return "accountValidation";
	}

	// xử lí khi bấm nút getcode validation
	@RequestMapping(value = "accountValidation", params = "getcode")
	public String getCodeValidation(ModelMap model, HttpServletRequest request) {

		// lấy session từ request
		HttpSession sessionHttp = request.getSession();

		// lấy user từ session
		User user = (User) sessionHttp.getAttribute("user");

		// khởi tạo 1 code dùng để validation
		code = GenerateRandomCodeValid.generate();
		sessionHttp.setAttribute("code", code);

		model.addAttribute("code", code); // just for test

		// gửi mail
		String subject = "Welcome to wargame PIS, " + user.getUserName()
				+ " . This is validation mail . Not for response.";
		String body = "Your validation code : " + code + " . Please use this code to validate your account.";

		try {
			mailer.send("testdoan123456@gmail.com", user.getMail(), subject, body);
		} catch (Exception e) {
			System.out.println("Có lỗi gửi mail!");
		}

		return "accountValidation";
	}

	// xử lí khi bấm nút để bắt đầu xác thực
	@RequestMapping(value = "accountValidation", params = "validation")
	public String accountValidation(ModelMap model, HttpServletRequest request, @RequestParam("code") String code) {
//		test
//		System.out.println(code);
//		System.out.println(this.code);

		// lấy session request
		HttpSession sessionHttp = request.getSession();
//		System.out.println((String)sessionHttp.getAttribute("code"));
		
		// lấy code từ session
		code = (String) sessionHttp.getAttribute("code");

		// kiểm tra code nhập vào có trùng với code đã được generate không
		if (code.equals(this.code)) {
			
			// get user từ session
			User user = (User) sessionHttp.getAttribute("user");

			// set valid là true (validated)
			user.setValidation(true);
			
			try {
				//update valid cho user
				dao.setFactory(factory);
				dao.update(user);
				model.addAttribute("message", "Register successed, you are ready to login. Welcome to PIS Wargame.");

				// xoá user và code trên session
				sessionHttp.removeAttribute("code");
				sessionHttp.removeAttribute("user");
				
				// nếu đúng hết thì chuyển tới login
				return "login";
			} catch (Exception e) {
				System.out.println("sai o cap nhat valid!"); // for test
			}
		}
		else{
			model.addAttribute("message", "Wrong code, please check again in mail.");
		}
		return "accountValidation";
	}

	// view login
	@RequestMapping("login")
	public String login() {
		return "login";
	}

	// xử lí khi bấm nút login
	@RequestMapping(value = "login", params = "login")
	public String login(ModelMap model, HttpServletRequest request, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		System.out.println(username);
		System.out.println(password);
		
		//gọi session từ request
		HttpSession sessionHttp = request.getSession();
		
		// truy xuất user từ database
		Session session = factory.getCurrentSession();
		String hql = "FROM User WHERE userName= :username AND passWord= :password";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);

		// lấy list user sau khi truy vấn
		User user = (User) query.uniqueResult();
		System.out.println(user); // dùng để check khi cần

		// nếu list rỗng, không tìm thấy thì login sai
		if (user == null) {
			model.addAttribute("message", "Login failed! Wrong username or password");
			return "login";
		}

		// nếu user chưa validation
		if (user.getValidation() == false) {
			//đưa user lên session
			sessionHttp.setAttribute("user", user);
			model.addAttribute("message", "You must validate your account first!");
			return "accountValidation";
		}

		// nếu user đã validation
		if (user.getValidation() == true) {
			// set user đã đăng nhập lên session
			sessionHttp.setAttribute("user", user);
			//set user để cập nhật view
//			sessionHttp.setAttribute("username", user.getUserName());
//			// kiểm tra có phải admin không 
//			if(user.getIsAdmin()) sessionHttp.setAttribute("admin", true);
			System.out.println("đăng nhập thành công!");//test
			//chuyển tới trang chủ
			return "index";
		}
		return "login";
	}

	// view quên mật khẩu
	@RequestMapping("forgetPassword")
	public String forgetPassword() {
		return "forgetPassword";
	}

	// xử lí khi bấm nút submit
	@RequestMapping(value = "forgetPassword", params = "forgetPassword")
	public String forgetPassword(ModelMap model, @RequestParam("mail") String mail) {
		dao.setFactory(factory);
		// nếu không tồn tại user thì tức là thằng này nhập 1 email sai
		// trái
		if (dao.isMailExist(mail)) {
			model.addAttribute("message", "Mail này không tồn tại, vui lòng kiểm tra lại! ");
			return "forgetPassword";
		}
		User user = dao.getUserByMail(mail);
		
		// nếu có , tức là không có sai, thi gui mail gui info ve
		// gửi mail
		String subject = "Welcome back wargame PIS, " + mail + " . This is forget passsword mail . Not for response.";

		String body = "Your infomation here : (Username: " + user.getUserName() + "Password: " + user.getPassWord()
				+ " ). Please use this infomation to login your account.";
		try {
			mailer.send("testdoan123456@gmail.com", mail, subject, body);
			model.addAttribute("message", "Kiểm tra hộp thư mail để nhận thông tin đăng nhập.");
		} catch (Exception e) {
			System.out.println("Có lỗi gửi mail!");
		}
		return "login";
	}

	// xử lí khi bấm đăng xuất
	@RequestMapping("logout")
	public String logout(ModelMap model, HttpServletRequest request) {
		HttpSession sessionHttp = request.getSession();
		sessionHttp.invalidate();
		return "index";
	}

	// view userInfo
	@RequestMapping("userInfo")
	public String userInfo(ModelMap model, HttpServletRequest request) {
		dao.setFactory(factory);
		HttpSession sessionHttp = request.getSession();
		User user = (User) sessionHttp.getAttribute("user");
		System.out.println(user);
		model.addAttribute("user", user);
		model.addAttribute("solves",dao.getListSolved(user.getMail()));
		return "userInfo";
	}
	
	// edit/update info
	@RequestMapping(value = "userInfo", params = "update")
	public String userInfo(ModelMap model, HttpServletRequest request, @ModelAttribute("user") User user,
			@RequestParam("newPassword") String newPassword) {
		HttpSession sessionHttp = request.getSession();

		// lấy user đag lưu ở session
		User currentUser = (User) sessionHttp.getAttribute("user");

		// kiểm tra username có khác không, nếu có thì cập nhật user
		if (!currentUser.getUserName().equals(user.getUserName()))
			currentUser.setUserName(user.getUserName());

		// kiểm tra password có nhập vào mới không ,nếu có thì kiểm tra pass nhập vào
		if (!newPassword.isEmpty())
			currentUser.setPassWord(newPassword);
//		System.out.println(newPassword.isEmpty());
//		System.out.println(currentUser.getUserName());
//		System.out.println(user.getUserName());
//		System.out.println(user.getPassWord());

		// cập nhật currentUser
		dao.setFactory(factory);
		dao.update(currentUser);

		return "userInfo";
	}
	
	@RequestMapping(value="userInfo", params="delete")
	public String deleteAcount(HttpServletRequest request) {
		
		HttpSession sessionHttp = request.getSession();
		User user = (User) sessionHttp.getAttribute("user");
		
		dao.setFactory(factory);
		dao.delete(user);
		sessionHttp.invalidate();
		return "index";
	}
	
}
