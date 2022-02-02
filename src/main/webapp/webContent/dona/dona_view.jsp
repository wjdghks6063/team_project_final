<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--##### // Visual & LNB #####-->
<%@ include file = "../common_header_yw.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="css/uk/uikit-rtl.css" />
    <link rel="stylesheet" href="css/uk/uikit.css" />
    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.10.1/dist/js/uikit-icons.min.js"></script>
    <script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script type="text/javascript">

function showfield(name){
  if(name=='Other')document.getElementById('div1').innerHTML='Other: <input type="text" name="other" />';
  else document.getElementById('div1').innerHTML='';
}
	
//업데이트 폼으로
	function goUpdateForm(){
	
		list.t_gubun.value="UpdateForm";
		list.method="post";
		list.action="Donation";
		list.submit();
}
//삭제
	function goDelete(){
	if(confirm("정말 지우시겠습니까?")){
		
		list.method="post";
		list.action="DonaDelte";
		list.submit();
}}

//리스트로
	function goList(){
		list.t_gubun.value="List";
		list.method="post";
		list.action="Donation";
		list.submit();
				
	}
//기부하기 버튼
		function goDona(){
		list.t_gubun.value="Dona";
		list.method="post";
		list.action="Donation";
		list.submit();
				
	}


	    
</script>

<form name="list">
	<input type="hidden" name="t_no" value="${t_no}">
	<input type="hidden" name="t_gubun" >
	<input type="hidden" name="t_total" value="${t_total}">
	<input type="hidden" name="t_session_id" >
	<input type="hidden" name="t_dum" >
	<input type="hidden" name="t_search" value="${t_search}">
</form>
<!-- 서브 -->
   <div class="sub-header sub-header-give">
      <h1 class="sub-title"><span class="text">기 부</span></h1>
      <span class="deco-box"><i class="deco-1"></i><i class="deco-2"></i></span>
   </div>
