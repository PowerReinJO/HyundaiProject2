<%
// 파일명 : /mypage/myorder.jsp
// 작성자 : 신수진, 정기범
// 작성일자 : 2022/12/28
// 주문내역 페이지
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main1.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main2.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="/js/slick/slick.css" crossorigin="anonymous">
<script type="text/javascript">
$(document).ready(function(){
	$(".tab_class_cs").on("click", function(){
		$(".tab_class").removeClass("selected");
		$(this).addClass("selected");
	});
	
	$(".tab_class").on("click", function(){
		$(".tab_class_cs").removeClass("selected");
		$(this).addClass("selected");
	});
});
</script>
</head>
<body class="magiedumatin ">    
<%@ include file="../include/header2.jsp"%>

<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="myshop-wrap">

				<div
					class="xans-element- xans-myshop xans-myshop-asyncbenefit header ">
					<h2>
						Hello, <a href="/mypage/index"><span class="xans-member-var-name"><sec:authentication property="principal.member.mem_name"/></span></a>
					</h2>
				</div>

				<!-- myshop-layout -->
				<div class="myshop-layout">
					<!-- menu-block -->
					<div class="menu-block">
						<ul>
							<li class="js-order active"><a href="/mypage/myorder">주문내역</a></li>
							<li><a href="/mypage/myResell">나의 판매 목록</a></li>
							<li class="js-board"><a href="/mypage/myarticle">내가 쓴 글</a></li>
							<li class="js-modify"><a href="/mypage/modify">내 계정</a></li>
							<li onclick="logoutSubmit();"><a href="javascript:void(0)">로그아웃</a></li>
						</ul>
						
						<form id="logoutFrm" action="/member/logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						</form>
					</div>


					<!-- contents-block -->
					<div class="contents-block">

						<div class="title-block">
							<h2>주문내역</h2>
						</div>
						
					<nav id=tab-button-nav>
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorytab order-tab ">
							<ul class="menu">
								<li class="tab_class selected"><a class="tab-button" data-tab-section="tab-section-1">주문내역조회
										
								</a></li>
								<li class="tab_class_cs tab-button" ><a class="tab-button"
									data-tab-section="tab-section-2">취소내역 
								</a></li>		
							</ul>
						</div>
					</nav>
					<!-- 
						<div class="ul-desc dash text-grey mt30 only-pc">
							<ul>
								<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
								<li>주문번호를 클릭하시면 해당 주문에 대한 상세 내역을 확인하실 수 있습니다.</li>
								<li>주문상태가 "배송준비중"이더라도 실제 상품이 출고된 경우 요청사항이 거부될 수 있습니다.</li>
							</ul>
						</div>
 -->
				<!-- 날짜 검색 -->
			
						<form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
							<div
								class="xans-element- xans-myshop xans-myshop-orderhistoryhead order-search-block ">
								<!-- 
								<ul class="period-rage">
									<li><a href="javascript:void(0);" days="00">오늘</a></li>
									<li><a href="javascript:void(0);" days="07">1주일</a></li>
									<li><a href="javascript:void(0);" days="30">1개월</a></li>
									<li><a href="javascript:void(0);" days="90">3개월</a></li>
									<li><a href="javascript:void(0);" days="180">6개월</a></li>
								</ul>
								 -->
								 <ul class="period-rage">
									<li><a href="#" onclick="dateCal('1');" days="00">오늘</a></li>
									<li><a href="#" onclick="dateCal('2');" days="07">1주일</a></li>
									<li><a href="#" onclick="dateCal('3');"days="30">1개월</a></li>
									<li><a href="#" onclick="dateCal('4');" days="90">3개월</a></li>
									<li><a href="#" onclick="dateCal('5');" days="180">6개월</a></li>
								</ul>
								 
								<ul class="period-search">
									<li><input id="history_start_date"
										name="history_start_date" class="fText hasDatepicker"
										readonly="readonly" size="10" value="" type="text">
									<button type="button" class="ui-datepicker-trigger">
											<img
												src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
												alt="..." title="...">
										</button></li>
									<li>~</li>
									<li><input id="history_end_date" name="history_end_date"
										class="fText hasDatepicker" readonly="readonly" size="10"
										value="" type="text">
										
										<!-- 
									<button type="button" class="ui-datepicker-trigger">
											<img
												src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
												alt="..." title="...">
										</button></li>
										 -->
										
										<!-- 
									<li><button type="submit" id="order_search_btn"
											class="btn btn-dark">
											<span>SEARCH</span>
										</button></li>
										 -->
										 
										 	<li><button type="button" id="order_search_btn"
											class="btn btn-dark order_period_btn" onclick="searchPeriod();">
											<span>SEARCH</span>
										</button></li>
										
								</ul>
							</div>
							<input id="mode" name="mode" value="" type="hidden"> <input
								id="term" name="term" value="" type="hidden">
						</form>
						
				
				<form action="/mypage/myorder" method="get" class="search_product">
					<input type="hidden" name="member_mem_id" class="send_member_id">
					<input type="hidden" name="start_date" class="start_date">
					<input type="hidden" name="end_date" class="end_date">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
									
									
		
						
						<section id="tab-section-1" class="tab-section">
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorylistitem order-list">
							<!--
                        $login_url = /member/login.html
                        $count = 10
                    -->
                   <c:if test="${fn:length(allList) > 0}">	
                    
                    <c:forEach var="List" items="${allList }" varStatus="count">
							<div class="">
								<div class="items-block xans-record- itemlist">
									<div class="item-header ">
										<ul class="info-block">
											<li class="first">
												<ul>
												<c:if test="${List.re_price != null}">
													<span style="color:#E00000; border:1px solid #E00000; padding: 0 3px;"> RESELL </span>
													</c:if>
												
													<li class="sub-title">주문일</li>
													<li class="value">${List.order_date }</li>
													
													<!-- <li class="sub-title">주문번호</li>
													<li class="value"><a
														href="/myshop/order/detail.html?order_id=20221229-0003219&amp;page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29"
														class="line">20221229-0003219</a></li> -->
													<li class="sub-title">결제금액</li>
													<c:if test="${List.re_price == null }">
													<li class="value only-pc"><fmt:formatNumber
																value="${List.pro_price }" type="number" />
													</li>
													</c:if>
													<c:if test="${List.re_price != null}">
													<li class="value only-pc"><fmt:formatNumber
																value="${List.re_price }" type="number" />
													</li>
													</c:if>
												</ul>
											</li>
											<li class="last only-pc">
										
											</li>
										</ul>
									</div>

									<div class="item-prod">
										<div class="block">
											<div class="thumb">
												<a
													href="#"><img
													src="${List.pro_loc }"
													alt=""></a>
											</div>
											<div class="item-desc">
												<div class="detail">
													<div class="name">
														<a
															href="#">
															${List.pro_name }</a>
													</div>
													<div class="option ">[옵션: ${List.pro_opt_size }]</div>
													<div class="quantity text-center">수량: ${List.order_detail_amount }</div>
													<c:if test="${List.re_price == null }">
													<div class="order-price text-right"></div><fmt:formatNumber
																value="${List.pro_price }" type="number" />
																</c:if>
													<c:if test="${List.re_price != null }">
													<div class="order-price text-right"></div><fmt:formatNumber
																value="${List.re_price }" type="number" />
																</c:if>
												
												</div>
											</div>
										</div>
										<div class="status">
											
											<c:if test="${List.order_reg_resell_check == '0' }">
											<button type="button"
												class="btn btn-sm btn-gray btn-pd16"
												onclick="regProduct(${List.pro_opt_id}, ${List.order_no });">
												<span>판매 등록</span>
											</button>
											
											
											
											<li class=""><a class="btn btn-sm btn-gray btn-pd16"
																href="#none"
																onclick="cancelOrder(${List.pro_opt_id}, ${List.order_no })"><span>주문취소</span></a>
											</li>
											</c:if>
											
											<c:if test="${List.order_reg_resell_check == '1' }">
											<p> 판매 등록 완료 </p>
											
											<li class=""><p>주문 취소 불가</p>
											</li>
											</c:if>
											
											
											

											<button type="button"
												class="btn btn-sm btn-gray btn-pd16 displaynone"
												onclick="OrderHistory.getDetailInfo('?product_no=3363&amp;cate_no=26&amp;order_id=20221229-0003219&amp;ord_item_code=20221229-0003219-01');">
												<span>상세정보</span>
											</button>
										</div>
									</div>
								</div>

							</div>
							
							</c:forEach>
							</c:if>
							
							<c:if test="${fn:length(allList) == 0}">	
							
							<div class="empty-block mt40">
								<div class="empty-icon-block line">
									<div class="inner">
										<p>주문 내역이 없습니다.</p>
									</div>
								</div>
							</div>
							</c:if>
							
							<!-- 
							<div
								class="xans-element- xans-myshop xans-myshop-orderhistorypaging paginate">
								<a
									href="?page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021">&lt;&lt;</a>
								<a
									href="?page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021">&lt;</a>
								<a
									href="?page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021"
									class="this xans-record-">1</a> <a
									href="?page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021">&gt;</a>
								<a
									href="?page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021">&gt;&gt;</a>
							</div>
							 -->
						</div>
						</section>
						
                  <!-- 취소 목록 section -->
						<section id="tab-section-2" class="tab-section" hidden>
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorylistitem order-list">
							<!--
                        $login_url = /member/login.html
                        $count = 10
                    -->
                    
                    		<c:if test="${fn:length(cancelList) > 0}">	
                    
                    <c:forEach var="List" items="${cancelList }" varStatus="count">
							<div class="">
								<div class="items-block xans-record- itemlist">
									<div class="item-header ">
										<ul class="info-block">
											<li class="first">
												<ul>
													<li class="sub-title">주문일</li>
													<li class="value">${List.order_date }</li>
													
													<!-- <li class="sub-title">주문번호</li>
													<li class="value"><a
														href="/myshop/order/detail.html?order_id=20221229-0003219&amp;page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29"
														class="line">20221229-0003219</a></li> -->
													<li class="sub-title">결제금액</li>
													<c:if test="${List.re_price == null }">
													<li class="value only-pc"><fmt:formatNumber
																value="${List.pro_price }" type="number" />
													</li>
													</c:if>
													<c:if test="${List.re_price != null}">
													<li class="value only-pc"><fmt:formatNumber
																value="${List.re_price }" type="number" />
													</li>
													<span class="showResell"> 리셀 상품 </span>
													</c:if>
												</ul>
											</li>
											<li class="last only-pc">
										
											</li>
										</ul>
									</div>

									<div class="item-prod">
										<div class="block">
											<div class="thumb">
												<a
													href="#"><img
													src="${List.pro_loc }"
													alt=""></a>
											</div>
											<div class="item-desc">
												<div class="detail">
													<div class="name">
														<a
															href="#">
															${List.pro_name }</a>
													</div>
													<div class="option ">[옵션: ${List.pro_opt_size }]</div>
													<div class="quantity text-center">수량: ${List.order_detail_amount }</div>
													<c:if test="${List.re_price == null }">
													<div class="order-price text-right"></div><fmt:formatNumber
																value="${List.pro_price }" type="number" />
																</c:if>
													<c:if test="${List.re_price != null }">
													<div class="order-price text-right"></div><fmt:formatNumber
																value="${List.re_price }" type="number" />
																</c:if>
													
												
												</div>
											</div>
										</div>
										<div class="status">
											
											
											<p> 환불 완료 </p>
											
						

											
										</div>
									</div>
								</div>

							</div>
							
							</c:forEach>
							</c:if>
							
								<c:if test="${fn:length(cancelList) == 0}">	
							
							<div class="empty-block mt40">
								<div class="empty-icon-block line">
									<div class="inner">
										<p>취소 내역이 없습니다.</p>
									</div>
								</div>
							</div>
							</c:if>
						
						</div>
						</section>
						

					</div>
					<!-- // contents-block -->
				</div>
				<!-- // myshop-layout -->
			</div>
		</div>
	</div>
