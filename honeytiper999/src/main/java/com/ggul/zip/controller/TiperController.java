package com.ggul.zip.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.payment.PointService;
import com.ggul.zip.payment.PointVO;
import com.ggul.zip.review.ReviewService;
import com.ggul.zip.review.ReviewVO;
import com.ggul.zip.tiper.TiperService;
import com.ggul.zip.tiper.TiperVO;
import com.ggul.zip.user.UserService;
import com.ggul.zip.user.UserVO;

@Controller
public class TiperController {

	@Autowired
	private UserService userService;

	@Autowired
	private TiperService tiperService;

	@Autowired
	private LessonService lessonService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private PointService pointService;

//	@Autowired
//	private EscrowService escrowService;
	// 상현이부분

	// 강사 마이페이지 이동
	@RequestMapping(value = "/tiperMypage")
	public String tiperMypage(HttpServletRequest request, HttpSession session, UserVO vo, TiperVO tiperVO,
			LessonVO lessonVO) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		vo.setUser_id((String) session.getAttribute("user_id"));
		vo.setUser_point(userService.pointSelect(vo));
		session.setAttribute("user_point", vo.getUser_point());
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		lessonVO.setLesson_tiper_code(tiperVO.getTiper_code());
		request.setAttribute("lessonTiper", lessonService.selectLessonTiper(lessonVO));

