package com.pj.ptsd.notice.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.notice.domain.Notice;
import com.pj.ptsd.notice.store.NoticeStore;
@Repository
public class NoticeStoreLogic implements NoticeStore{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지 전체 조회
	@Override
	public List<Notice> selectAllNotice() {
		List<Notice> nList = sqlSession.selectList("noticeMapper.selectNoticeList");
		
		return nList;
	}
	//공지 상세 조회
		@Override
		public Notice selectOneNotice(int noticeNo) {
			Notice notice = sqlSession.selectOne("noticeMapper.selectOneNotice", noticeNo);
			return notice;
		}
	//공지 등록
	@Override
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("noticeMapper.insertNotice", notice);
		return result;
	}
	// 공지 수정
	@Override
	public int updateNotice(Notice notice) {
		int result = sqlSession.update("noticeMapper.updateNotice", notice);
		return result;
		
	}
	// 공지 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		int result = sqlSession.delete("noticeMapper.deleteNotice", noticeNo);
		return result;
	}
	

}