</div>

	<!-- 리셀 상품 등록 페이지 이동 form -->
	<form action="/resell/register" method="get" class="reg_product">
		<input type="hidden" name="pro_opt_id" class="send_pro_opt_id"> 
		<input type="hidden" name="order_no" class="send_order_no"> 
		<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
	</form>
	
	
	<!-- 주문 취소 form -->
	<form action="/mypage/myorder/cancel" method="post" class="cancel_order">
		<input type="hidden" name="pro_opt_id" class="send_pro_opt_id"> 
		<input type="hidden" name="order_no" class="send_order_no"> 
		<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
	</form>

<script>
function regProduct(pro_opt_id, order_no) {
	
	console.log("상품 id: " + pro_opt_id);
	console.log("주문 id: " + order_no);

	if(confirm('상품 판매에 등록하시겠습니까? (등록시 환불은 불가능 합니다.)'))
	{	
		 
		 $(".send_pro_opt_id").val(pro_opt_id);
		 $(".send_order_no").val(order_no);
		 $(".reg_product").submit();
	}
}
 
</script>

 <script>

function cancelOrder(pro_opt_id, order_no) {
	
	console.log("상품 id: " + pro_opt_id);
	console.log("주문 번호: " + order_no);
	if(confirm('해당 주문을 취소하시겠습니까?')) {
	
		$(".send_pro_opt_id").val(pro_opt_id);
		$(".send_order_no").val(order_no);
		$(".cancel_order").submit();
	}
	
}
</script>
 
