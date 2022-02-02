<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--페이지 css-->
<link href="css/mypage-menu.css" rel="stylesheet">
 <!-- UIkit CSS -->
 <link rel="stylesheet" href="css/uk/uikit-rtl.css" />
 <link rel="stylesheet" href="css/uk/uikit.css" />
 <!-- UIkit JS -->
 <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit-icons.min.js"></script>
 <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
<form name="goPage">
	<input type="hidden" name="t_gubun">
</form>

<script>
	function goHome(){
		goPage.t_gubun.value="Home";
		goPage.method="post";
		goPage.action="Manager";
		goPage.submit();
	}
	
	function goDona(){
		goPage.t_gubun.value="Dona";
		goPage.method="post";
		goPage.action="Manager";
		goPage.submit();
	}
	
	function goSearch(){
		management.method="post";
		management.action="Member_manage";
		management.submit();
	}
	function goVol(){
		goPage.t_gubun.value="Vol";
		goPage.method="post";
		goPage.action="Manager";
		goPage.submit();
	}
	function goProc(order){  //이 자바스크립트는 체크박스 도이ㅓ 이쓴 상품의 순번에 맞는 구분(히든으로 넘겨줄)값을 넣어주기 위해 처리하는 자바스크립트
		//alert(order);
		if(typeof(management.elements['t_chk[]'].length)=="undefined"){ //배열이 아니면~ 처리    if(typeof로 length까지 감싸줘야됨) typeof는 정의되지 않은 것 등 문자열처리가 불가능한 오류 경고 등을 인식하고 처리하는 방법이다
			if(management.elements['t_chk[]'].checked==true){ //체크가 되어있으면 밑에 실행(값넣기)	
				var email = 	management.elements['t_chk[]'].value;  //t_chk박스놈의 순번을 가져와서 no에 담아라 elements를 사용하는 이유는 대괄호(배열)가 된놈에 대해서 작업을 하다보니
				management.elements['t_email[]'].value=email;  //인풋상자가 t_no인놈한테 11-->(아프론)(no를 넣어야됨) 을 넣겠다 elements를 이용해야된다
			}else{
				management.elements['t_email[]'].value="";
			}
		}else{
			if(management.elements['t_chk[]'][order].checked==true){ //체크가 되어있으면 밑에 실행(값넣기)	
				var email = 	management.elements['t_chk[]'][order].value;  //t_chk박스놈의 순번을 가져와서 no에 담아라 elements를 사용하는 이유는 대괄호(배열)가 된놈에 대해서 작업을 하다보니
				management.elements['t_email[]'][order].value=email;  //인풋상자가 t_no인놈한테 11-->(아프론)(no를 넣어야됨) 을 넣겠다 elements를 이용해야된다
				
			}else{
				management.elements['t_email[]'][order].value="";
			}
		}
			// management.method="post";
			// management.action="notice_list_jang_receive.php";
			// management.submit();
	}


				//올체크 
				function allCheck(){
					//alert(typeof(management.elements['t_chk[]'].length));
			if(typeof(management.elements['t_chk[]'].length)=="undefined"){//배열이냐 아니냐
				//배열 아닐 때
				if(management.chkAll.checked==true){
					management.elements['t_chk[]'].checked=true;
					var email = 	management.elements['t_chk[]'].value;  //t_chk박스놈의 순번을 가져와서 no에 담아라 elements를 사용하는 이유는 대괄호(배열)가 된놈에 대해서 작업을 하다보니
					management.elements['t_email[]'].value=email;
				}else{
					management.elements['t_chk[]'].checked=false;
					management.elements['t_email[]'].value="";
				}
			}else{
				//배열일 때
				var len = management.elements['t_chk[]'].length; //배열의 길이
				for(var k=0;k<len;k++){
					if(management.chkAll.checked==true){
						management.elements['t_chk[]'][k].checked=true;
						var email = 	management.elements['t_chk[]'][k].value;  //t_chk박스놈의 순번을 가져와서 no에 담아라 elements를 사용하는 이유는 대괄호(배열)가 된놈에 대해서 작업을 하다보니
						management.elements['t_email[]'][k].value=email;  
					}else{
						management.elements['t_chk[]'][k].checked=false;
						management.elements['t_email[]'][k].value="";
					}
				}
			}
		}
				
				
				
				function goEmail(){
				
					if(typeof(management.elements['t_chk[]'].length)=="undefined"){ 
						//배열 아닌경우 체크가 하나도 안됐을 때 안넘기기
						if(management.elements['t_chk[]'].checked==false){
							alert("이메일 보낼 사람을 체크하세요"); 
							return; 
						}
						if(management.elements['t_chk[]'].checked==true && management.elements['t_info_yn_check[]'].value == "n"){
							alert("정보 수신 미동의자가 포함되어 있습니다."); return;
						}
					
						else{
							management.method="post";
							management.action="Member_email";
							management.submit();
						}

					}else{
						//배열인경우 체크가 하나도 안됐을 때 안넘기기
						var len = management.elements['t_chk[]'].length; //배열의 길이
						for(var k=0;k<len;k++){
							if(management.elements['t_chk[]'][k].checked==true && management.elements['t_info_yn_check[]'][k].value == "n"){
								alert("정보 수신 미동의자가 포함되어 있습니다."); return;
							}
						}
						var chkCount=0;
						var len = management.elements['t_chk[]'].length; //배열의 길이
							for(var k=0;k<len;k++){
								if(management.elements['t_chk[]'][k].checked==true){
									chkCount++;
								}
							}
							if(chkCount==0){
								alert("이메일 보낼 사람을 체크하세요");
								return;
							}else{
								management.method="post";
								management.action="Member_email";
								management.submit();
							}
					
			}}
