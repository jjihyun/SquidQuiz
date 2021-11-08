package com.pj.ptsd.mypage.service;

import com.pj.ptsd.user.domain.User;

public interface MypageService {
	public int modifyMember(User user);
	public int removeMember(String userId);

}
