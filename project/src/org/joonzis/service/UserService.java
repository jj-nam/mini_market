package org.joonzis.service;

import org.joonzis.vo.UVO;

public interface UserService {
	public int goJoin(UVO uvo);
	public int ckMember(UVO uvo);
	public UVO getMember(UVO uvo);
	public UVO getUser(String id);
	public UVO getNick(int b_idx);
	public UVO getBuyer(String buyer);
	public UVO getNickname(String nickname);
	public UVO getname(String name);
	public void updateInfo(UVO uvo);
}
