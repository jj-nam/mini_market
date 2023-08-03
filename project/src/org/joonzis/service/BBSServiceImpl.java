package org.joonzis.service;

import java.util.List;
import java.util.Map;

import org.joonzis.dao.BDao;
import org.joonzis.dao.BDaoImpl;
import org.joonzis.vo.BVO;

public class BBSServiceImpl implements BBSService{
	private BDao bdao = BDaoImpl.getInstance();
	@Override
	public int recordCount() {
		return bdao.getTotalRecordCount();
	}
	@Override
	public List<BVO> getBBSList(Map<String, Integer> map) {
		return bdao.getList(map);
	}
	@Override
	public int getInsertBBS(BVO bvo) {
		return bdao.getInsertBBS(bvo);
	}
	@Override
	public int soldinsert(BVO bvo) {
		return bdao.insertsold(bvo);
	}
	@Override
	public void getUpdateHit(BVO bvo) {
		bdao.getUpdateHit(bvo);
	}
	@Override
	public BVO getBBS(int b_idx) {
		return bdao.getBBS(b_idx);
	}
	@Override
	public void updateBBS(BVO bvo) {
		bdao.updateBBS(bvo);
	}
	@Override
	public int removeBBS(int b_idx) {
		return bdao.removeBBS(b_idx);
	}
}
