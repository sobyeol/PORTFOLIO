<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />

<%
	String cartId = session.getId();
%>

<title>장바구니</title>
</head>
<body>

	<jsp:include page = "top.jsp" />
	
	<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>차량 장바구니</h2>
         
        </div>

      </div>
    </section>
	
	<div class = "container">
		<div class = "row">
			<table width = "100%">
				<tr>
					<td align = "left"><a href = "deleteCart.jsp?cartId=<%=cartId %>" class = "btn btn-danger">삭제하기</a></td>
					<td align = "right"><a href = "shippingInfo.jsp?cartId=<%=cartId %>" class = "btn btn-success">주문하기</a></td>
					
				</tr>
			</table>
		</div>
		
		<div style="padding-top: 50px">
			<table class = "table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>취등록세 별도</th>
					<th>비고</th>
				</tr>
				
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)
					session.getAttribute("cartlist");
								
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					
					for(int i = 0; i < cartList.size(); i++){
					
						Product product = cartList.get(i);
						
						product.getCarPrice();
						
						int total = Integer.parseInt(product.getCarPrice()) * product.getQuantity();
						
						
						double entry = total * 0.07;
						
						double result_entry = Math.round(entry * 1000) / 1000;
						
						sum = sum + total;
						
				%>
				
				<tr>
					<td><%=product.getCarId() %> - <%=product.getCarName() %></td>
					<td><%=product.getCarPrice() %> 원</td>
					<td><%=product.getQuantity() %> 대</td>
					<td><%=total %> 원</td>
					<td><%=result_entry %> 원</td>
					<td><a href="removeCart.jsp?carId=<%=product.getCarId() %>" class = "badge badge-danger">삭제</a></td>
				</tr>
				
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum %> 원</th>
					<th></th>
				</tr>
			</table>
			
			<a href="cars.jsp" class = "btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	
	<jsp:include page = "footer.jsp" />
	
</body>
</html>