<div class="contents">  
<div class="tab-3" data-swipe='{"type":"case1","start":".active"}'>
			<ul>
				<li data-act='tab' class="item active"><a href="Donation"><span class="in">기부</span></a></li>
				<li data-act='tab' class="item"><a href="Volunteer"><span class="in">봉사</span></a></li>
				<li data-act='tab' class="item"><a href="LocalNews"><span class="in">지역뉴스</span></a></li>
				<li data-act='tab' class="item"><a href="Missing"><span class="in">실종아동</span></a></li>
			</ul>
		</div>

		<div class="board-view ty-2">
			<div class="board-title">
				<h2 class="title" data-addtitle="this">${t_dto.getTitle()}</h2>
				<p class="title-sub">${t_dto.getDoname()}</span> | ${t_dto.getDominator()} | <i class="fa fa-eye"></i>&nbsp ${t_dto.getHit()}</p>
				<span class="date">${t_dto.getStart_date()} ~ ${fn:substring(t_dto.getEnd_date(), 0,10)}</span>
			</div>

			<div class="board-side" data-grid="{&quot;case&quot;:&quot;pin&quot;, &quot;in&quot;:&quot;.board-view&quot;, &quot;except&quot;:&quot;.header-in&quot;}">
				<div class="inner">
					<!-- 일시/정기기부 -->
						<div class="total">
						<c:set var="gage" value="${t_dto.getTotal() / t_dto.getGoal() *100}"/>
							<span class="value"><strong class="num"><fmt:formatNumber  pattern="###" value="${gage}" /></strong> %</span>
							<span class="progress-3 ir-b i-progress-3"><span class="fill ir-b i-progress-3-fill" style="height:${gage}%;"></span></span>
						</div>
						<dl class="text" id="text2">
							<dt><span class="ir-b i-num-give-2"></span>GIVE</dt>
							<dd><em class="num"> <fmt:formatNumber  pattern="###,###,###,###" value="${t_dto.getTotal()}"/> </em> 원</dd>
							<dt><span class="ir-b i-num-person-2"></span>SUPPORTERS</dt>
							<dd>
								<em class="num">내역서있어야함</em> 명
							</dd>
							<dt><span class="ir-b i-num-goal"></span>GOAL</dt>
							<dd><em class="num"><fmt:formatNumber  pattern="###,###,###,###" value="${t_dto.getGoal()}"/></em> 원</dd>
						</dl>
					
					<!-- 결연 후원 신청 -->
					
					
					<div class="control">
						<!-- 공유하기 // -->
                        
                        <div data-dropdown="" class="share">
                            <button type="button" data-act="title" class="btn-share" id="btn-share"><span class="ir i-share">공유</span></button>
                            <div class="share-open" id="share-open show">
                                <div data-act="cont" id="share-cont" class="share-cont" tabindex="-1">
                                    <span class="share-in">
                                        <a href="javascript:;" onclick="" class="item" data-seq="613" data-img-url="" data-share="facebook" data-cate="hope"><span class="ir-b i-facebook-2"></span><span class="in">페이스북</span></a>
                                        <a href="javascript:;" onclick="" class="item" data-seq="613" data-img-url="" data-share="twitter" data-cate="hope"><span class="ir-b ir-b i-twitter-2"></span><span class="in">트위터</span></a>
                                        <a href="javascript:;" onclick="" class="item"><span class="ir-b i-kakao"></span><span class="in">카카오톡</span></a>
                                        <button type="button" class="copy" onclick="clip(); return false;" title="https://www.smilegatefoundation.org/" data-seq="613" data-img-url="" data-share="url" id="sns_url" data-cate="hope"><span class="in-btn">URL 복사</span></button>
                                    </span>
                                </div>
                            </div>
                             <br>
                        </div>
							<c:choose>
							<c:when test="${t_dto.getGoal() <= t_dto.getTotal()}">
								<button type="button" class="btn-act" style="background-color:gray;" disabled id="a_btn_done">기부종료(목표달성)</button>
							</c:when>
								<c:when test="${t_dto.getGoal() > t_dto.getTotal() && t_dto.getEnd_date() < t_today}">
								<button type="button" class="btn-act" style="background-color:gray;" disabled id="a_btn_done">기부종료(기간만료)</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn-act" id="a_btn">지금 기부하기</button>
							</c:otherwise>
							</c:choose>
					</div>
					
					
				</div>
			</div>
	<style>

	.viewCont{
		
		white-space:pre-wrap;
		padding-top:50px;
		overflow:auto;
		
	}
	</style>
			<div class="board-content">

				<div data-empty="true" style="text-align: center;">
				<div class="viewCont">${t_dto.getContent()}</div>
				
				</div>
			<div class="btn-area">
				<input type="button" onclick="goList()" value="목 록"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
				<input type="button" onclick="goUpdateForm()" value="수 정" class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
				<input type="button" onclick="goDelete()" value="삭 제"class="btn" style="background-color:#f0f0f0;font-family: 'Dongle';">
			</div>
        </div>
    </div>

<!-- 댓글 기능 구현 안함-->



<script>
// 

    var kkeys = [], konami = "38,38,40,40,37,39,37,39,66,65";
$(document).keydown(function(e) {
    kkeys.push( e.keyCode );
    if ( kkeys.toString().indexOf( konami ) >= 0 ){
        kkeys = [];
        alert('안녕하세요');
    }
});

/*공유 버튼 클릭 시 창 열리고 다시 클릭시 꺼짐 'id=share-cont' 에 onclick='toggleDiv() 를 집어넣었으나 모달창으로 교체함*/
/*
function toggleDiv() {
  var div = document.getElementById('share-cont');
  if(div.style.display == 'none')  {
    div.style.display = 'block';
  }else {
    div.style.display = 'none';
  }
}
*/

// 팝업 열기
$(document).on("click", "#btn-share", function (e){
  var target = $(".share-open");
  $(target).addClass("show");
});

// 외부영역 클릭 시 팝업 닫기
$(document).mouseup(function (e){
  var LayerPopup = $(".share-open");
  if(LayerPopup.has(e.target).length === 0){
    LayerPopup.removeClass("show");
  }
});

