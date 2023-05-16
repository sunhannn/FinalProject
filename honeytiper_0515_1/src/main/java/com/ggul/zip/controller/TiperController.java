package com.ggul.zip.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ggul.zip.escrow.EscrowService;
import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.lesson.ReviewVO;
import com.ggul.zip.payment.PointService;
import com.ggul.zip.payment.PointVO;
import com.ggul.zip.review.ReviewService;
import com.ggul.zip.tiper.TiperService;
import com.ggul.zip.tiper.TiperVO;
import com.ggul.zip.user.ReportVO;
import com.ggul.zip.user.UserService;
import com.ggul.zip.user.UserVO;
import com.google.gson.Gson;

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

	@Autowired
	private EscrowService escrowService;

	@Autowired
	private ServletContext servletContext;

	// 상현이부분

	// 강사 마이페이지 이동
	// 강사 마이페이지 이동
	@RequestMapping(value = "/tiperMypage")
	public String tiperMypage(Model model, HttpSession session, UserVO vo, TiperVO tiperVO, LessonVO lessonVO) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		vo.setUser_id((String) session.getAttribute("user_id"));
		vo.setUser_point(userService.pointSelect(vo));
		model.addAttribute("user_point", vo.getUser_point());
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		model.addAttribute("tiperVO", tiperVO);
		lessonVO.setLesson_tiper_code(tiperVO.getTiper_code());
		model.addAttribute("lessonTiper", lessonService.selectLessonTiper(lessonVO));
		return "tiper/tiperMypage";
	}

	// 허니페이 정산창 이동
	@RequestMapping(value = "/honeyTake")
	public String honeyTake() {
		return "tiper/tiperHoneyTake";

	}

	// 강사 정보 수정 페이지 이동
	@RequestMapping(value = "/tiperUpdateGo")
	public String tiperUpdateGo(Model model, HttpSession session, LessonVO lessonVO, TiperVO tiperVO, UserVO vo) {
		String userId = (String) session.getAttribute("user_id");
		vo.setUser_id(userId);
		vo = userService.selectName(vo);
		model.addAttribute("user_name", vo.getUser_name());
		tiperVO.setTiper_user_id(userId);
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		model.addAttribute("tiperVO", tiperVO);
		lessonVO.setLesson_tiper_code(tiperVO.getTiper_code());
		model.addAttribute("lessonTiper", lessonService.selectLessonName(lessonVO));
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
		int check = userService.updateUser(vo);
		session.setAttribute("user_id", vo.getUser_id());
		return "user/userMyPage";
	}

	// 회원정보수정 페이지 이동
	@RequestMapping(value = "/userUpdateGo")
	public String userUpdateGo() {
		return "user/userInfoUpdate";
	}

	// 강사신청 액션
	@ResponseBody
	@RequestMapping(value = "/tiperSignUp")
	public String tiperSignUp(HttpServletRequest req, HttpServletResponse res, HttpSession session, UserVO vo,
			TiperVO tiperVO) {
		String msg = "";
		String userId = (String) session.getAttribute("user_id");
		tiperVO.setTiper_user_id(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());
		tiperVO.setTiper_date(strToday);
		System.out.println(tiperVO.getTiper_img());
		tiperService.insertTiper(tiperVO);
		msg = "<script>location.href='userMyPageGo';</script>";
		return msg;
	}

	// 포인트 정산 액션(수정함~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~)
	@RequestMapping(value = "/honeyTakeAction")
	public String honeyTakeAction(Model model, HttpServletResponse response, HttpSession session, UserVO vo,
			PointVO pointVO) throws IOException {
		String userId = (String) session.getAttribute("user_id");
		vo.setUser_id(userId);
		vo = userService.selectName(vo);
		pointVO.setPoint_price(vo.getUser_point());
		vo.setUser_point(userService.pointSelect(vo));
		if (vo.getUser_point() == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('정산받을 포인트가 없습니다!'); history.back();</script>");
			writer.flush();
		}
		pointVO.setPoint_id(userId);
		pointService.honeyTakePoint(pointVO);
		userService.pointTake(vo);
		return "redirect:tiperMypage";
	}

	// 강사 정보 수정 액션(수정함~~~~~~~~~~~~~~~~~~~~~~~~~~)
	@RequestMapping(value = "/tiperUpdateAction")
	public String tiperUpdateAction(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			TiperVO tiperVO) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		tiperService.tiperUpdate(tiperVO);
		return "redirect:tiperMypage";
	}

	// 강의 정보 수정 액션(수정함~~~~~~~~~~~~~~~~~~~)
	@RequestMapping(value = "/lessonUpdateAction")
	public String lessonUpdateAction(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			LessonVO lessonVO) {
		int lessonNum = Integer.parseInt(req.getParameter("lessonNum"));
		lessonVO.setLesson_num(lessonNum);
		lessonService.lessonUpdate(lessonVO);
		return "redirect:tiperMypage";
	}

	// 강의 등록 액션
	@RequestMapping(value = "/lessonMakeAction")
	public String lessonMakeAction(HttpSession session, TiperVO tiperVO, LessonVO lessonVO, UserVO vo) {
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		vo.setUser_id((String) session.getAttribute("user_id"));
		vo = userService.selectName(vo);
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		lessonVO.setLesson_tiper_code(tiperVO.getTiper_code());
		lessonVO.setLesson_user_name(vo.getUser_name());
		lessonService.lessonMake(lessonVO);
		return "redirect:tiperMypage";
	}

