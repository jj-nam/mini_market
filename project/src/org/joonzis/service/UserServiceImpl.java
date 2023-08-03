package org.joonzis.service;

import org.joonzis.dao.UDao;
import org.joonzis.dao.UDaoImpl;
import org.joonzis.vo.UVO;

public class UserServiceImpl implements UserService{
	UDao udao = UDaoImpl.getInstance();
	
	@Override
	public int goJoin(UVO uvo) {
		return udao.goJoin(uvo);
	}
	@Override
	public int ckMember(UVO uvo) {
		return udao.ckMember(uvo);
	}
	@Override
	public UVO getMember(UVO uvo) {
		return udao.getMember(uvo);
	}
	@Override
	public UVO getUser(String id) {
		return udao.getUser(id);
	}
	@Override
	public UVO getNick(int b_idx) {
		return udao.getNick(b_idx);
	}
	@Override
	public UVO getBuyer(String buyer) {
		return udao.getBuyer(buyer);
	}
	@Override
	public UVO getNickname(String nickname) {
		return udao.getNickname(nickname);
	}
	@Override
	public UVO getname(String name) {
		return udao.getName(name);
	}
	@Override
	public void updateInfo(UVO uvo) {
		udao.getUpdate(uvo);
	}
}
