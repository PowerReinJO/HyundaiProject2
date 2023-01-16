package com.chysk5.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.chysk5.domain.AllBuyProductDTO;
import com.chysk5.domain.BuyProductDTO;
import com.chysk5.domain.CancelProductDTO;
import com.chysk5.domain.ReplyDTO;
import com.chysk5.domain.TalksDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*********************************
 * @function : MyPageMapperTests
 * @author : Sujin Shin, Kibeom Chung
 * @Date : Jan 08. 2023.
 * 마이페이지 매퍼 테스트
*********************************/
@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MyPageMapperTests {


	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;
	
	/*
	@Test
	public void testGetMyResellList() {
		
		
		List<MyResellProductDTO> getList = mapper.getMyResellList("kb");
		
		for(MyResellProductDTO a : getList) {
			log.info("등록한 리셀 상품: " + a);
		}
	}
	*/
	
	@Test
	public void testModifyPrice() {
		
		mapper.modifyPrice("34", 90000);
		
	}
	
	@Test
	public void testGetBuyProduct() {
		List<BuyProductDTO> list = mapper.getBuyProduct("kb");
		
		for(BuyProductDTO a : list) {
			log.info(a);
		}
	}

//	@Test
//	public void testAllList() {
//		List<AllBuyProductDTO> list = mapper.getAllList("kb");
//		
//		for(AllBuyProductDTO a : list) {
//			log.info(a);
//		}
//	}
	
	// 신수진
	// 총 구매 금액
	@Test
	public void testTotalOrderPrice() {
		log.info("test total order price....");
		
		int result = mapper.totalOrderPrice("aaaa1");
		
		log.info("result : " + result);
	}
	
	// 신수진
	// 총 구매 횟수
	@Test
	public void testTotalOrderCount() {
		log.info("test total order count.....");
		
		int result = mapper.totalOrderCount("jinjin");
		
		log.info("result : " + result);
	}
	
	// 신수진
	// 내가 쓴 글
	@Test
	public void testSelectMyTalks() {
		log.info("test select my talks.....");
		
		List<TalksDTO> list = mapper.selectMyTalks("jinjin");
		
		for(TalksDTO a : list) {
			log.info(a);
		}
	}	
	
	// 신수진
	// 내가 쓴 댓글
	@Test
	public void testSelectMyReply() {
		log.info("test select my reply.....");
		
		List<ReplyDTO> list = mapper.selectMyReply("jinjin");
		
		for(ReplyDTO a : list) {
			log.info(a);
		}
	}
	
	@Test
	public void testCancelList() {
		
		List<CancelProductDTO> list = mapper.getCancelList("kb", null, null);
		for(CancelProductDTO a : list) {
			log.info(a);
		}
		
		
	}
}
