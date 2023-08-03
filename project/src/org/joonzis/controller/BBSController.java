package org.joonzis.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;
import org.joonzis.model.Paging;
import org.joonzis.service.BBSService;
import org.joonzis.service.BBSServiceImpl;
import org.joonzis.service.CommentService;
import org.joonzis.service.CommentServiceImpl;
import org.joonzis.service.UserService;
import org.joonzis.service.UserServiceImpl;
import org.joonzis.vo.BVO;
import org.joonzis.vo.CVO;
import org.joonzis.vo.UVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/BBSController")
public class BBSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BBSController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String realPath = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = null;
		String cmd = request.getParameter("cmd");
		if(cmd == null) {
			mr = new MultipartRequest(
					request,
					realPath,
					1024*1024*10,	
					"utf-8",
					new DefaultFileRenamePolicy()
				);
			cmd = mr.getParameter("cmd");
		}
		
		String resultCmd = "allList";
		if(cmd != null && !cmd.isEmpty()) {
			resultCmd = cmd;
		}
		
		boolean forwardCheck = false;
		String path = "";
		
		BBSService bservice = new BBSServiceImpl();
		UserService uservice = new UserServiceImpl();
		CommentService cservice = new CommentServiceImpl();
		String currentPage = "";
		String open = null;
		HttpSession session = request.getSession();
		BVO bvo = null;
		CVO cvo = null;
		UVO uvo = null;
		String b_idx = "";
		String u_idx = "";
		String c_idx = "";
		String s_idx = "";
		PrintWriter out = response.getWriter();
		String resultc="";
		boolean isAjax = false;
		
		switch(cmd) {
		case "allList" :
			Paging pvo = new Paging();
			pvo.setTotalRecord(bservice.recordCount());
			pvo.setTotalPage();
			
			currentPage = request.getParameter("currentPage");
			if(currentPage != null && !currentPage.isEmpty()){
				pvo.setNowPage(Integer.parseInt(currentPage));
			}
			
			pvo.setBegin( (pvo.getNowPage()-1) * pvo.getRecordPerPage() + 1);
			pvo.setEnd(pvo.getBegin() + pvo.getRecordPerPage() - 1);
			
			int begin = pvo.getBegin();
			int end = pvo.getEnd();
			
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			
			List<BVO> list = bservice.getBBSList(map);
			request.setAttribute("list", list);
			
			/******* 페이징 처리를 위한 block 계산 ********/
			pvo.setBeginBlock( (pvo.getNowPage()-1) / pvo.getPagePerBlock() * pvo.getPagePerBlock() + 1);
			pvo.setEndBlock(pvo.getBeginBlock() + pvo.getPagePerBlock() - 1);
			
			if(pvo.getEndBlock() > pvo.getTotalPage()){
				pvo.setEndBlock(pvo.getTotalPage());
			}
			
			request.setAttribute("pvo", pvo);
			
			
			open = (String)session.getAttribute("open");
			if(open != null){
				session.removeAttribute("open");
			}
			path = "bbs/allList.jsp";
			forwardCheck = true;
			break;
			
		case "insertPage": 
			forwardCheck = true;
			path = "bbs/insertPage.jsp";
			break;
		
		case "insertBBS" :
			bvo = new BVO();
			bvo.setWriter(mr.getParameter("writer"));
			bvo.setTitle(mr.getParameter("title"));
			bvo.setContent(mr.getParameter("content"));
			bvo.setPrice(Integer.parseInt(mr.getParameter("price")));
			bvo.setIp(Inet4Address.getLocalHost().getHostAddress());	// IPv4
			
			// 첨부파일 유무에 따라서 filename 값을 결정하자
			if(mr.getFile("filename") != null){
				bvo.setFilename(mr.getFilesystemName("filename"));
			}else{
				bvo.setFilename("");
			}
			
			int result = bservice.getInsertBBS(bvo);
			request.setAttribute("result", result);
			forwardCheck = true;
			path = "bbs/insert.jsp";
			break;
			
			
		case "view":
			b_idx = request.getParameter("b_idx");
			// 게시물 번호에 대한 게시물 정보
			bvo = bservice.getBBS(Integer.parseInt(b_idx));
			// 게시물 정보와 유저 정보를 연결
			uvo = uservice.getNick(Integer.parseInt(b_idx));
			currentPage = request.getParameter("currentPage");
			
			open = (String)session.getAttribute("open");
			if(open == null){
				session.setAttribute("open", "yes");
				int hit = bvo.getHit() + 1;
				bvo.setHit(hit);
				bservice.getUpdateHit(bvo);
			}
			
			session.setAttribute("bvo", bvo);
			session.setAttribute("uvo", uvo);
			session.setAttribute("currentPage", currentPage);
			
			List<CVO> cList = cservice.getCommentList(bvo.getB_idx());
			request.setAttribute("cList", cList);
			
			forwardCheck = true;
			path = "bbs/view.jsp";
			break;
			
		case "removeBBS" :
			b_idx = request.getParameter("b_idx");
			
			// 댓글있는지 확인
			result = cservice.commentCountByIdx(Integer.parseInt(b_idx));
			if (result > 0) { // 댓글이 달려있는 게시글은 댓글을 먼저 삭제
				cservice.removeCommentAll(Integer.parseInt(b_idx));
			}
			 
			result = bservice.removeBBS(Integer.parseInt(b_idx));

			request.setAttribute("result", result);
			forwardCheck = true;
			path = "bbs/remove.jsp";
			break;
			
		case "updatePage":
			path = "bbs/update_page.jsp";
			break;
			
		case "update":
			bvo = new BVO();
			bvo.setB_idx(Integer.parseInt(mr.getParameter("b_idx")));
			bvo.setTitle(mr.getParameter("title"));
			bvo.setContent(mr.getParameter("content"));
			bvo.setPrice(Integer.parseInt(mr.getParameter("price")));
			bvo.setIp(Inet4Address.getLocalHost().getHostAddress());	// IPv4
			
			File newfile = mr.getFile("filename");			// 새 첨부 파일 (newfile)
			String oldfile = mr.getParameter("oldfile");	// 기존 첨부 파일(oldfile)
			if(newfile != null){	// 새 첨부 파일 O
				if(oldfile != null){	// 기존 첨부 파일 O
					File removeFile = new File(realPath + "/" + oldfile);
					if(removeFile.exists()){	// 기존 첨부 파일 유무 확인
						removeFile.delete();	// 기존 첨부 파일 삭제
					}
				}
				bvo.setFilename(newfile.getName());	// 새 첨부 파일 이름 가져오기
			}else{	// 새 첨부 파일 X
				if(oldfile != null){	// 기존 첨부 파일 O
					bvo.setFilename(oldfile);
				}else{
					bvo.setFilename("");	// 새 첨부 파일 X, 기존 첨부 파일 X
				}
			}
			
			bservice.updateBBS(bvo);
			request.setAttribute("b_idx", bvo.getB_idx());
			forwardCheck = true;
			path ="bbs/update.jsp";
			break;
			
		case "insertComment" :
			cvo = new CVO();
			cvo.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			cvo.setWriter(request.getParameter("writer"));
			cvo.setContent(request.getParameter("content"));
			cvo.setC_price(Integer.parseInt(request.getParameter("c_price")));
			cvo.setC_ip(Inet4Address.getLocalHost().getHostAddress());
			
			cservice.insertComment(cvo);
			
			request.setAttribute("b_idx", request.getParameter("b_idx"));
			forwardCheck = true;
			path = "bbs/insertComment.jsp";
			break;
			
		case "confirmComment" : 
			// 구매자 정보
			cvo = new CVO();
			cvo.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			cvo.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			cvo = cservice.getbuyer((cvo));
			
			String buyer = cvo.getWriter();
			uvo = uservice.getBuyer(buyer);
			
			session.setAttribute("cvo", cvo);
			session.setAttribute("uvo", uvo);
			currentPage = request.getParameter("currentPage");
			
			forwardCheck = true;
			path = "bbs/confirmComment.jsp";
			break;
			
		case "buyingbbs" : 
			b_idx = request.getParameter("b_idx");
			String nickname = request.getParameter("nickname");
			
			// 구매자 본인 정보
			uvo = uservice.getNickname(nickname);
			session.setAttribute("uvo", uvo);

			// 구매 완료 후 게시글 제거
			// 댓글있는지 확인
			result = cservice.commentCountByIdx(Integer.parseInt(b_idx));
			if (result > 0) { // 댓글이 달려있는 게시글은 댓글을 먼저 삭제
				cservice.removeCommentAll(Integer.parseInt(b_idx));
			}
			 
			result = bservice.removeBBS(Integer.parseInt(b_idx));

			request.setAttribute("result", result);
			
			forwardCheck = true;
			path = "bbs/completeBuy.jsp";
			break;
			
		case "json" : 
			b_idx = request.getParameter("b_idx");

			bvo = bservice.getBBS(Integer.parseInt(b_idx));
			
			cList = cservice.getCommentList(bvo.getB_idx());
			
			JSONArray jsonArr = new JSONArray();
			
			for(CVO ccvo : cList) {
				JSONObject jo = new JSONObject();
				jo.put("reg_date", ccvo.getReg_date().toString());
				jo.put("writer", ccvo.getWriter());
				jo.put("content", ccvo.getContent());
				jo.put("c_price", ccvo.getC_price());
				jo.put("c_idx", ccvo.getC_idx());
				jo.put("b_idx", ccvo.getB_idx());
				jsonArr.add(jo);
			}
			
			isAjax = true;
			out.println(jsonArr);
			break;
			
		case "removeComment" : 
			c_idx = request.getParameter("c_idx");
			result = cservice.removeComment(Integer.parseInt(c_idx));
			request.setAttribute("result", result);

			isAjax = true;
			out.println(result);
			break;
			
		case "updateCommentPage" :
			cvo = new CVO();
			cvo.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			cvo.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			cvo = cservice.getbuyer(cvo);
			session.setAttribute("cvo", cvo);
			currentPage = request.getParameter("currentPage");
			
			forwardCheck = true;
			path = "bbs/updateCommentPage.jsp";
			break;
			
		case "updateComment" : 
			cvo = new CVO();
			cvo.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			cvo.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
			cvo.setContent(request.getParameter("content"));
			cvo.setC_price(Integer.parseInt(request.getParameter("c_price")));
			
			cservice.updateComment(cvo);
			request.setAttribute("cvo", cvo);
			
			forwardCheck = true;
			path = "bbs/updateComment.jsp";
			break;
			
		}
		
		
		if(!isAjax) {
			if(forwardCheck) {
				request.getRequestDispatcher(path).forward(request, response);
			}else {
				response.sendRedirect(path);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
