<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/paging.css" rel="stylesheet"> <!--파트너 css-->
 <link rel="stylesheet" type="text/css" href="css/css_pyw/sub.css" />
<link rel="stylesheet" type="text/css" href="css/css_pyw/subb.css" />
<link rel="stylesheet" type="text/css" href="css/css_pyw/subba_yw.css" />
	<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %>

<!--서브 헤더 -->
	<div class="sub-header sub-header-local">
		<h1 class="sub-title"><span class="text">지역 뉴스</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>

		
	</div>
<script type="text/javascript">
	function goSearch(search){
	
		sear.t_search.value=search;
		sear.method="post";
		sear.action="LocalNews";
		sear.submit();
	}
	
	function goWriteForm(){
		dona.t_gubun.value="WriteForm";
		dona.method="post";
		dona.action="LocalNews";
		dona.submit();
	}
	function goView(no){
		dona.t_no.value=no;
		dona.t_gubun.value="View";
		dona.method="post";
		dona.action="LocalNews";
		dona.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="LocalNews";
		pageform.submit();
	}
</script>
<form name="dona">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_gubun">
</form>
<form name="pageform">
	<input type="hidden" name="t_nowPage">
	<input type="hidden" name="t_list_setup_count" value="${t_gulsu}">
	<input type="hidden" name="t_select" value="${t_select }">
	<input type="hidden" name="t_search" value="${t_search }">
</form>

<div class="contents">
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
	<ul>
		<li data-act='tab' class="item"><a href="Donation"><span class="in">기부</span></a></li>
		<li data-act='tab' class="item"><a href="Volunteer"><span class="in">봉사</span></a></li>
		<li data-act='tab' class="item active"><a href="LocalNews"><span class="in">지역뉴스</span></a></li>
		<li data-act='tab' class="item"><a href="Missing"><span class="in">실종아동</span></a></li>
	</ul>
</div>
	
<!-- 서브 페이지-->	
<div class="sub-main">
	
	<form name="sear">
		<input type="hidden" name="t_search">
	<div class="sub-search">
		<ul class="mini-menu">
				<a href="javascript:goSearch('')"  >
	                <li>
						<h1 class="menu-bar">all-search</h1>전체 검색
					</li>
				</a>
                   
                <a href="javascript:goSearch('donation')" >   
					<li>
						<h1 class="menu-bar">donation</h1>기부
					</li>
                </a>
                
                <a href="javascript:goSearch('volulteer')">
					<li>
						<h1 class="menu-bar">volunteer</h1>봉사
					</li>
				</a>
		</ul>
	</div>
	</form>
	
	<div class="sub-content-local">
			 <div class="donation-box">
        

		</h3>    
          
		  <!-- table start-->
			<div class="table-box">
				<table class="table">
					<caption></caption>
					<colgroup>
						<col width="25%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
					
					</colgroup>
					
					<thead>
						<tr>
							<th scope="col">메인 사진</th>
							<th scope="col">타이틀</th>
							<th scope="col">뉴스종류</th>
							<th scope="col">기부/봉사</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
			<form name="storeArr">		
					<tbody>
			<c:forEach items="${t_dtos}" var="dtos">	
				
					<tr>
					 <input type="hidden" name="t_no" value="${dtos.getNo()}" >
					 <input type="hidden" name="t_reg_id" value="${dtos.getReg_id()}">
											
						<td>
							<a href="javascript:goView('${dtos.getNo()}')">
							<img src="donaimg/local/${dtos.getAttach()}" alt="뉴스1" style=" width:200px;height:100px; margin:5px;"></a></td>
					
						<td><a style="font-size:15px;" href="javascript:goView('${dtos.getNo()}')">${dtos.getTitle()}</a></td>
					
						<td>
                            <span  style="width:100%;height:30px;font-size:15px;">${dtos.getNews_name()}</span>    
                            </td>	
						
						<td>
							<span  style="width:100%;height:30px;font-size:15px;">${dtos.getSearch()}</span>
						</td>
																		
						<td>
							<span  style="width:100%;height:30px;font-size:15px;">${dtos.getReg_date()}</span>
						</td>
						
						<td>
                        	<span  style="width:100%;height:30px;font-size:15px;">${dtos.getHit()}</span>
					    </td>
					</tr>    
			</c:forEach>
<style>
	.buttona{
		width:75px;
		height:30px;
		background:#000080;
		text-align:center;
	}.buttonb{
		width:75px;
		height:30px;
		background:#AA0114;
		text-align:center;
	}
	.buttona:hover {
		background:#32CD32;
	}	
	.buttonb:hover {
		background:#32CD32;
	}

</style>						
		
		
					</tbody>
			
</form>		
				</table>
			</div>
	</div>
	
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
	




</div>
</div>
</body>
<%@ include file = "../common_footer.jsp" %>