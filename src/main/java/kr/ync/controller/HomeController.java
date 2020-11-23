package kr.ync.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ync.domain.Criteria;
import kr.ync.domain.PageDTO;
import kr.ync.service.BoardService;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/*")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/*")
	public String home() {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "/home";
	}
	
	@GetMapping("/about")
	public void about() {
		
	}
	

	@GetMapping("/free_board")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		
		// 게시판의 글은 지속적으로 등록, 삭제 되기에 매번 list를 호출 할때 total을 구해와야 한다. 
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@GetMapping("/recipe_board")
	public void recipe_board() {
		
	}
	
	@GetMapping("/gallery")
	public void gallery() {
		
	}
	
	@GetMapping("/single")
	public void single() {
		
	}


	
}
