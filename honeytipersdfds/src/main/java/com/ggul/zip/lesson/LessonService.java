package com.ggul.zip.lesson;

import java.util.List;

import com.ggul.zip.escrow.EscrowVO;

public interface LessonService {
	List<LessonVO> getUserLessonList(LessonVO lessonVO);

	List<LessonVO> selectLessonTiper(LessonVO lessonVO);

	List<LessonVO> selectLessonName(LessonVO lessonVO);

	LessonVO selectLessonNum(LessonVO lessonVO);

	int lessonUpdate(LessonVO lessonVO);

	int lessonMake(LessonVO lessonVO);

	int lessonDelete(LessonVO lessonVO);

	int selectLessonfromEscrow(LessonVO lessonVO);

	List<LessonVO> selectTiperInfoPage(LessonVO lessonVO);

	int selectEscrowStatus(LessonVO lessonVO);

	int escrowCheck(LessonVO lessonVO);

	int updateEscrowReportUser(LessonVO lessonVO);

	int escrowCheckDelete(LessonVO lessonVO);

	// 소연누나부분
	LessonVO getLesson(LessonVO vo);

	List<LessonVO> getLessonList(LessonVO vo);

	// 정성현 : 마이페이지
	List<LessonVO> getCompletedLessonList(LessonVO lessonVO);

	List<LessonVO> getPotentialLessonList(LessonVO lessonVO);

	void deleteEscrowLesson(EscrowVO evo);
}
