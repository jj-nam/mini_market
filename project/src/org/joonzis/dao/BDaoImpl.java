package org.joonzis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.BVO;

public class BDaoImpl implements BDao {
	private static BDaoImpl instance = null;
	private BDaoImpl() {}
	public static BDaoImpl getInstance() {
		if(instance == null) {
			instance = new BDaoImpl();
		}
		return instance;
	}
	
	private static SqlSession sqlsession = null;
	private synchronized static SqlSession getSqlSession() {
		if(sqlsession == null) {
			sqlsession = DBService.getFactory().openSession(false);
		}
		return sqlsession;
	}
	
	@Override
	public int getTotalRecordCount() {
		return getSqlSession().selectOne("total_count_of_bbs");
	}
	@Override
	public List<BVO> getList(Map<String, Integer> map) {
		return getSqlSession().selectList("select_by_map", map);
	}
	@Override
	public int getInsertBBS(BVO bvo) {
		int result = getSqlSession().insert("insert_bbs",bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public int insertsold(BVO bvo) {
		int result = getSqlSession().insert("insert_sold",bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	@Override
	public void getUpdateHit(BVO bvo) {
		int result = getSqlSession().update("update_hit", bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
	}
	@Override
	public BVO getBBS(int b_idx) {
		return getSqlSession().selectOne("bbs_by_idx", b_idx);
	}
	@Override
	public void updateBBS(BVO bvo) {
		int result = getSqlSession().update("update_bbs",bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
	}
	@Override
	public int removeBBS(int b_idx) {
		int result = getSqlSession().delete("delete_bbs",b_idx);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
}
