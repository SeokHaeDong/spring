package kr.ync.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ync.domain.BoardVO;
import kr.ync.domain.Criteria;
import kr.ync.domain.PageDTO;
import kr.ync.service.BoardService;
import kr.ync.util.UploadUtils;
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
	
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
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

		log.info("free_board: " + cri);
		
		// 게시판의 글은 지속적으로 등록, 삭제 되기에 매번 list를 호출 할때 total을 구해와야 한다. 
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("free_board", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@GetMapping("/recipe_board")
	public void recipe_board() {
		
	}
	
	@GetMapping("/gallery")
	public void gallery() {
		
	}
	
	@GetMapping({ "/single", "/single_modify" })
	public void single(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/single_modify")
	public String single_modify(MultipartFile[] uploadFile, BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);
		
		int index = 0;
		for (MultipartFile multipartFile : uploadFile) {
			// 실제로 upload된 file이 있을때만 upload 시킨다.
			if (multipartFile.getSize() > 0) {
				switch (index) {
				case 0:
					board.setFile_1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 1:
					board.setFile_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				default:
					board.setFile_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				}
			}
			index++;
		}

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/free_board" + cri.getListLink();
	}
	
	@GetMapping("/free_board_register")
	@PreAuthorize("isAuthenticated()")
	public void free_board_register(){
		
	}
	
	@PostMapping("/free_board_register")
	public String free_board_register(MultipartFile[] uploadFile, BoardVO board, RedirectAttributes rttr) {
		
		int index = 0;
		for (MultipartFile multipartFile : uploadFile) {
			if(multipartFile.getSize() > 0) {
				switch (index) {
				case 0:
					board.setFile_1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 1:
					board.setFile_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				default:
					board.setFile_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				}
			}
			index++;
		}
		
		log.info("register: " + board);

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/free_board";
	}


	
}
