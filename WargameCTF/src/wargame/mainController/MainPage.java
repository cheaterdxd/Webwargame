package wargame.mainController;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainPage {
	
	@RequestMapping("index")
	public String index(HttpServletRequest request) {
		return "index";
	}
}
