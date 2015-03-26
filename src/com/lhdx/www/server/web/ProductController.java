package com.lhdx.www.server.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.service.ProductService;

@Controller
@RequestMapping(value = "/service")
public class ProductController {

	@Resource(name = "productService")
	private ProductService productService;
	
	@RequestMapping(value = "/findProducts",method = RequestMethod.POST)
	public @ResponseBody
	List findProducts() {
		return productService.findProducts();
	}
	
	@RequestMapping(value = "/exchangeProduct",method = RequestMethod.POST)
	public @ResponseBody
	String addContact(
			@RequestParam("name") String name,
			@RequestParam("phone") String phone,
			@RequestParam("wxId") String wxId,
			@RequestParam("productId") String productId,
			@RequestParam(value = "addr", required = false)  String addr) {
		productService.insertOrder(name, phone,wxId, productId,addr);
		return "{success:true,msg:'保存成功!'}";
	}
}