function clip(){

    var url = '';
    var textarea = document.createElement("textarea");
    document.body.appendChild(textarea);
    url = window.document.location.href;
    textarea.value = url;
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    alert("URL이 복사되었습니다.")
}
</script>

</div>



<!-- 결제 -->
<script>

$(document).ready(function(){
	    $("#a_btn").click(function(){
	    	if(pay.t_id.value==null || pay.t_id.value==""){
	    		alert("회원만 가능합니다");
	    		location.href="Login";
	    	}else{
	        $("#myModal").show();
	    }})})
	    //팝업 Close 기능
	    function close_pop1(flag) {
	         $("#myModal").hide();
	    };
function goPay(){
	var t_dona_money = "";
	
	if(pay.t_id.value==null || pay.t_id.value==""){
		alert("회원만 가능합니다");
		location.href="Login";
	}else{
	
	
	if(pay.t_money_select.value==""){
		alert("금액을 선택해주세요");
		return;
	}if(pay.t_money_select.value=="direct_insert"){
		
		$(pay.t_selected_money).val( $(pay.t_selected_money).val().replace("원", ""));
		$(pay.t_selected_money).val( $(pay.t_selected_money).val().replace(/,/, ""));
			t_dona_money = pay.t_selected_money.value;
			if(t_dona_money < 1000){
				alert("최소 결제금액은 1000원입니다"); return;
			}
	}else{
		t_dona_money = pay.t_money_select.value;
	}
	

	myModal.style.display="none"
		BootPay.request({
			price: t_dona_money, 
			application_id: "61ec4f15e38c3000227b81c9",
			name: pay.t_title.value, 
			pg: 'inicis',
			method: '', 
			show_agree_window: 0, 
			items: [
				{
					item_name: "IseeU"+pay.t_title.value, 
					qty: 1, 
					unique: pay.t_no.value, 
					price: t_dona_money, //상품 단가
					cat1: 'Dona', // 대표 상품의 카테고리 상, 50글자 이내
					cat2: 'disaster', // 대표 상품의 카테고리 중, 50글자 이내
					cat3: '', // 대표상품의 카테고리 하, 50글자 이내
				}
			],
			user_info: {
				username: pay.t_name.value,
				email: pay.t_email.value,
				addr: pay.t_address_1.value+" "+pay.t_address_2.value,
				phone: pay.t_tell.value
			},
			order_id: pay.t_no.value+ new Date().getTime(), 
			params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
			account_expire_at: '2022-01-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
			extra: {
			    start_at: '', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
				end_at: '', // 정기결제 만료일 -  기간 없음 - 무제한
		        vbank_result: 1, 
		        quota: '0', 
				theme: 'custom', 
				custom_background: '#34495e',
				custom_font_color: '#ffffff' 
			}
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
			alert("에러");
			myModal.style.display="block"
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
			alert(data.message);
			myModal.style.display="block"
		}).ready(function (data) {
			// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
			alert("입금계좌");
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			  var urlLocation="Card_Confirm"; 
			/* alert(data.order_id);
			alert(data.card_name);
			alert(data.card_no);
			alert(data.item_name);
			alert(data.method);
			alert(data.method_name);
			alert(data.price);
			alert(data.purchased_at);
			alert(data.receipt_id);
			alert(data.receipt_url); */
			
			var order_id = data.order_id;
			var card_name = data.card_name;
			var card_no = data.card_no;
			var method = data.method;
			var dona_date = data.purchased_at;
			var receipt_id = data.receipt_id;
			var receipt_url = data.receipt_url;
			var item_name = data.item_name;
			var id = pay.t_id.value;
			var amount =  t_dona_money;
			var no = pay.t_no.value;
			$.ajax({
				type : "POST",
				url : urlLocation,
				data: {"t_order_id":order_id, "t_card_name":card_name,"t_card_no":card_no,"t_method":method,"t_dona_date":dona_date,"t_receipt_id":receipt_id,"t_receipt_url":receipt_url,"t_item_name":item_name,"t_id":id,"t_amount":amount,"t_no":no},
				dataType : "text",
				error : function(){
					alert('통신실패!!');
				},
				success : function(data){
					//alert("통신데이터 값 : " + data);
		
		  	Swal.fire({
		  		imageUrl: 'img/pay/odri.jpg',
				 title: '기부가 완료되었습니다',
				 text: '당신의 따뜻한 온기를 꼭 전달해드리겠습니다',
				  width: 800,
				  padding: '3em',
				  color: 'gray',
				  confirmButtonColor: '#353b48',
				  showCancelButton: true,
				  confirmButtonText: '결제내역 확인하러 가기',
				  cancelButtonText: '닫기',
				  cancelButtonColor: '#A9A9A9',
				  reverseButtons: true,
				  showClass: {
					    popup: 'animate__animated animate__fadeInDown'
					  },
					  hideClass: {
						    popup: 'animate__animated animate__fadeOutUp'
						  }
				
		  		}).then((result) => {
					if (result.isConfirmed) { 
						
						pay.method="post";
						pay.action="/Mypage_regular_payment";
						pay.submit();
					  }else{
						  
						  pay.t_gubun.value="View";
							pay.method="post";
							pay.action="Donation";
							pay.submit();
						        }
						}) 
					
				}
			});
			

			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			console.log(data);
		});
	}
}
	function select_check(){
		  var target = document.getElementById('t_selected_money_div');
		  
		  if(pay.t_money_select.value=='direct_insert'){
			  target.style.display="block";
		  }else{
			  target.style.display="none";
		  }
			  
	}
	