<script>
	const $nav = document.querySelector('#tab-button-nav')
	console.log("$nav의 값은 무엇이지? " + $nav);
	const $sections = document.querySelectorAll('.tab-section');
	
	 $nav.addEventListener('click', (e) => {
	      if (!e.target.classList.contains('tab-button')) {
	    	  console.log("return!!");
	        return;
	      }
	      
	      const selectedTab = e.target.dataset.tabSection;
	      console.log(selectedTab);
	      
	      $sections.forEach(($section) => {
	          if ($section.id === selectedTab) {
	            $section.removeAttribute('hidden');
	          } else {
	            $section.setAttribute('hidden', true);
	          }
	        });
	      });

</script>



<script>
function dateCal(val){
	
	console.log("들어오니?");
	
	dateFormatter = function(newDay, today) {
		let year = newDay.getFullYear();
		let month = newDay.getMonth()+1;
		let date = newDay.getDate();
		
		if(today) {
			
			let todayDate = today.getDate();
			
			if(date != todayDate) {
				if(month == 0)	year-=1
				month = (month + 11) % 12;
				date = new Date(year, month, 0).getDate();
			}
		}
		
		month = ("0"+month).slice(-2);
		date = ("0"+date).slice(-2);
		
		return year+"-"+month+"-"+date;
	}

	let newDate = new Date();
	let nowDate = new Date();
	
	if(val == 1) {
		console.log("당일");
		let calNewDate = newDate.getDate();
		newDate.setDate(calNewDate);
		newDate = dateFormatter(newDate);
				
		$('#history_start_date').val(newDate);
		$('#history_end_date').val(newDate);
		
	} else if(val == 2) {
	console.log("일주일");
	let calNewDate = newDate.getDate()-7;
	let calNowDate = nowDate.getDate();
	
	nowDate.setDate(calNowDate);
	newDate.setDate(calNewDate);
	
	newDate = dateFormatter(newDate);
	nowDate = dateFormatter(nowDate);
	
	$('#history_start_date').val(newDate);
	$('#history_end_date').val(nowDate);
	
	} else if(val == 3) {
		console.log("한달");	
		
		let calNewDate = newDate.getMonth()-1;
		let calNowDate = nowDate.getDate();
		
		newDate.setMonth(calNewDate);
		nowDate.setDate(calNowDate);

		newDate = dateFormatter(newDate);
		nowDate = dateFormatter(nowDate);
		
		console.log("변환 됫엇나? " + newDate);
	
		$('#history_start_date').val(newDate);
		$('#history_end_date').val(nowDate);
	} else if(val == 4) {
		console.log("3달");
		
		let calNowDate = nowDate.getDate();
		let calNewDate = newDate.getMonth()-3;
		
		newDate.setMonth(calNewDate);
		nowDate.setDate(calNowDate);

		newDate = dateFormatter(newDate);
		nowDate = dateFormatter(nowDate);
		
		console.log("변환 됫엇나? " + newDate);
		
		$('#history_start_date').val(newDate);
		$('#history_end_date').val(nowDate);
	} else if(val == 5) {
		console.log("6달");
				
		let calNewDate = newDate.getMonth()-6;
		let calNowDate = nowDate.getDate();

		newDate.setMonth(calNewDate);
		nowDate.setDate(calNowDate);

		newDate = dateFormatter(newDate);
		nowDate = dateFormatter(nowDate);
		
		console.log("변환 됫엇나? " + newDate);
		
		$('#history_start_date').val(newDate);
		$('#history_end_date').val(nowDate);
	}
}

</script>

<script>

function searchPeriod() {
	
	let startDate=$('#history_start_date').val();
	let endDate=$('#history_end_date').val();
	
	console.log(startDate);
	console.log(endDate);
	
	 $(".start_date").val(startDate);
	 $(".end_date").val(endDate);
	 $(".search_product").submit();

}

</script>




<%@ include file="../include/footer.jsp"%>