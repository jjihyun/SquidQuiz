package com.pj.ptsd.notice.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.ptsd.notice.domain.Notice;
import com.pj.ptsd.notice.service.NoticeService;
import com.pj.ptsd.notice.store.NoticeStore;
@Service
public class NoticeServiceImpl implements NoticeService {
		@Autowired
		private NoticeStore store ;
		
		//공지 조회
		@Override
		public List<Notice> printAllNotice() {
			List<Notice> nList = store.selectAllNotice();
			return nList;
		}
		//공지 상세 조회
		@Override
		public Notice printOneNotice(int noticeNo) {
			Notice notice = store.selectOneNotice(noticeNo);
			return notice;
		}
		
		//공지 작성
		@Override
		public int registerNotice(Notice notice) {
			int result = store.insertNotice(notice);
			return result;
		}
		//공지 수정
		@Override
		public int modifyNotice(Notice notice) {
			int result = store.updateNotice(notice);
			return result;
		}
		//공지 삭제
		@Override
		public int removeNotice(int NoticeNo) {
			int result = store.deleteNotice(NoticeNo);
			return result;
		}
		

		
		
}
