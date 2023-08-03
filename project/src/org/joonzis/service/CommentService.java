package org.joonzis.service;

import java.util.List;

import org.joonzis.vo.CVO;

public interface CommentService {
	public int commentCountByIdx(int b_idx);
	public int insertComment(CVO cvo);
	public List<CVO> getCommentList(int b_idx);
	public int removeComment(int c_idx);
	public void removeCommentAll(int b_idx);
	public CVO getbuyer(CVO cvo);
	public void updateComment(CVO cvo);
}
