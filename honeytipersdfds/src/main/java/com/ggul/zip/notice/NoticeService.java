package com.ggul.zip.notice;

import java.util.List;

import com.ggul.zip.user.UserVO;

public interface NoticeService {
	//글등록
	void insertNotice(NoticeVO vo);

	//글수정
	void updateNotice(NoticeVO vo);

	//글삭제
	void deleteNotice(NoticeVO vo);
	
	//글상세 조회
	NoticeVO getNotice(NoticeVO vo);

	//글목록 조회
	List<NoticeVO> getNoticeList(NoticeVO vo);
	
	//관리자 공지사항 조회
	public List<NoticeVO> adminNoticeList(NoticeVO vo);
	
}