//----------------------보영 5/15수정--------------------------------------
	// 토탈포인트 가져오기
	@RequestMapping(value = "/goMyHoneypay")
	public String getTotalPoint(PointVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("user_id");
		vo.setPoint_id(id);
		model.addAttribute("totalPoint", pointService.callTotalPoint(vo));

		return "user/pointInfo";
	}

	// 포인트리스트 가져오기 날짜별,키워드검색도가능
	@RequestMapping(value = "/callHoneypayList", method = RequestMethod.POST)
	@ResponseBody
	public List<PointVO> getPointListPost(PointVO vo, HttpSession session, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("search_condition") String search_condition,
			@RequestParam(value = "search_keyword", required = false) String search_keyword,
			@RequestParam(value = "price_type", defaultValue = "all") String price_type) {
		String id = (String) session.getAttribute("user_id");
		vo.setPoint_id(id);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setSearch_condition(search_condition);
		vo.setSearch_keyword(search_keyword);
		vo.setPrice_type(price_type);
		List<PointVO> pointList = pointService.getPointList(vo);
		if (price_type.equals("negative")) {
			// -일 때의 검색 결과
			pointList = filterByNegativePrice(pointList);
		} else if (price_type.equals("non-negative")) {
			// -가 아닐 때의 검색 결과
			pointList = filterByNonNegativePrice(pointList);
		}
		return pointList;
	}

	private List<PointVO> filterByNegativePrice(List<PointVO> pointList) {
		List<PointVO> filteredList = new ArrayList<>();

		for (PointVO point : pointList) {
			if (point.getPoint_price() < 0) {
				filteredList.add(point);
			}
		}
		return filteredList;
	}

	private List<PointVO> filterByNonNegativePrice(List<PointVO> pointList) {
		List<PointVO> filteredList = new ArrayList<>();

		for (PointVO point : pointList) {
			if (point.getPoint_price() >= 0) {
				filteredList.add(point);
			}
		}
		return filteredList;
	}

	// 리스트페이지에서 허니페이충전 버튼눌러서 충전페이지로 이동
	@RequestMapping(value = "/goPointCharge")
	public String goChargePage(PointVO vo, Model model, HttpSession session) {
		String id = (String) session.getAttribute("user_id");
		vo.setPoint_id(id);
		model.addAttribute("totalPoint", pointService.callTotalPoint(vo));
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

	@RequestMapping(value = "/callEscrowList", method = RequestMethod.GET)
	public String getEscrowList() {
		return "escrow/escrowList";
	}

	@RequestMapping(value = "/callEscrowList", method = RequestMethod.POST)
	@ResponseBody
	public List<EscrowVO> getEscrowList(EscrowVO vo) {
		return escrowService.getEscrowList(vo);
	}

	@RequestMapping(value = "/callEscrowListByStatus", method = RequestMethod.POST)
	@ResponseBody
	public List<EscrowVO> getEscrowListByStatus(EscrowVO vo) {
		System.out.println("status: " + vo);
		return escrowService.getEscrowListByStatus(vo);
	}

	// 정성현 : 마이페이지 ==================================

	// 강사 마이페이지 : 강의신고 - 중복된 신고 있는지 확인 후 신고.
	@RequestMapping(value = "/tiperReportLessonNum", method = RequestMethod.POST)
	public void tiperReportLessonNum(ReportVO vo, HttpServletResponse response) throws Exception {
		int result = userService.isDupReport(vo);
		if (result == 0) {
			userService.reportLessonNum(vo);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println(
					"<script type='text/javascript'>alert('신고가 접수되었습니다.');location.href='/tiperMypage';</script>");
			writer.flush();
		} else if (result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println(
					"<script type='text/javascript'>alert('이미 신고한 강의입니다.');location.href='/tiperMypage';</script>");
			writer.flush();
		}
	}

	// 파일 업로드 (수정함~~~~~~~~~~~~~~~~~~~~~~~~~)
	@PostMapping("/upload")
	public ResponseEntity<String> uploadFile(@RequestParam("tiper_img") MultipartFile file, Model model) {
		// 파일 저장
		try {
			String fileName = file.getOriginalFilename();
			model.addAttribute("filename", fileName);
			String savePath = "C:/Springwork/honeytiper/src/main/webapp/resources/img/";
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

	// 마이페이지 : 강의신고 - 같은 학생-강의 간 중복된 신고 있는지 확인 후 신고.
	@RequestMapping(value = "/reportLessonNum", method = RequestMethod.POST)
	public void reportLessonNum(ReportVO vo, HttpServletResponse response) throws Exception {

		int result = userService.isDupReport(vo); // 0 일 때 : 중복신고 없음, 1 일 때 이미 신고된 내용 있음.
		if (result == 0) {
			userService.reportLessonNum(vo);
		} else if (result == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println(
					"<script type='text/javascript'>alert('이미 신고한 강의입니다.');location.href='/userMyPageGo';</script>");
			writer.flush();
		}
	}

	// 리뷰 작성 액션
	@ResponseBody
	@RequestMapping(value = "/reviewAction")
	public String reviewAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, LessonVO lessonVO,
			ReviewVO reviewVO, EscrowVO escrowVO) {
		String message = "";
		reviewVO.setReview_writer((String) session.getAttribute("user_id"));
		System.out.println(reviewVO.getReview_lesson_num());
		reviewService.reviewInsert(reviewVO);
		escrowService.updateEscrowStatus12(escrowVO);
		message = "<script>location.href='userMyPageGo';</script>";
		return message;
	}

	// 유저 마이페이지 이동
	@RequestMapping(value = "/userMyPageGo")
	public String myPageGo(HttpServletRequest request, Model model, HttpSession session, UserVO vo, LessonVO lessonVO,
			TiperVO tiperVO) {
		vo.setUser_id((String) session.getAttribute("user_id"));
		tiperVO.setTiper_user_id((String) session.getAttribute("user_id"));
		tiperVO = tiperService.selectTiperInfo(tiperVO);
		vo.setUser_point(userService.pointSelect(vo));
		session.setAttribute("user_point", vo.getUser_point());
		request.setAttribute("myTiper", tiperVO);

		lessonVO.setLesson_info((String) session.getAttribute("user_id"));
		request.setAttribute("lessonList", lessonService.getUserLessonList(lessonVO));

		String lessonListJSON = new Gson().toJson(lessonService.getUserLessonList(lessonVO));
		request.setAttribute("lessonListJSON", lessonListJSON);

		String completedLessonListJSON = new Gson().toJson(lessonService.getCompletedLessonList(lessonVO));
		request.setAttribute("completedListJSON", completedLessonListJSON);

		model.addAttribute("info", userService.getUserInfoMypage(vo));

		return "user/userMyPage";
	}
}
