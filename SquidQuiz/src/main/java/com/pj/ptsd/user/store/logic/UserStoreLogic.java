package com.pj.ptsd.user.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.user.domain.Search;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.quiz.domain.Participant;
import com.pj.ptsd.user.domain.PageInfo;
import com.pj.ptsd.user.domain.User;
import com.pj.ptsd.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public User selectMember(User userOne) {
		User uOne = sqlSession.selectOne("userMapper.selectLoginUser", userOne);
		return uOne;
	}

	@Override
	public int checkIdDup(String userId) {
		int result = sqlSession.selectOne("userMapper.checkIdDup", userId);
		return result;
	}

	@Override
	public String findId(User userOne) {
		String uOne = sqlSession.selectOne("userMapper.findUserId", userOne);
		return uOne;
	}
	
	@Override
	public String findPwd(User userOne) {
		String uOne = sqlSession.selectOne("userMapper.findUserPwd", userOne);
		return uOne;
	}
	
	@Override
	public int insertMember(User user) {
		int result = sqlSession.insert("userMapper.insertUser", user);
		return result;
	}

	@Override
	public int updateMember(User user) {
		int result = sqlSession.update("userMapper.updateUser", user);
		return result;
	}

	@Override
	public int deleteMember(User user) {
		int result = sqlSession.delete("userMapper.deleteUser",user);
		return result;
	}



	@Override
	public User selectOne(String uId) {
		User user = sqlSession.selectOne("userMapper.selectOnePoint", uId);
		return user;
	}


	@Override
	public List<CampaignRecord> selectCRList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<CampaignRecord> cList = sqlSession.selectList("userMapper.selectMypageDonate", userId, rowBounds);
		return cList;
	}
	//??????????????? ????????????
	@Override
	public List<CampaignRecord> selectSearchAll(PageInfo pi,Map<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<CampaignRecord> searchList = sqlSession.selectList("userMapper.selectSearchList", map, rowBounds);
		return searchList;
	}
	
	//????????? ??? ??????
	@Override
	public int selectCListCount(String userId) {
		int result = sqlSession.selectOne("userMapper.selectCListCount", userId);
		return result;
	}
	
	//????????? ?????? ??? ??????
	public int selectCCount(String userId) {
		int result = sqlSession.selectOne("userMapper.selectCCount", userId);
		return result;
	}
	
	
	@Override
	public List<Board> selectBoardList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Board> bList = sqlSession.selectList("userMapper.selectBoard", userId, rowBounds);
		return bList;
	}

	//??????????????? ??????
	@Override
	public Board selectbOne(int bNo) {
		Board board = sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
		return board;
	}
	
	//??????????????? ??? ??????
	@Override
	public int selectBListCount(String userId) {
		int result = sqlSession.selectOne("userMapper.selectBListCount", userId);
		return result;
	}

	@Override
	public List<Participant> selectQList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Participant> qList = sqlSession.selectList("userMapper.selectQuizList", userId, rowBounds);
		return qList;
	}

	//???????????? ??? ??????
	@Override
	public int selectQListCount(String userId) {
		int result = sqlSession.selectOne("userMapper.selectQListCount", userId);
		return result;
	}
	
	//?????? ?????? ??? ??????
	public int selectQCount(String userId) {
		int result = sqlSession.selectOne("userMapper.selectQCount", userId);
		return result;
	}
	
	
	//?????? ?????????????????? ??????
	public int selectGCount(String userId) {
		int result = sqlSession.selectOne("userMapper.selectGameGibu", userId);
		return result;
	}
	

	@Override
	public int selectMyCPoint(String userId) {
		int point = sqlSession.selectOne("userMapper.selectPPoint", userId);
		return point;
	}

	@Override
	public User selectEPList(String userId) {
		User user = sqlSession.selectOne("userMapper.selectEPList", userId);
		return user;
	}

	@Override
	public int getSearchCount(Map<String, Object> map) {
		int result = sqlSession.selectOne("userMapper.selectSearchCount", map);
		return result;
	}






	

	












	

}
