package com.lhdx.www.server.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.lhdx.www.server.model.User;
import com.lhdx.www.server.service.UserService;
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
	
	@RequestMapping(value = "/exchangeProduct2",method = RequestMethod.POST)
	public @ResponseBody
	String exchangeProduct(
			@RequestParam("name") String name,
			@RequestParam("phone") String phone,
			@RequestParam("productId") String productId,
			@RequestParam(value = "addr", required = false)  String addr,HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		productService.insertOrder(name, phone,u.getWxId(), productId,addr);
		return "{success:true,msg:'保存成功!'}";
	}


	@RequestMapping(value = "/isExchanged",method = RequestMethod.POST)
	public @ResponseBody
	Map isExchanged(
			@RequestParam("productId") String productId,HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return productService.isExchanged(u.getWxId(), productId);
	}

	@RequestMapping(value = "/findPorders",method = RequestMethod.POST)
	public @ResponseBody
	List findPorders(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return productService.findPorderInfos(u.getWxId());
	}

	@RequestMapping(value = "/getPorderDetails",method = RequestMethod.POST)
	public @ResponseBody
	List getPorderDetails(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return productService.findPorderDetailInfos(u.getWxId());
	}

}
