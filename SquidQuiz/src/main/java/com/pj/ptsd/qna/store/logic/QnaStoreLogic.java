package com.pj.ptsd.qna.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.qna.domain.PageInfo;
import com.pj.ptsd.qna.domain.Qna;
import com.pj.ptsd.qna.store.QnaStore;

@Repository
public class QnaStoreLogic implements QnaStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//전체조회
	@Override
	public List<Qna> selectAllQna(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Qna> qList = sqlSession.selectList("qnaMapper.selectQnaList", pi, rowBounds);
		return qList;
	}
	//상세조회
	@Override
	public Qna selectOneQna(int qnaNo) {
		Qna qna = sqlSession.selectOne("qnaMapper.selectOneQna", qnaNo);
		return qna;
	}
	//작성
	@Override
	public int insertQna(Qna qna) {
		int result = sqlSession.insert("qnaMapper.insertQna", qna);
		return result;
	}
	//삭제
	@Override
	public int deleteQna(int qnaNo) {
		int result = sqlSession.delete("qnaMapper.deleteQna", qnaNo);
		return result;
	}
	//답변
	@Override
	public int updateAnswer(Qna qna) {
		int result = sqlSession.update("qnaMapper.updateAnswer", qna);
		return result;
	}
	//개수 조회
	@Override
	public int selectListCount() {
		int result = sqlSession.selectOne("qnaMapper.selectListCount");
		return result;
	}
	//리스트조회(회원)
	@Override
	public List<Qna> selectQnaById(PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Qna> qList = sqlSession.selectList("qnaMapper.selectQnaById",userNo, rowBounds);
		return qList;
	}
	//회원이 작성한 게시글 개수 조회
	@Override
	public int selectOwnListCount(int userNo) {
		int result = sqlSession.selectOne("qnaMapper.selectOwnListCount",userNo);
		return result;
	}

}
