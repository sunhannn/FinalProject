package com.ggul.zip.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.notice.NoticeVO;


@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//CRUD 기능의 메소드 구현
	// 글 등록
	public void insertNotice(NoticeVO vo) {
		mybatis.insert("NoticeDAO.insertNotice", vo);
	}
	
	//글수정
	public void updateNotice(NoticeVO vo) {
		mybatis.update("NoticeDAO.updateNotice", vo);
	}
	
	//글삭제
	public void deleteNotice(NoticeVO vo) {
		mybatis.delete("NoticeDAO.deleteNotice", vo);
	}
	
	
	public int countNotice() {
		return mybatis.selectOne("NoticeDAO.countNotice");
	}
	
	
	
	//글상세 조회
	public NoticeVO getNotice(NoticeVO vo) {
		mybatis.update("NoticeDAO.countUpNotice", vo);
		return (NoticeVO)mybatis.selectOne("NoticeDAO.getNotice", vo);
	}
	
	
	//글목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo){
		return mybatis.selectList("NoticeDAO.getNoticeList", vo);
	}
	
	//관리자 공지사항 조회
	public List<NoticeVO> adminNoticeList(NoticeVO vo){
		return mybatis.selectList("NoticeDAO.adminNoticeList", vo);
	}
}