		return "tiper/tiperMypage";

	}

	// 허니페이 정산창 이동
	@RequestMapping(value = "/honeyTake")
	public String honeyTake() {
		return "tiper/tiperHoneyTake";

	}

	// 강사 정보 수정 페이지 이동
	@RequestMapping(value = "/tiperUpdateGo")
	public String tiperUpdateGo(HttpServletRequest request, HttpSession session, LessonVO lessonVO, TiperVO tiperVO,
			UserVO vo) {
		String userId = (String) session.getAttribute("user_id");
		vo.setUser_id(userId);
		vo = userService.selectName(vo);
		System.out.println(vo.getUser_name());
		request.setAttribute("user_name", vo.getUser_name());
		tiperVO.setTiper_user_id(userId);
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		lessonVO.setLesson_tiper_code(tiperVO.getTiper_code());
		request.setAttribute("lessonTiper", lessonService.selectLessonName(lessonVO));
		return "tiper/tiperInfoUpdate";

	}

	// 강의 정보 수정 페이지 이동
	@RequestMapping(value = "/lessonUpdateGo")
	public String lessonUpdateGo(HttpServletRequest request, HttpSession session, LessonVO lessonVO) {
		lessonVO.setLesson_num(Integer.parseInt(request.getParameter("lesson_num")));
		lessonVO = lessonService.selectLessonNum(lessonVO);
		request.setAttribute("lesson", lessonVO);
		return "tiper/tiperLessonUpdate";

	}

	// 강의 등록 페이지 이동
	@RequestMapping(value = "/lessonMakeGo")
	public String lessonMakeGO(HttpServletRequest request, HttpSession session, TiperVO tiperVO) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		System.out.println(tiperVO.getTiper_cate1());
		request.setAttribute("tiperGo", tiperVO);
		return "tiper/tiperLessonMake";
	}

	// 유저 마이페이지 이동

	@RequestMapping(value = "/userMyPageGo")
	public String myPageGo(HttpServletRequest request, HttpSession session, UserVO vo, LessonVO lessonVO,
			TiperVO tiperVO) {
		vo.setUser_id((String) session.getAttribute("user_id"));
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		vo.setUser_point(userService.pointSelect(vo));
		session.setAttribute("user_point", vo.getUser_point());
		request.setAttribute("myTiper", tiperVO);
		lessonVO.setLesson_info((String) session.getAttribute("user_id"));
		request.setAttribute("lessonList", lessonService.getUserLessonList(lessonVO));
		return "user/userMyPage";

	}

	// 회원 탈퇴
	@RequestMapping(value = "/userDeleteAction")
	public String userDeleteAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, UserVO vo) {
		String userId = (String) session.getAttribute("user_id");
		vo.setUser_id(userId);
		userService.delUser(vo);
		session.invalidate();
		return "index";
	}

	// 회원 정보 수정하기
	@RequestMapping(value = "/userUpdateAction")
	public String userUpdateAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, UserVO vo) {
		String userId = (String) session.getAttribute("user_id");
		vo.setUser_id(userId);
		userService.updateUser(vo);
		return "redirect:userMyPageGo";
	}

	// 회원정보수정 페이지 이동
	@RequestMapping(value = "/userUpdateGo")
	public String userUpdateGo(HttpSession session, UserVO vo, Model model) {
		vo.setUser_id((String) session.getAttribute("user_id"));
		vo = userService.selectName(vo);
		System.out.println(vo.getUser_cate());
		model.addAttribute("userVO", vo);
		return "user/userInfoUpdate";
	}

	// 강사 정보 수정 액션
	@RequestMapping(value = "/tiperUpdateAction")
	public String tiperUpdateAction(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			TiperVO tiperVO) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		tiperService.tiperUpdate(tiperVO);
		return "redirect:userMyPageGo";
	}

	// 강사신청 액션
	@RequestMapping(value = "/tiperSignUp")
	public String tiperSignUp(HttpServletRequest req, HttpServletResponse res, HttpSession session, UserVO vo,
			TiperVO tiperVO) {
		String userId = (String) session.getAttribute("user_id");
		tiperVO.setTiper_user_id(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar c1 = Calendar.getInstance();
		Date d = (Date) c1.getTime();
		String strToday = sdf.format(d);
		tiperVO.setTiper_date(strToday);
		System.out.println(tiperVO.getTiper_img());
		tiperService.insertTiper(tiperVO);
		return "redirect:userMyPageGo";
	}

	// 강의 정보 수정 액션
	@RequestMapping(value = "/lessonUpdateAction")
	public String lessonUpdateAction(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			LessonVO lessonVO) {
		int lessonNum = Integer.parseInt(req.getParameter("lessonNum"));
		lessonVO.setLesson_num(lessonNum);
		lessonService.lessonUpdate(lessonVO);
		return "user/userMyPage";
	}

	// 강의 등록 액션
	@RequestMapping(value = "/lessonMakeAction")
	public String lessonMakeAction(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			TiperVO tiperVO, LessonVO lessonVO) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		lessonVO.setLesson_tiper_code(tiperVO.getTiper_code());
		lessonService.lessonMake(lessonVO);
		return "user/userMyPage";
	}

	// 리뷰 작성 액션
	@ResponseBody
	@RequestMapping(value = "/reviewAction")
	public String reviewAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, LessonVO lessonVO,
			ReviewVO reviewVO) {
		String message = "";
		reviewVO.setReview_writer((String) session.getAttribute("user_id"));
		System.out.println(reviewVO.getReview_lesson_num());
		reviewService.ReviewInsert(reviewVO);
		message = "<script>location.href='userMyPageGo';</script>";
		return message;
	}

	// 메인페이지에서 마이허니페이버튼클릭시 리스트보여주는페이지로 이동
	@RequestMapping(value = "/goMyHoneypay")
	public String getPointListPost(PointVO vo, Model model, HttpSession session) {
		// 세션아이디 받아와서 포인트vo에 담아놓음
		String id = (String) session.getAttribute("user_id");
		vo.setPoint_id(id);
		List<PointVO> pointList = pointService.getPointList(vo);
		// point테이블 불러오기
		model.addAttribute("pointList", pointList);
		// user테이블 user포인트 불러오기
		model.addAttribute("totalPoint", pointService.callTotalPoint(vo));
		return "user/pointInfo";
	}

	// 리스트페이지에서 허니페이충전 버튼눌러서 충전페이지로 이동
	@RequestMapping(value = "/goPointCharge")
	public String goChargePage(PointVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("user_id");
		vo.setPoint_id(id);
		return "user/goPointCharge";
	}

	// 충전금액설정후 충전버튼클릭시 결제하면서 데이터베이스에넣는 컨트롤러 결제완료시 리스트보여줌
	@RequestMapping(value = "/insertPoint")
	public String insertPoint(PointVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("user_id");
		vo.setPoint_id(id);
		// point테이블 포인트인서트
		pointService.insertPoint(vo);
		// users테이블 유저포인트 총토탈포인트 업데이트
		pointService.updateUserPoint(vo);
		return "goMyHoneypay";
	}

	// 파일 업로드
	@PostMapping("/upload")
	public ResponseEntity<String> uploadFile(@RequestParam("tiper_img") MultipartFile file, Model model) {
		// 파일 저장
		try {
			String fileName = file.getOriginalFilename();
			model.addAttribute("filename", fileName);
			String savePath = "C:\\Springwork\\honeytiper999\\src\\main\\webapp\\resources\\img\\";
			String filePath = savePath + fileName;
			model.addAttribute("filename", fileName);
			File saveDir = new File(savePath);
			if (!saveDir.exists()) {
				saveDir.mkdirs();
			}

			File saveFile = new File(filePath);
			file.transferTo(saveFile);
			System.out.println(fileName);
			return ResponseEntity.ok().body("File uploaded successfully");
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload file");
		}
	}

}