</script>	
	<script>
	$(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
		var strVal = $(this).val();

		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;

		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 )
					|| keyID == 46 || keyID == 8 || keyID == 109
					|| keyID == 189 || keyID == 9
					|| keyID == 37 || keyID == 39){

			if(strVal.length > 1 && (keyID == 109 || keyID == 189)){
				return false;
			}else{
				return;
			}
		}else{
			return false;
		}
	});

	$(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
		$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
		$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
	});
	
	$(document).on("focusout", "input:text[koreanCurrency]", function()	{
		$(this).val( $(this).val().replace(",","") );
		$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
		$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
		if($(this).val() != '' ) {
			$(this).val( $(this).val()+'원');
		}		
	});

	$(document).on("focus", "input:text[koreanCurrency]", function()	{	
		$(this).val( $(this).val().replace("원", ""));
	});
</script>

<style>
   .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 999999; /* Sit on top */
        left: 35%;
        top: 15%;
        width: 60%; /* Full width */
        overflow: auto; /* Enable scroll if needed */
		overflow-y: auto;
		
    }

    /* Modal Content/Box */
    .modal-content {
   		 overflow-y: initial !important;
     	z-index: 999999;
        background-color: #fefefe;
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* Could be more or less, depending on screen size */
        border-radius:10px;
  		box-shadow: 9px 2px 44px 1px lightgray;

    }
</style>
<style>
.uk-accordion-title{
	border-bottom: 0.1px solid lightgray;
}
.uk-accordion-title:hover{
	background-color:#353b48;
	color:#ffffff;
}

.modal .modal-content .uk-accordion li.uk-open a{
	background-color:#353b48;
	color:#ffffff;
	padding: 5px 5px 5px 5px;
}

