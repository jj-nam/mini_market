<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String path = request.getParameter("path");
	String filename = request.getParameter("filename");
	
	// 다운로드 받을 파일의 실제 경로 구하기
	String realPath = request.getServletContext().getRealPath("/" + path);
	
	// 다운로드 받을 수 있는 문서 타입으로 설정하기
	response.setContentType("application/x-msdownload");
	
	// 파일 클래스(파일 스트림)를 통해 다운로드 할  파일 연결하기
	File file = new File(realPath + "/" + filename);	// new File(경로 + 파일명)
	
	// 파일 이름에 공백이 있을 경우 "+"로 출력되는 부분 수정
	filename = URLEncoder.encode(filename, "utf-8");
	filename = filename.replaceAll("\\+", "%20");
	
	// 클라이언트의 헤더 정보에 첨부파일이 있음을 처리
	response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
	response.setHeader("Content-Length", file.length() + "");
	
	// 실제 다운로드 하기
	FileInputStream fis = null;
	BufferedInputStream bis = null;		// 서버에 저장된 파일을 읽어들이는 스트림
	BufferedOutputStream bos = null;	// 클라이언트에 파일을 작성할 스트림
	
	try{
		fis = new FileInputStream(file);
		bis = new BufferedInputStream(fis);
		bos = new BufferedOutputStream(response.getOutputStream());
		
		/*
		// 1. 하나씩 (int) 다운로드 받기
		int n;
		// read()가 -1을 리턴하면 읽어 들인 파일을 모두 읽었다 판단
		while((n=bis.read()) != -1){
			bos.write(n);
			bos.flush();
		}
		*/
		
		// 2. 전체 다운로드 받기
		byte[] buffer = new byte[(int)file.length()];	// 파일의 크기와 같은 크기의 버퍼 준비
		bis.read(buffer, 0, buffer.length);				// 버퍼 전체를 읽는다.
		bos.write(buffer);
		
		// jsp의 추력 스트림과 servlet의 출력 스트림 겹침 방지 처리
		out.clear();
		out = pageContext.pushBody();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(bos != null) {bos.close();}
			if(bis != null) {bis.close();}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>