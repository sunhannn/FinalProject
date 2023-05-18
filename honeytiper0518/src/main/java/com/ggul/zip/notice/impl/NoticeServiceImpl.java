package com.ggul.zip.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.notice.NoticeService;
import com.ggul.zip.notice.NoticeVO;

	@Service("noticeService")
	public class NoticeServiceImpl implements NoticeService {
	
		@Autowired
		private NoticeDAO mybatis;
			
		@Override
		public void insertNotice(NoticeVO vo) {
			mybatis.insertNotice(vo);
		}

		@Override
		public void updateNotice(NoticeVO vo) {
			mybatis.updateNotice(vo);
		}

		@Override
		public void deleteNotice(NoticeVO vo) {
			mybatis.deleteNotice(vo);
		}
		
		@Override
		public NoticeVO getNotice(NoticeVO vo) {
			return mybatis.getNotice(vo);
		}

		@Override
		public List<NoticeVO> getNoticeList(NoticeVO vo) {
			return mybatis.getNoticeList(vo);
		}
		
		@Override
		public List<NoticeVO> adminNoticeList(NoticeVO vo) {
			return mybatis.adminNoticeList(vo);
		}
	
	
}
