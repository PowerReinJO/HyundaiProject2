<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/main1.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="/js/slick/slick.css"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/mypage/modifyResell.css">

<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="myshop-wrap">

				<div
					class="xans-element- xans-myshop xans-myshop-asyncbenefit header ">
					<h2>
						Hello, <span><span class="xans-member-var-name">정기범</span></span>
					</h2>
				</div>

				<!-- myshop-layout -->
				<div class="myshop-layout">
					<!-- menu-block -->
					<div class="menu-block">
						<ul>
							<li class="js-order active"><a
								href="/myshop/order/list.html">주문내역</a></li>


							<li class="js-board"><a
								href="/board/consult/list.html?board_no=9">1:1 문의</a></li>
							<li class="js-recent"><a
								href="/product/recent_view_product.html">최근 본 상품</a></li>
							<li class="js-modify"><a href="/member/modify.html">나의 판매 목록</a></li>
							<li class="js-modify"><a href="/member/modify.html">내 계정</a></li>
							<li><a href="/exec/front/Member/logout/">로그아웃</a></li>
						</ul>
					</div>


					<!-- contents-block -->
					<div class="contents-block">

						<div class="title-block">
							<h2>판매 내역</h2>
						</div>

						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorytab order-tab ">
							<ul class="menu">
								<li class="tab_class selected"><a
									href="/myshop/order/list.html?history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021">판매
										내역 조회 <sup>(<span id="xans_myshop_total_orders">1</span>)
									</sup>
								</a></li>
								<li class="tab_class_cs"><a
									href="/myshop/order/list.html?mode=cs&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29&amp;past_year=2021">취소/반품/교환
										내역 <sup>(<span id="xans_myshop_total_orders_cs">0</span>)
									</sup>
								</a></li>

							</ul>
						</div>

						<div class="ul-desc dash text-grey mt30 only-pc">
							<ul>
								<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
								<li>주문번호를 클릭하시면 해당 주문에 대한 상세 내역을 확인하실 수 있습니다.</li>
								<li>주문상태가 "배송준비중"이더라도 실제 상품이 출고된 경우 요청사항이 거부될 수 있습니다.</li>
							</ul>
						</div>

						<form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
							<div
								class="xans-element- xans-myshop xans-myshop-orderhistoryhead order-search-block ">
								<ul class="period-rage">
									<li><a href="javascript:void(0);" days="00">오늘</a></li>
									<li><a href="javascript:void(0);" days="07">1주일</a></li>
									<li><a href="javascript:void(0);" days="30">1개월</a></li>
									<li><a href="javascript:void(0);" days="90">3개월</a></li>
									<li><a href="javascript:void(0);" days="180">6개월</a></li>
								</ul>
								<ul class="period-search">
									<li><input id="history_start_date"
										name="history_start_date" class="fText hasDatepicker"
										readonly="readonly" size="10" value="2022-09-30" type="text">
										<button type="button" class="ui-datepicker-trigger">
											<img
												src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
												alt="..." title="...">
										</button></li>
									<li>~</li>
									<li><input id="history_end_date" name="history_end_date"
										class="fText hasDatepicker" readonly="readonly" size="10"
										value="2022-12-29" type="text">
										<button type="button" class="ui-datepicker-trigger">
											<img
												src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
												alt="..." title="...">
										</button></li>
									<li><button type="submit" id="order_search_btn"
											class="btn btn-dark">
											<span>SEARCH</span>
										</button></li>
								</ul>
							</div>
							<input id="mode" name="mode" value="" type="hidden"> <input
								id="term" name="term" value="" type="hidden">
						</form>
						<div
							class="xans-element- xans-myshop xans-myshop-orderhistorylistitem order-list">
							<!--
                        $login_url = /member/login.html
                        $count = 10
                    -->
							<div class="">

								<c:forEach var="List" items="${myResellList }" varStatus="count">


									<div class="items-block xans-record" id="resell${count.index }">
										<div class="item-header ">
											<ul class="info-block">
												<li class="first">
													<ul>
														<li class="sub-title">등록 날짜</li>
														<li class="value">${List.re_regdate}</li>

														<!--  
													<li class="sub-title">주문번호</li>
													<li class="value"><a
														href="/myshop/order/detail.html?order_id=20221229-0003219&amp;page=1&amp;history_start_date=2022-09-30&amp;history_end_date=2022-12-29"
														class="line">20221229-0003219</a></li>
														 -->

														<li class="sub-title">판매 예정 금액</li>
														
													</ul>
												</li>
												<li class="last only-pc">
													<ul>
														<li class=""><a
															class="btn btn-sm btn-gray btn-pd16 cancelBtn"
															href="#none"
															onclick="cancelResell(${List.pro_opt_id }, ${count.index })"><span>등록
																	취소</span></a></li>
													</ul>
												</li>
											</ul>
										</div>

										<div class="item-prod">
											<div class="block">
												<div class="thumb">
													<a
														href="/product/detail.html?product_no=3363&amp;cate_no=26"><img
														src="${List.pro_loc }"
														onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
														alt=""></a>
												</div>
												<div class="item-desc">
													<div class="detail">
														<div class="name">
															<a
																href="/product/detail.html?product_no=3363&amp;cate_no=26">${List.pro_name }</a>
														</div>
														<div class="option ">[옵션: "${List.pro_opt_size }" ]</div>
														<div class="price text-center">
															판매 가격:
														</div>


													</div>
												</div>
											</div>
											<div class="status">

												<button type="button" class="btn btn-sm btn-gray btn-pd16"
													onclick="showModifyPrice();">
													<span>가격 수정</span>
												</button>
											</div>
										</div>
									</div>
									
 
  							<!-- size modal창-->
							<div class="background show" id="resellModal">
								<div class="window">
									<div class="popup">
										<table class="type06">

										</table>
										<div id="closeModal">
											<button type="button"
												class="btn btn-order btn-dark btn-full close-resell-btn"
												onclick="close_modal();">
												<span id="closeModalPrice">창 닫기</span></button>
										</div>
									</div>
								</div>
							</div>
 
 
								</c:forEach>

							</div>




							<!-- 등록한 상품 내역이 없을 경우 -->
							<div class="empty-block mt40 displaynone">
								<div class="empty-icon-block line">
									<div class="inner">
										<p>주문 내역이 없습니다.</p>
									</div>
								</div>
							</div>


							<!-- 페이징 처리 -->
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
						</div>

					</div>
					<!-- // contents-block -->
				</div>
				<!-- // myshop-layout -->
			</div>
		</div>
	</div>
</div>

<script>

function cancelResell(pro_opt_id, count) {
	
	console.log("pro_opt_id: " + pro_opt_id);
	console.log("count: " + count);
	
	   var csrfHeadName="${_csrf.headerName}";
	   var csrfTokenValue="${_csrf.token}";
	
	   if(confirm('해당 상품을 삭제하시겠습니까?'))
		{
		   
		   	$.ajax({
		      type: "delete",
		      url: "/mypage/myResell/" + pro_opt_id,
		      beforeSend : function(xhr) {
		           xhr.setRequestHeader(csrfHeadName, csrfTokenValue);
		       },
		      data: pro_opt_id,
		      success: function(data) {
		    	  $('div'+"#resell"+count).fadeOut();
		      },
		      error : function(error){
		          console.log(error);   
		       }
		   })
		   
	   
		}

}

</script>

<script>

function showModifyPrice() {
		
	console.log("hihoi")
		const resellModal = document
				.getElementById("resellModal")
		resellModal.style.display = "flex"
}

function close_modal() {
	const resellModal = document
			.getElementById("resellModal")
	resellModal.style.display = "none"
}

</script>

<%@ include file="../include/footer.jsp"%>