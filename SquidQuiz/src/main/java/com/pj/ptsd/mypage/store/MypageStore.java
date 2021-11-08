package com.pj.ptsd.mypage.store;

import com.pj.ptsd.user.domain.User;

public interface MypageStore {
	public int updateMember(User user);
	public int deleteMember(String userId);

}
