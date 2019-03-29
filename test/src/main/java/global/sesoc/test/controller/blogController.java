package global.sesoc.test.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class blogController {
	
	private static final Logger logger = LoggerFactory.getLogger(blogController.class);
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("블로그 진입");
		
		return "blog";
	}
}
