package com.ggul.zip.notice;

import java.util.List;

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
}
