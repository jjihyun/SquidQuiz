package com.pj.ptsd.user.store;

import com.pj.ptsd.user.domain.User;

public interface UserStore {
		public User selectMember(User userOne);
		public User selectReadMember(User userId);
		public int checkIdDup(String userId);
		public int insertMember(User user);
		public int updateMember(User user);
		public int deleteMember(String userId);

}
