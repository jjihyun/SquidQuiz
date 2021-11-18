package com.pj.ptsd.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pj.ptsd.board.domain.Board;
import com.pj.ptsd.campaign.domain.Campaign;
import com.pj.ptsd.campaign.domain.CampaignRecord;
import com.pj.ptsd.exchange.domain.Exchange;
import com.pj.ptsd.user.domain.ChargePoint;
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
		List<CampaignRecord> cList = sqlSession.selectList("campaignMapper.selectMypageDonate", userId);
		return cList;
	}

	@Override
	public List<Board> selectBoardList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Board> bList = sqlSession.selectList("userMapper.selectBoard", userId);
		return bList;
	}

	@Override
	public int selectBListCount() {
		int result = sqlSession.selectOne("userMapper.selectBListCount");
		return result;
	}

	@Override
	public Board selectbOne(int bNo) {
		Board board = sqlSession.selectOne("boardMapper.selectOneBoard", bNo);
		return board;
	}

	

	












	

}
