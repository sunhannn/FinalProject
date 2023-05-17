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
		return mybatis.update("lessonDAO.lessonUpdate", lessonVO);
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

	// 소연누나부분
	// 강의상세 조회
	public LessonVO getLesson(LessonVO vo) {
//		mybatis.update("lessonDAO.LessonCountUp", vo);
		return mybatis.selectOne("lessonDAO.getLesson", vo);
	}

	// 강의목록 조회
	public List<LessonVO> getLessonList(LessonVO vo) {
		return mybatis.selectList("lessonDAO.getLessonList", vo);
	}

	// 강의정보 검색
	public List<LessonVO> getLessonListPostSearch(HashMap<String, Object> map) {
		return mybatis.selectList("lessonDAO.getLessonListPostSearch", map);
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
