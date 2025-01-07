<%@page import="learnbyteaching.emaillist.vo.EmailVo"%>
<%@page import="learnbyteaching.emaillist.dao.EmailListDaoImpl"%>
<%@page import="learnbyteaching.emaillist.dao.EmailListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ServletContext context = getServletContext();

String dbUser = context.getInitParameter("dbUser");
String dbPass = context.getInitParameter("dbPass");

//폼 데이터 받아오기
//firstname, email정보
String firstName = request.getParameter("fn");
String lastName = request.getParameter("ln");
String email = request.getParameter("email");

EmailListDao dao = new EmailListDaoImpl(dbUser, dbPass);
EmailVo vo = new EmailVo(lastName, firstName, email);
dao.insert(vo);

//redirect 끝나기전에 다른페이지로 이동해라 (3xx)포트
response.sendRedirect("index.jsp");
%>