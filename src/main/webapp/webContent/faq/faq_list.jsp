<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/paging.css" rel="stylesheet"> <!--파트너 css-->
<%@ include file = "../common_header_yw.jsp" %>


<!--서브 헤더 -->
	<div class="sub-header sub-header-notice"><!-- sub-header 뒤에 이름 변경으로 이미지 변경 -->
		<h1 class="sub-title"><span class="text">FAQ</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>
	</div>
<!-- 서브 헤더 끝 -->

<script type="text/javascript">
	function goSearch(){
		
		sear.method="post";
		sear.action="FAQ";
		sear.submit();
	}
	
	function goWriteForm(){
		faq.t_gubun.value="WriteForm";
		faq.method="post";
		faq.action="FAQ";
		faq.submit();
	}
	function goUpdateForm(no){
		faq.t_no.value=no;
		faq.t_gubun.value="UpdateForm";
		faq.method="post";
		faq.action="FAQ";
		faq.submit();
	}
	function goDelete(no){
		faq.t_no.value=no;
		faq.t_gubun.value="Delete";
		faq.method="post";
		faq.action="FAQ";
		faq.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="FAQ";
		pageform.submit();
	}
</script>
<form name="faq">
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
				<li data-act='tab' class="item"><a href="Notice"><span class="in">공지사항</span></a></li>
				<li data-act='tab' class="item active"><a href="FAQ"><span class="in">빠른답변</span></a></li>
				<li data-act='tab' class="item"><a href="Qna"><span class="in">질의응답</span></a></li>
				
			</ul>
		</div>
	
<!-- 서브 페이지-->	
<div class="sub-main">
	
	<div class="sub-search">
	<h3 class="donation-text-box"><a href="" class="donation-text">자주 묻는 질문에 대한 답변입니다. <i class="fas fa-chevron-right"></i></a>
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
				<i class="far fa-bookmark"></i> FAQ 
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
			<div class="faq-box">
		
				<c:forEach items="${t_dtos}" var="dtos">
		
				<button class="accordion">
				<c:choose>
				<c:when test="${dtos.getImportant() eq '2' }"	>
					<span style="color:#1E90FF; font-weight:bold"><i class="fas fa-chess-king"></i>[필수]</span>
				</c:when>
				<c:when test="${dtos.getImportant() eq '1' }"	>
					<span style="color:#1E90FF; font-weight:bold"><i class="fas fa-chess-rook"></i>[중요]</span>
				</c:when>
				<c:when test="${dtos.getImportant() eq '0' }"	>
					<span style="color:#1E90FF; font-weight:bold"><i class="fas fa-chess-pawn"></i></span>
				</c:when>
							
				</c:choose>
				
				${dtos.getTitle()}</button>
				<div class="text" style=" white-space:pre-line; >
					<input type="hidden" name="t_no" value="${dtos.getNo()}">
					<p style="line-height:2.2;"><?=$row["content"]?>${dtos.getContent()}</p>
				<?if($session_level == 'top'){?>	
				<p>	<a href="javascript:goDelete('${dtos.getNo()}')" style=" float:right; padding:5px; background:red; color:white" class="btn-write"><i class="fas fa-trash-alt"></i></a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:goUpdateForm('${dtos.getNo()}')" style=" float:right; padding:5px; background:green; color:white" class="btn-write"><i class="fas fa-wrench"></i></a></p>
				<? } ?>
				</div>
				</c:forEach>
		
<style>
.faq-box {width:1140px; margin:0 auto; margin:40px 0;}
.faq-box .accordion {font-family:Nanum Barun Gothic; background-color:#f1f1f1;; border:none; width:90%; margin:0 auto; display:block; font-size:16px; padding:18px; color:#444444; text-align:left; cursor:pointer; transition:all 0.5s; }
.faq-box .active , .accordion:hover {    
	background-color: #d1c0b5;
	color: white;}
.faq-box .accordion:after {content:"\02795"; /*unicode + 문자*/ font-size:13px; color:#777; float:right; margin-left:5px;}
.faq-box .text{font-family:Nanum Barun Gothic;  background-color: #e9e7e6;
    border: 1px solid #b4aeb9;	font-size:16px; padding:18px; width:90%; margin:0 auto; text-align:center; border:1px solid #E3CEF6; color:#444444; text-align:left; display:none;}

</style>				
	
	<br>
	
		
	<div class="paging" id="paging1">
 		<%	int total_page 				= (int)request.getAttribute("t_total_page");
		int current_page 			= (int)request.getAttribute("t_current_page");
		out.print(CommonUtil.pageListPost2(current_page, total_page, 5));
		%>
 		
	</div>	
	
	
	
	<br>
	<input type="button" onclick="goWriteForm()" value="글 쓰 기" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
								



</div>	
</div>
<script>
			$(document).ready(function() {
				$(".accordion").click(function() {
					$(".text").not($(this).next().slideToggle(250)).slideUp();
					$(this).siblings().removeClass("active");	
					$(this).toggleClass("active");	
				});
			});
		</script>	




</div>
</body>
<%@ include file = "../common_footer.jsp" %>