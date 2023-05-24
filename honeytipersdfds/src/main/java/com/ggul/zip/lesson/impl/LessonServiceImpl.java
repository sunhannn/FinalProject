package com.ggul.zip.lesson.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {
	@Autowired
	private LessonDAO lessonDAO;

	@Override
	public List<LessonVO> getUserLessonList(LessonVO lessonVO) {
		return lessonDAO.getUserLessonList(lessonVO);
	}

	@Override
	public List<LessonVO> selectLessonTiper(LessonVO lessonVO) {

		return lessonDAO.selectselectLessonTiper(lessonVO);
	}

	@Override
	public List<LessonVO> selectLessonName(LessonVO lessonVO) {
		return lessonDAO.selectLessonName(lessonVO);
	}

	@Override
	public LessonVO selectLessonNum(LessonVO lessonVO) {

		return lessonDAO.selectLessonNum(lessonVO);
	}

	@Override
	public int lessonUpdate(LessonVO lessonVO) {
		return lessonDAO.lessonUpdate(lessonVO);
	}

	@Override
	public int lessonMake(LessonVO lessonVO) {
		return lessonDAO.lessonMake(lessonVO);
	}

	@Override
	public int selectLessonfromEscrow(LessonVO lessonVO) {
		return lessonDAO.selectLessonfromEscrow(lessonVO);
	}

	@Override
	public int lessonDelete(LessonVO lessonVO) {
		return lessonDAO.lessonDelete(lessonVO);
	}

	@Override
	public List<LessonVO> selectTiperInfoPage(LessonVO lessonVO) {
		return lessonDAO.selectTiperInfoPage(lessonVO);
	}

	@Override
	public int selectEscrowStatus(LessonVO lessonVO) {
		return lessonDAO.selectEscrowStatus(lessonVO);
	}

	@Override
	public int escrowCheck(LessonVO lessonVO) {
		return lessonDAO.escrowCheck(lessonVO);
	}

	@Override
	public int updateEscrowReportUser(LessonVO lessonVO) {
		return lessonDAO.updateEscrowReportUser(lessonVO);
	}

	@Override
	public int escrowCheckDelete(LessonVO lessonVO) {
		return lessonDAO.escrowCheckDelete(lessonVO);
	}

	// 소연누나부분
	@Override
	public LessonVO getLesson(LessonVO vo) {
		return lessonDAO.getLesson(vo);
	}

	@Override
	public List<LessonVO> getLessonList(LessonVO vo) {
		return lessonDAO.getLessonList(vo);
	}

	// 정성현 : 마이페이지
	@Override
	public List<LessonVO> getCompletedLessonList(LessonVO vo) {
		return lessonDAO.getCompletedLessonList(vo);
	}

	@Override
	public List<LessonVO> getPotentialLessonList(LessonVO vo) {
		return lessonDAO.getPotentialLessonList(vo);
	}

	@Override
	public void deleteEscrowLesson(EscrowVO evo) {
		lessonDAO.deleteEscrowLesson(evo);
	}
}
