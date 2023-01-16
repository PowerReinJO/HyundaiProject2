package com.chysk5.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chysk5.domain.AllBuyProductDTO;
import com.chysk5.domain.BuyProductDTO;
import com.chysk5.domain.CancelProductDTO;
import com.chysk5.domain.MyResellProductDTO;
import com.chysk5.domain.ReplyDTO;
import com.chysk5.domain.SoldOutProductDTO;
import com.chysk5.domain.TalksDTO;

/*********************************
 * @function : MyPageMapper
 * @author : Sujin Shin, Kibeom Chung
 * @Date : Dec 30. 2022.
 * 마이페이지 SQL 호출을 위한 매퍼
*********************************/
public interface MyPageMapper {
	
	// 판매중인 상품 목록 - test 작성
	public List<MyResellProductDTO> getMyResellList(@Param("mem_id") String mem_id, @Param("start_date") String start_date, @Param("end_date") String end_date);
	
	// 판매완료된 상품 목록 - test 작성
	public List<SoldOutProductDTO> getMySoldOutList(@Param("mem_id") String mem_id, @Param("start_date") String start_date, @Param("end_date") String end_date);
	
	// 모든 구매 목록 - test 작성
	public List<AllBuyProductDTO> getAllList(@Param("mem_id") String mem_id, @Param("start_date") String start_date, @Param("end_date") String end_date);
	
	// 주문 상품 취소 - test 작성
	public int cancelOrder(@Param("pro_opt_id") String pro_opt_id, @Param("order_no") String order_no);
	
	// 주문 취소 상품 목록 - test 작성
	public List<CancelProductDTO> getCancelList(@Param("mem_id") String mem_id, @Param("start_date") String start_date, @Param("end_date") String end_date);

	// 리셀 상품 등록 취소 - 수정 필요
	public int removeMyResellProduct(@Param("pro_opt_id") String pro_opt_id, @Param("mem_id") String mem_id);
	
	// 리셀 상품 가격 수정 - test 작성
	public int modifyPrice(@Param("re_id") String re_id, @Param("re_price") int re_price);
	
	// 구매 목록 - test 작성
	public List<BuyProductDTO> getBuyProduct(String mem_id);
	
	// 총 구매 금액
	public int totalOrderPrice(String mem_id);
	
	// 총 구매 횟수
	public int totalOrderCount(String mem_id);
	
	// 내가 쓴 글 조회
	public List<TalksDTO> selectMyTalks(String mem_id);
	
	// 내가 쓴 댓글 조회
	public List<ReplyDTO> selectMyReply(String mem_id);
}
