package org.joonzis.dao;

import java.util.List;
import java.util.Map;

import org.joonzis.vo.BVO;

public interface BDao {
	public int getTotalRecordCount();
	public List<BVO> getList(Map<String, Integer> map);
	public int getInsertBBS(BVO bvo);
	public int insertsold(BVO bvo);
	public void getUpdateHit(BVO bvo);
	public BVO getBBS(int b_idx);
	public void updateBBS(BVO bvo);
	public int removeBBS(int b_idx);
}
