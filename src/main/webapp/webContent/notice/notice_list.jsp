<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/paging.css" rel="stylesheet"> <!--파트너 css-->
<%@ include file = "../common_header_yw.jsp" %>


<!--서브 헤더 -->
	<div class="sub-header sub-header-notice"><!-- sub-header 뒤에 이름 변경으로 이미지 변경 -->
		<h1 class="sub-title"><span class="text">공 지 사 항</span></h1>
		<span class="deco-box">
			<i class="deco-1"></i><i class="deco-2"></i>
		</span>
	</div>
<!-- 서브 헤더 끝 -->

<script type="text/javascript">
	function goSearch(){
		
		sear.method="post";
		sear.action="Notice";
		sear.submit();
	}
	
	function goWriteForm(){
		noti.t_gubun.value="WriteForm";
		noti.method="post";
		noti.action="Notice";
		noti.submit();
	}
	function goView(no){
		noti.t_no.value=no;
		noti.t_gubun.value="View";
		noti.method="post";
		noti.action="Notice";
		noti.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="Notice";
		pageform.submit();
	}
</script>
<form name="noti">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_gubun">
</form>
<form name="pageform">
	<input type="hidden" name="t_nowPage">
	<input type="hidden" name="t_list_setup_count" value="${t_gulsu}">
	<input type="hidden" name="t_select" value="${t_select }">
	<input type="hidden" name="t_search" value="${t_search }">

</form>


	<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item active"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item"><a href="Qna"><span class="in">질의응답</span></a></li>
				
			</ul>
		</div>
	
<!-- 서브 페이지-->	
<div class="sub-main">
	
	<div class="sub-search">
	<h3 class="donation-text-box"><a href="" class="donation-text">100% 전하는 기부 <i class="fas fa-chevron-right"></i></a>
		<br>

	</div>
	<div class="sub-content">
			 
<style>

	#b_right{
		
		width:1140px;
		//height:500px;
		padding:20px;
		margin-bottom:10px;
//		background:green;	
	}
	.n_title{
		width:1140px;
		height:28px;
		text-align:left;
		font:25px "myFont_1";
		border-bottom:1px dotted gray;
		margin-bottom:20px;
		margin-top:10px;
		color:#652e5b;
		//background:yellow;
	}	
.notice tr th{
		text-align:left;
	}
	.notice i{
		font-size:8px;
		color:gray;
	}
	.notice .important{
		color:red;
	}	
	.notice .hei30 file{
			height:20px;
	}	
.select_box{
			width:1100px;
			height:25px;
			text-align:right;
		//	background:yellow;
		}
		.sel_box{
			width:80px;
			height:22px;
		}
		.sel_text{
			width:120px;
			height:22px;
		}	
		.sel_button{
			width:80px;
			height:22px;
		}
.boardList{
			width:100%;
			font: 13px "nanum";
		}
		.boardList th{ 
			padding:10px 0;
			border-top:1px solid #848484;
			border-bottom:1px solid #848484; 		
		}
		.boardList tbody td{ 
			text-align:center;
			border-bottom:1px solid #e0e0e0;
			padding:8px 0;
		}
		.boardList .t_center{
			text-align:left;
		}	
</style>	
	
	
	
		
		
	<div id="b_right">
		
			<p class="n_title">
				<i class="far fa-clipboard"></i> NOTICE 
			</p>
	<form name="sear" >
			<p class="select_box">
			
				<input type="hidden" name="t_gubun" value="List">
				<select name="t_select" class="sel_box">
					<option value="title" <c:if test="${t_select eq 'title'}">selected</c:if>>TITLE</option>
					<option value="content" <c:if test="${t_select eq 'content'}">selected</c:if>>CONTENT</option>
				</select>
				<input value="${t_search}" type="text" name="t_search" class="sel_text">
				<button class="sel_button" onclick="goSearch()" type="button"><i class="fa fa-search"></i>SEARCH</button>
			
			</p>
	</form>	
			<table class="boardList">
			
				<colgroup>
					<col width="5%">
					<col width="60%">
					<col width="5%">
					<col width="10%">
					<col width="14%">
					<col width="6%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Attach</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
					
				<c:forEach items="${t_dtos}" var="dtos">	
					<tr>
						<td><a href="javascript:goView('${dtos.getNo()}')">${dtos.getNo()}</a></td>
						
						<td class="t_center"><a href="javascript:goView('${dtos.getNo()}')">
					<c:if test="${dtos.getImportant() eq '1' }"	>
					<span style="color:#1E90FF; font-weight:bold">[중요]</span>
					</c:if>
						 ${dtos.getTitle()}
						</a></td>
						
						<td>
							<c:if test="${not empty dtos.getAttatch()}">
								<i class="fas fa-paperclip"></i>
							</c:if>
							<c:if test="${dtos.getAttatch() eq null}">
								none
							</c:if>
						</td>		
						<td>${dtos.getReg_id()}</td>
						<td>${dtos.getReg_date()}</td>
						<td>${dtos.getHit()}</td>
					</tr>
				</c:forEach>
					
				
		
				</tbody>
			
			</table>
	
	
	
	
	
	
	
	<br>
	
	<div class="paging" id="paging1">
 		<%	int total_page 				= (int)request.getAttribute("t_total_page");
		int current_page 			= (int)request.getAttribute("t_current_page");
		out.print(CommonUtil.pageListPost2(current_page, total_page, 5));
		%>
 		
	</div>	
	
	
	<br>
	<input type="button" onclick="goWriteForm()" value="글 쓰 기" class="btn">
								



</div>	
</div>
	




</div>
</body>
<%@ include file = "../common_footer.jsp" %>