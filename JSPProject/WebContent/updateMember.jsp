<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" 
	user="c##carmarket" password="c##carmarket" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>

<title>회원 수정</title>
</head>

<section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h1></h1>
        </div>
           
      </div>
    </section>

<body onload="init()">
	<jsp:include page="top.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div>
	</div>

	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mail}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />

	<c:set var="birth" value="${row.birth }" />
	<c:set var="year" value="${birth.split('/')[0]}" />
	<c:set var="month" value="${birth.split('/')[1]}" />
	<c:set var="day" value="${birth.split('/')[2]}" />
	
	<div class="container">
		<form name="newMember" class="form-horizontal"
			action="processUpdateMember.jsp" method="post"
			onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id"
						value="<c:out value='${row.id }'/>" />
				</div>
			</div>
			<br>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control"
						placeholder="password" value="<c:out value='${row.password }'/>" >
				</div>
			</div>
			<br>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control"
						placeholder="password_confirm" >
				</div>
			</div>
			<br>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="name" value="<c:out value='${row.name }'/>" >
				</div>
			</div>
			<br>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${row.phone}'/>">

				</div>
			</div>
			<br>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address" value="<c:out value='${row.address}'/>">
				</div>
			</div>
			<br>
			
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 "> 
					<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
					<input type="reset" class="btn btn-primary " value="취소 " onclick="location.href='main.jsp'" >
				</div>
			</div>
		</form>	
	</div>
	</c:forEach>
	
	
	<jsp:include page="footer.jsp" />
	
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	
	 <!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	
	
</body>
</html>
