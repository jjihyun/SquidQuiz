package com.pj.ptsd.user.service;

import java.util.List;

import com.pj.ptsd.user.domain.User;

public interface UserService {
	
	public User loginMember(User userOne);
	public User readMember(User userId);
	public int checkIdDup(String userId);
	public int registerMember(User user);
	public int modifyMember(User user);
	public int removeMember(String userId);

}
