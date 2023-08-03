package org.joonzis.dao;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.UVO;

public class UDaoImpl implements UDao{
	private static UDaoImpl instance = null;
	private UDaoImpl() {}
	public static UDaoImpl getInstance() {
		if(instance == null) {
			instance = new UDaoImpl();
		}
		return instance;
	}
	
	// 필드
	private static SqlSession sqlsession = null;
	private synchronized static SqlSession getSqlSession() {
		if(sqlsession == null) {
			sqlsession = DBService.getFactory().openSession(false);
		}
		return sqlsession;
	}
	@Override
	public int goJoin(UVO uvo) {
		int result = getSqlSession().insert("insert_join", uvo); 
		if(result > 0) {
			getSqlSession().commit();
		}
		return result; 
	}
	@Override
	public int ckMember(UVO uvo) {
		return getSqlSession().selectOne("select_member_ck", uvo);
	}
	@Override
	public UVO getMember(UVO uvo) {
		return getSqlSession().selectOne("select_member", uvo);
	}
	@Override
	public UVO getUser(String id) {
		return getSqlSession().selectOne("user_by_id", id);
	}
	@Override
	public UVO getNick(int b_idx) {
		return getSqlSession().selectOne("user_by_writer", b_idx);
	}
	@Override
	public UVO getBuyer(String buyer) {
		return getSqlSession().selectOne("select_buyer", buyer);
	}
	@Override
	public UVO getNickname(String nickname) {
		return getSqlSession().selectOne("select_nickname", nickname);
	}
	@Override
	public UVO getName(String name) {
		return getSqlSession().selectOne("select_name", name);
	}
	@Override
	public void getUpdate(UVO uvo) {
		int result = getSqlSession().update("update_info",uvo);
		if(result > 0) {
			getSqlSession().commit();
		}
	}
}
