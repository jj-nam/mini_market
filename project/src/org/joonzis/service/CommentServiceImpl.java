package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.CDao;
import org.joonzis.dao.CDaoImpl;
import org.joonzis.vo.CVO;

public class CommentServiceImpl implements CommentService{
	private CDao cdao = CDaoImpl.getInstance();
	
	@Override
	public int commentCountByIdx(int b_idx) {
		return cdao.commentCountByIdx(b_idx);
	}
	@Override
	public int insertComment(CVO cvo) {
		return cdao.insertComment(cvo);
	}
	@Override
	public List<CVO> getCommentList(int b_idx) {
		return cdao.getCommentList(b_idx);
	}
	@Override
	public int removeComment(int c_idx) {
		return cdao.removeComment(c_idx);
	}
	@Override
	public void removeCommentAll(int b_idx) {
		cdao.removeCommentAll(b_idx);
	}
	@Override
	public CVO getbuyer(CVO cvo) {
		return cdao.getbuyerinfo(cvo);
	}
	@Override
	public void updateComment(CVO cvo) {
		cdao.updateComment(cvo);
	}
}
