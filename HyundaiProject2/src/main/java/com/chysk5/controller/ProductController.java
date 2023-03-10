package com.chysk5.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chysk5.domain.ProductCriteria;
import com.chysk5.domain.ProductDTO;
import com.chysk5.domain.ProductImgDTO;
import com.chysk5.domain.ProductPageDTO;
import com.chysk5.domain.ProductSizeDTO;
import com.chysk5.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
/*
 * 작성자 : 김주혜
 */
@Controller
@Log4j
@RequestMapping("/product/")
@RequiredArgsConstructor
public class ProductController {

	private final ProductService service;
	
//	상품 리스트
//	작성자 : 김주혜
	@GetMapping("list/{category}")
	public String productList(@PathVariable("category") String category, Model model, ProductCriteria criteria) {
		log.info("call productController........");
		log.info(category);
		List<ProductDTO> list = service.getPListDB(category,criteria);
		log.info(list);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		int total = service.getTotal(category);
		model.addAttribute("pageMaker",new ProductPageDTO(criteria, total));
		return "product/list";

	}
	
//	상품 상세페이지
//	작성자 : 김주혜
	@GetMapping("option/{pro_id}")
	public String productOption(@PathVariable("pro_id") String pro_id, Model model) {
		log.info("call productOptionController..........");
		log.info(pro_id);
		ProductDTO product = service.getProductOption(pro_id);
		List<ProductSizeDTO> sizeList = service.getProductSize(pro_id);
		List<ProductImgDTO> imgList = service.getProductImg(pro_id);
		log.info(product);
		log.info(sizeList);
		log.info(imgList);
		model.addAttribute("product", product);
		model.addAttribute("sizeList", sizeList);
		model.addAttribute("imgList", imgList);
		return "product/option";
	}
	
//  검색 상품
//	작성자 : 김주혜
	@PostMapping("search")
	public String productSearch(@RequestParam String keyword, Model model) {
		log.info("productSearch controller..............");
		log.info(keyword);
		List<ProductDTO> list = service.getProductSearch(keyword);
		log.info(list);
		if(list.size() == 0) {
			return "product/error";
		}else {
			model.addAttribute("list", list);
			return "product/search";
		}
	}
	
//		신상품 리스트
//		작성자 : 김주혜
		@GetMapping("newIn")
		public String productList (Model model) {

			log.info("call newInController........");


			List<ProductDTO> nList = service.getNewIn();
			
			log.info(nList);
			
			model.addAttribute("nList", nList);
			
			
			return "product/newIn";

		}

}
