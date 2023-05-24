package com.ggul.zip.lesson.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonVO;

@Repository
public class LessonDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	// 상현이부분
	List<LessonVO> selectselectLessonTiper(LessonVO lessonVO) {
		return mybatis.selectList("lessonDAO.selectLessonTiper", lessonVO);
	}

	List<LessonVO> selectLessonName(LessonVO lessonVO) {
		return mybatis.selectList("lessonDAO.selectLessonName", lessonVO);
	}

	LessonVO selectLessonNum(LessonVO lessonVO) {
		return mybatis.selectOne("lessonDAO.selectLessonNum", lessonVO);
	}

	int lessonUpdate(LessonVO lessonVO) {
		if (lessonVO.getLesson_img() == "") {
			return mybatis.update("lessonDAO.lessonUpdateNoimg", lessonVO);
		} else {
			return mybatis.update("lessonDAO.lessonUpdate", lessonVO);
		}
	}

	int lessonMake(LessonVO lessonVO) {
		return mybatis.insert("lessonDAO.makeLesson", lessonVO);
	}

	int lessonDelete(LessonVO lessonVO) {
		return mybatis.delete("lessonDAO.lessonDelete", lessonVO);

	}

	int selectLessonfromEscrow(LessonVO lessonVO) {
		return mybatis.selectOne("lessonDAO.selectLessonfromEscrow", lessonVO);

	}

	List<LessonVO> selectTiperInfoPage(LessonVO lessonVO) {

		return mybatis.selectList("lessonDAO.selectTiperInfoPage", lessonVO);

	}

	int selectEscrowStatus(LessonVO lessonVO) {

		return mybatis.selectOne("lessonDAO.selectEscrowStatus", lessonVO);

	}

	int escrowCheck(LessonVO lessonVO) {

		return mybatis.selectOne("lessonDAO.escrowCheck", lessonVO);

	}

	int updateEscrowReportUser(LessonVO lessonVO) {

		return mybatis.update("lessonDAO.updateEscrowReportUser", lessonVO);
	}

	int escrowCheckDelete(LessonVO lessonVO) {

		return mybatis.selectOne("lessonDAO.escrowCheckDelete", lessonVO);

	}

	// 소연누나부분
	// 강의상세 조회
	public LessonVO getLesson(LessonVO vo) {
		return mybatis.selectOne("lessonDAO.getLesson", vo);
	}

	// 강의목록
	public List<LessonVO> getLessonList(LessonVO vo) {
		return mybatis.selectList("lessonDAO.getLessonList", vo);
	}

	// 강의 삭제
	public void deleteLesson(LessonVO vo) {
		mybatis.delete("lessonDAO.deleteLesson", vo);
	}

	// 강의 삭제
	public void deleteReview(LessonVO vo) {
		mybatis.delete("lessonDAO.deleteReview", vo);
	}

	// 정성현: 마이페이지
	// 마이페이지 : 완료된 강의 내역
	public List<LessonVO> getUserLessonList(LessonVO lessonVO) {
		return mybatis.selectList("lessonDAO.getUserLessonList", lessonVO);
	}

	public List<LessonVO> getCompletedLessonList(LessonVO vo) {
		return mybatis.selectList("lessonDAO.getCompletedLessonList", vo);
	}

	public List<LessonVO> getPotentialLessonList(LessonVO vo) {
		return mybatis.selectList("lessonDAO.getPotentialLessonList", vo);
	}

	public void deleteEscrowLesson(EscrowVO evo) {
		mybatis.delete("lessonDAO.deleteEscrowLesson", evo);
	}

}
