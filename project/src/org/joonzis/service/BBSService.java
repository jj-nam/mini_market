package org.joonzis.service;

import java.util.List;
import java.util.Map;

import org.joonzis.vo.BVO;

public interface BBSService {
	// 전체 게시물 수
	public int recordCount();
	// 페이징 처리된 게시글
	public List<BVO> getBBSList(Map<String, Integer> map);
	
	public int getInsertBBS(BVO bvo);
	
	public int soldinsert(BVO bvo);
	
	public void getUpdateHit(BVO bvo);
	
	public BVO getBBS(int b_idx);
	
	public int removeBBS(int b_idx);
	
	public void updateBBS(BVO bvo);
}