</script>
<style>
.ttable th{
	background-color:lightgray;
}	
</style>
<body>
<div id="containar">
    <div class="my-page-box">
        <div class="my-list-left">
            <div class="my-profile">
                <div class="my_profile_nickname">
                    <span class="ellipsis" id="nickNameArea">${session_name}</span>
                </div>
                <div class="my_profile_id" id="maskingIdArea">${session_id}</div>
            </div>
            <div id="lnb" class="my_lnb" role="menu">
                <a href="javascript:goHome()" role="menuitem" class="my_lnb_item" id="lnb_my_home" aria-current="false">MY홈</a> 
                <a href="javascript:goDona()" role="menuitem" class="my_lnb_item" id="lnb_my_notification" aria-current="false">기부</a>
                <a href="javascript:goVol()" role="menuitem" class="my_lnb_item" id="lnb_my_activity" aria-current="false">봉사</a>  
                <a href="javascript:location.reload()"role="menuitem" class="my_lnb_item" id="lnb_my_tax" aria-current="true">회원 관리</a>
            </div>
        </div>
        <form name="management">
        <input type="hidden" name="t_gubun">
        <div role="main" id="content" class="my_content">
            <h3 class="my_title">회원관리</h3>
                <form target="_self">
                    <fieldset style="border:1px solid lightgray;padding:20px 20px 2px 20px;">
                       <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
			           	<span style="margin-left:5px;">회원구분 :</span>  
			           	<label><input class="uk-checkbox" style="margin-left:-20px;width:14px;height:14px;margin-top:-2px;" type="radio" name="t_member_gubun"> 전체회원</label>
			           	<label><input class="uk-checkbox" style="width:14px;height:14px;margin-top:-2px;margin-left:-20px;" type="radio" name="t_member_gubun"> 일반회원</label>
			            <label><input class="uk-checkbox" style="margin-left:-20px;width:14px;height:14px;margin-top:-2px;" type="radio" name="t_member_gubun"> 카카오회원</label>
			        </div>
                 <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
			           	<span style="margin-left:5px;">수신동의 :</span>  
			           	<label><input class="uk-checkbox" style="width:14px;height:14px;margin-top:-2px;margin-left:-20px;" type="radio" name="t_info_yn" value="" <c:if test="${t_info_yn eq ''}"> checked</c:if>> 전체</label>
			           	<label><input class="uk-checkbox" style="width:14px;height:14px;margin-top:-2px;margin-left:-20px;" type="radio" name="t_info_yn" value="y" <c:if test="${t_info_yn eq 'y'}"> checked</c:if>> 동의자</label>
			            <label><input class="uk-checkbox" style="margin-left:-20px;width:14px;height:14px;margin-top:-2px;" type="radio" name="t_info_yn" value="n" <c:if test="${t_info_yn eq 'n'}"> checked</c:if>> 미동의자</label>
			        </div>
			            <div class="uk-margin">
					            <select class="uk-select" style="height:30px;width:unset;"  id="form-stacked-select" name="t_select">
					                <option style="margin-left:-5px;" value="name" <c:if test="${t_select eq 'name'}"> selected</c:if>>성함</option>
					                <option style="margin-left:-5px;" value="email" <c:if test="${t_select eq 'email'}"> selected</c:if>>이메일</option>
					                <option style="margin-left:-5px;" value="tell" <c:if test="${t_select eq 'tell'}"> selected</c:if>>연락처</option>
					            </select>
					  
					            <input class="uk-input" style="height:30px;width:unset;" id="form-stacked-text" type="text" name="t_search" value="${t_search}">
					              <button type="button" class="uk-button uk-button-default uk-button-small" onclick="goSearch()">검색</button>
					  </div>
					  <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
			           	<span style="margin-left:5px;">기타 :</span>  
			            <button type="button" class="uk-button uk-button-default uk-button-small" style="margin-top:-5px;" id ="a_btn">탈퇴회원</button>
			        </div>
                    </fieldset>	

                   <div class="uk-overflow-auto">
    <table class="uk-table uk-table-hover uk-table-middle uk-table-divider" class="ttable" style="border:1px solid lightgray; margin-top:20px; border-bottom:1px solid lightgray;">
        <thead>
            <colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="22%">
					<col width="22%">
					<col width="15%">
					<col width="15%">
				</colgroup>
            <tr>
            	<th class="uk-table-shrink"> <input class="uk-checkbox" type="checkbox" name="chkAll" onchange="allCheck()"></th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">아이디</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">성 함</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">이메일</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">연락처</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">가입일</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">정보수신동의</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">상세보기</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${t_dtos}" var="dtos" varStatus="status">
            <tr>
              <td ><input class="uk-checkbox" class="mem_check" type="checkbox" onchange="goProc(${status.index})" name="t_chk[]" value="${dtos.getEmail()}"></td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${dtos.getId()} </td>
              <td  style="text-align:center;font-size:12px;"  class="uk-text-truncate">${dtos.getName() } </td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${dtos.getEmail()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${dtos.getTell()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${dtos.getReg_date()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate"><c:choose><c:when test="${dtos.getInfo_yn() eq 'y'}"> O </c:when><c:otherwise></c:otherwise></c:choose></td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">상세보기 </td>
              <input type="hidden" name="t_email[]" size="30">
              <input type="hidden" name="t_info_yn_check[]" value="${dtos.getInfo_yn()}">
            </tr>
            </c:forEach>
        </tbody>
    </table>
   	<p uk-margin style="float:right;">
    <button type="button" class="uk-button uk-button-default" onclick="goEmail()">메일전송</button>
</p>
 
  
</div>
                </form>
        </div>
        </form>
    </div>
        <script>
            var kkeys = [],
                konami = "38,38,40,40,37,39,37,39,66,65";
            $(document).keydown(function (e) {
                kkeys.push(e.keyCode);
                if (kkeys.toString().indexOf(konami) >= 0) {
                    kkeys = [];
                }
            });
            
            //전문보기 모달
      	  $(document).ready(function(){
      		    $("#a_btn").click(function(){
      		        $("#myModal").show();
      		    })})
      		    //팝업 Close 기능
      		    function close_pop1(flag) {
      		         $("#myModal").hide();
      		    };
      				
        </script>

<%@ include file="../common_footer.jsp"%>
</body>
</html>
	<!-- 탈퇴회원 -->
 <div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
            <table class="uk-table uk-table-hover uk-table-middle uk-table-divider" class="ttable" style="border:1px solid lightgray; margin-top:20px; border-bottom:1px solid lightgray;">
        <thead>
            <colgroup>
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="25%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
				</colgroup>
            <tr>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">아이디</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">성 함</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">연락처</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">이메일</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">가입일</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap">탈퇴일</th>
                <th style="text-align:center;" class="uk-table-shrink uk-text-nowrap"><a href="javascript:goView()">상세보기</a></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${t_exit_mem_dtos}" var="exit_dtos" >
            <tr>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${exit_dtos.getId()} </td>
              <td  style="text-align:center;font-size:12px;"  class="uk-text-truncate">${exit_dtos.getName() } </td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${exit_dtos.getTell()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${exit_dtos.getEmail()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${exit_dtos.getReg_date()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">${exit_dtos.getExit_date()}</td>
              <td  style="text-align:center;font-size:12px;" class="uk-text-truncate">상세보기 </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
            <div class="modal_button" style="margin-top:20px;">
            <p class="uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" onClick="close_pop1();" type="button">닫기</button>
        </p>
        </div>
  </div>

</div>
<style>
   .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 10; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
         background: rgba(0, 0, 0, 0.8);
		overflow-y: auto;
    }

    /* Modal Content/Box */
    .modal-content {
   		 overflow-y: initial !important;
     	z-index: 10;
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */
    }
</style>