.modal .modal-content p{
margin-left:15px;
font-size:18px;
}
</style>
</body>
<form name="pay">
	<input type="hidden" name="t_id" value="${session_id}">
	<input type="hidden" name="t_dona_money">
	<input type="hidden" name="t_no" value="${t_dto.getNo()}">
	<input type="hidden" name="t_address_1" value="${t_mem_dto.getAddress_1()}">
	<input type="hidden" name="t_address_2" value="${t_mem_dto.getAddress_2()}">
	<input type="hidden" name="t_origin_password" value="${t_mem_dto.getPassword()}">
	<input type="hidden" name="t_gubun">
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
  	<div style="background-color:#353b48; padding:30px 0px 30px 30px;">
  		<h3 style="color:white;margin-bottom:15px;">후원하기</h3><p style="color:white; padding-bottom:10px;">당신의 후원, 소중한 생명을 치료합니다.</p> <p style="color:white;">test</p>
  	</div>
  	<br><br>
    <ul uk-accordion="multiple: true; duration:500;" class="accord" >
    <li class="uk-open">
      <a class="uk-accordion-title" style="text-align:center;font:gulim;padding: 5px 5px 5px 5px;" href="#">후원자 정보 </a>
      <div class="uk-accordion-content">
          <div class="uk-margin">
        <div class="uk-inline" style="margin-bottom:-15px;">
            <span style="font-size:20px;margin-left:25px;color:gray;">이 름: </span>
            <input class="uk-input" style="margin-left:100px;width:285px;height:50px;font-size:22px;" name="t_name" type="text" readonly value="${t_mem_dto.getName()}"> 
        </div>
          <div class="uk-margin">
        <span style="font-size:20px;margin-left:25px;color:gray;">연락처: </span> <input name="t_tell" class="uk-input uk-form-width-medium" style="margin-left: 88px;margin-bottom:5px;width:285px;height:50px;font-size:22px;" type="text" readonly value="${t_mem_dto.getTell()}"><br>
        <span style="font-size:20px;margin-left:25px;color:gray;">이메일: </span> <input name="t_email" class="uk-input uk-form-width-medium" style="margin-left: 88px;margin-bottom:5px;width:285px;height:50px;font-size:22px;" type="text" readonly value="${t_mem_dto.getEmail()}">
    </div>
    </div>
     
		       
      </div>
    </li>
    <li class="uk-open">
      <a class="uk-accordion-title" style="text-align:center;font:gulim;padding: 5px 5px 5px 5px;" href="#">결제정보</a>
      <div class="uk-accordion-content">
		  <span style="font-size:20px;margin-left:25px;color:gray;">후원대상: </span> <input name="t_title" class="uk-input uk-form-width-medium" style="margin-left: 88px;margin-bottom:5px;width:285px;height:50px;font-size:22px;" type="text" readonly value="${t_dto.getTitle()}"><br>      
		  <span style="font-size:20px;margin-left:25px;color:gray;">후원금액: </span>   
       		 <div uk-form-custom="target: > * > span:first-child">
		            <select onchange="select_check()" name="t_money_select" style="margin-left: 88px;margin-bottom:5px;width:285px;height:50px; font-size:14px;">
		                <option value="">후원할 금액을 선택해주세요 ▽</option>
		                <option value="10000">10,000원</option>
		                <option value="30000">30,000원</option>
		                <option value="50000">50,000원</option>
		                <option value="100000">100,000원</option>
		                <option value="direct_insert">직접입력</option>
		            </select>
           		 <button class="uk-button uk-button-default" style="margin-left: 88px;margin-bottom:5px;width:285px;height:50px;font-size:15px;" type="button" tabindex="-1">
            	<span></span>
            </button>
        </div>
        <div id="t_selected_money_div" style="display:none">
       			<input type="text" class="uk-button uk-button-default" name="t_selected_money" numberOnlyMinComma="true" koreanCurrency="true" style="margin-left: 195px;margin-bottom:5px;width:285px;height:50px;font-size:15px;"/>
    </div>   
    </div>
    </li>
    <li>
      <a class="uk-accordion-title" style="text-align:center;font:gulim;padding: 5px 5px 5px 5px;" href="#">후원자의 한마디</a>
      <div class="uk-accordion-content">
            <div class="uk-margin">
            <textarea class="uk-textarea" rows="5" name="t_words" style="resize: none;" placeholder="Textarea"></textarea>
        </div>
      </div>
    </li>
  </ul>
           
        <div class="modal_button" style="margin-top:20px;">
            <p class="uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" onClick="close_pop1();" type="button">취소</button>
            <button class="uk-button uk-button-primary" onClick="goPay();" style="background-color:#2f3640" type="button">결제</button>
        </p>
        </div>
  </div>

</div>
</form>
</div>

<%@ include file = "../common_footer.jsp" %>