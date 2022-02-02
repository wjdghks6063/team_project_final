<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header.jsp" %>
<script type="text/javascript">
	function goSearch(search){
		sear.t_search.value=search;
		sear.method="post";
		sear.action="Donation";
		sear.submit();
	}
	
	function goWriteForm(){
		dona.t_gubun.value="WriteForm";
		dona.method="post";
		dona.action="Donation";
		dona.submit();
	}
	function goView(no){
		dona.t_no.value=no;
		dona.t_gubun.value="View";
		dona.method="post";
		dona.action="Donation";
		dona.submit();
	}
	function goPage(pageNumber){
		pageform.t_nowPage.value = pageNumber;
		pageform.method="post";
		pageform.action="Donation";
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

	<!--서브 헤더 -->
	<div class="sub-header sub-header-give"> <!--sub-header-give 의 이름이 페이지마다 바뀌어야함 예) 기부=도네이션-->
		<h1 class="sub-title"><span class="text">실종 아동찾기</span></h1>
		<span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>
	</div>
    
    <!-- 콘텐츠 내용 입력 칸-->
    <div class="contents">
            <div class="tab-3 swipe-initialized swipe-off swipe-first swipe-last" data-swipe="{&quot;type&quot;:&quot;case1&quot;,&quot;start&quot;:&quot;.active&quot;}" tabindex="0">
            	<form name="sear">
            		<input type="hidden" name="t_search">
                <ul class="swipe-cont" style="left: 0px;">
                    <li data-act="tab" class="item"><a href="javascript:goSearch('')"><span class="in">전체 검색</span></a></li>
                    <li data-act="tab" class="item active"><a href="javascript:goSearch('child')"><span class="in">아동</span></a></li>
                    <li data-act="tab" class="item"><a href="javascript:goSearch('senior')"><span class="in">노인</span></a></li>
                    <li data-act="tab" class="item"><a href="javascript:goSearch('disabled')"><span class="in">장애인</span></a></li>
                    <li data-act="tab" class="item"><a href="javascript:goSearch('disaster')"><span class="in">재난</span></a></li>
                </ul>
                </form>	
            </div>
            
            <form name="sear">
			<input type="hidden" name="t_search">
                    <li class=""><a href="javascript:goSearch('')"  >
					<h1><i class="fas fa-globe-asia"></i></h1>
					전체 검색</a></li>
                    
					<li class=""><a href="javascript:goSearch('child')" >
					
					<h1><i class="fas fa-child"></i></h1>
					아이들</a></li>
                    
					<li class=""><a href="javascript:goSearch('senior')">
					<h1><i class="fas fa-user"></i></h1>
					어르신</a></li>
                    
					<li class=""><a href="javascript:goSearch('disabled')" >
					<h1><i class="fab fa-accessible-icon"></i></h1>
					장애인</a></li>
                    
					<li class=""><a href="javascript:goSearch('disaster')">
					<h1><i class="fas fa-house-damage"></i></h1>
					재난</a></li>
		</form>			
				</ul>

            <!-- 배너칸-->
            <h3 class="card-news-text-box"><a href="" class="donation-text">카드 뉴스 / 실종 아동 찾기 ></a></h3>
            	
            <div class="grid-list">
                <ul class="list" id="listResult">
                    <li class="grid-item">
                        <a href="javascript: fnGoStory(209);" class="grid-link">
                            <div class="grid-img">
                                <img src="https://static2.smilegatefoundation.org/upload/20211230/1640844830806.png" alt="">		
                            </div>		
                            <dl class="grid-txt">
                                <dt class="title">우리가 만드는 따뜻한 아침, 희망을 담아 드립니다</dt>
                                <dd class="desc">애니팡2 X 애니팡3 기부캠페인 중간 후기</dd>
                                <dd class="date">2021-12-30</dd>
                            </dl>	
                        </a>
                    </li>
                    <li class="grid-item">
                        <a href="javascript: fnGoStory(209);" class="grid-link">
                            <div class="grid-img">
                                <img src="https://static2.smilegatefoundation.org/upload/20211230/1640844830806.png" alt="">		
                            </div>		
                            <dl class="grid-txt">
                                <dt class="title">우리가 만드는 따뜻한 아침, 희망을 담아 드립니다</dt>
                                <dd class="desc">애니팡2 X 애니팡3 기부캠페인 중간 후기</dd>
                                <dd class="date">2021-12-30</dd>
                            </dl>	
                        </a>
                    </li>
                    <li class="grid-item">
                        <a href="javascript: fnGoStory(209);" class="grid-link">
                            <div class="grid-img">
                                <img src="https://static2.smilegatefoundation.org/upload/20211230/1640844830806.png" alt="">		
                            </div>		
                            <dl class="grid-txt">
                                <dt class="title">우리가 만드는 따뜻한 아침, 희망을 담아 드립니다</dt>
                                <dd class="desc">애니팡2 X 애니팡3 기부캠페인 중간 후기</dd>
                                <dd class="date">2021-12-30</dd>
                            </dl>	
                        </a>
                    </li>
                    <li class="grid-item">
                        <a href="javascript: fnGoStory(209);" class="grid-link">
                            <div class="grid-img">
                                <img src="https://static2.smilegatefoundation.org/upload/20211230/1640844830806.png" alt="">		
                            </div>		
                            <dl class="grid-txt">
                                <dt class="title">우리가 만드는 따뜻한 아침, 희망을 담아 드립니다</dt>
                                <dd class="desc">애니팡2 X 애니팡3 기부캠페인 중간 후기</dd>
                                <dd class="date">2021-12-30</dd>
                            </dl>	
                        </a>
                    </li>
                    
                </ul>
            </div>
    </div>

    <!-- paging-->
    <div class="paging" id="paging1">
        <a class="pag-first" href=""><span class="blind">first</span></a> 
        <a class="pag-prev" href=""><span class="blind">prev</span></a>
            <span class="num" data-total="9"> <span class="active" title="현재페이지">1</span> 
                <a href="">2</a>  
                <a href="">3</a>  
                <a href="">4</a>  
                <a href="">5</a>
                <a href="">6</a>
                <a href="">7</a> 
            </span>
        <a class="pag-next" href=""><span class="blind">next</span></a> 
        <a class="pag-last" href=""><span class="blind">last</span></a>
    </div>


</div>
</body>


<%@ include file = "../common_footer.jsp" %>