package com.lhdx.www.server.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lhdx.www.server.model.Product;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.model.weixin.WeixinOauth2Token;
import com.lhdx.www.server.service.AuthorityService;
import com.lhdx.www.server.service.ProductService;
import com.lhdx.www.server.service.UserService;

@Controller
@RequestMapping(value = "/service")
public class ViewController {
	@Resource(name = "authorityService")
	private AuthorityService authorityService;
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "productService")
	private ProductService productService;
	

	@RequestMapping(value = "/getView", method = RequestMethod.GET)
	public ModelAndView getView(String code, String state,HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		if (code != null) {
			WeixinOauth2Token wo = authorityService.getOauth2AccessToken(code);
			if (wo != null) {
				User u = userService.findUserByWxId(wo.getOpenId());
				mv.addObject("wxId", wo.getOpenId());
				httpSession.setAttribute("wxId", wo.getOpenId());
				System.out.println("微信Id："+wo.getOpenId());
				if(u!=null){
					httpSession.setAttribute("user",u);
					System.out.println("user：" + u.getName()+"->"+state);
					if(state != null&&!"ad".equals(state)){
						mv.setViewName(state);
					}else if(state != null&&"ad".equals(state)){
						if(u.getAuth()!=null&&"admin1".equals(u.getAuth())){
							mv.setViewName("adnotice");
						}else{
							mv.setViewName("qd");
						}
					}else{
						mv.setViewName("qd");
					}
				}else{
					mv.setViewName("reg");
				}
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "/getTest", method = RequestMethod.GET)
	public ModelAndView getTest(HttpSession httpSession) {
		User u = userService.findUserByWxId("oof8Qs_b-wPRj0mCR8h0Jos6gdkE");
		httpSession.setAttribute("user",u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qd");
		return mv;
	}

	@RequestMapping(value = "/getQd2", method = RequestMethod.GET)
	public ModelAndView getQd2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qd");
		return mv;
	}

	@RequestMapping(value = "/getNotice2", method = RequestMethod.GET)
	public ModelAndView getNotice2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice");
		return mv;
	}

	@RequestMapping(value = "/getContact2", method = RequestMethod.GET)
	public ModelAndView getContact2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact");
		return mv;
	}


	@RequestMapping(value = "/getJfsc2", method = RequestMethod.GET)
	public ModelAndView getJfsc2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jfsc");
		return mv;
	}

	@RequestMapping(value = "/getMoreNotices2", method = RequestMethod.GET)
	public ModelAndView getMoreNotices2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("moreNotices");
		return mv;
	}

	@RequestMapping(value = "/getCkcontact2", method = RequestMethod.GET)
	public ModelAndView getCkcontact2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ckcontact");
		return mv;
	}


	@RequestMapping(value = "/getReg2", method = RequestMethod.GET)
	public ModelAndView getReg2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reg");
		return mv;
	}


	@RequestMapping(value = "/getUpdateUserView", method = RequestMethod.GET)
	public ModelAndView getUpdateUserView(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateUser");
		return mv;
	}


	@RequestMapping(value = "/getPorderView", method = RequestMethod.GET)
	public ModelAndView getPorderView(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("porder");
		return mv;
	}

	@RequestMapping(value = "/getProduct2", method = RequestMethod.GET)
	public ModelAndView getProduct2(int productId,HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product");
		User u = (User) httpSession.getAttribute("user");
		Product product = productService.findProductById(productId);
		if(product!=null){
			mv.addObject("productId",product.getProductId());
			mv.addObject("productPic",product.getProductPic());
			mv.addObject("productName", product.getProductName());
			mv.addObject("productScore", product.getProductScore());
			mv.addObject("productDes", product.getProductDes());
			mv.addObject("num", product.getNum());
		}
		return mv;
	}

	@RequestMapping(value = "/getAdNotice2", method = RequestMethod.GET)
	public ModelAndView getAdNotice2(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adnotice");
		return mv;
	}

	@RequestMapping(value = "/getAdMoreNotices", method = RequestMethod.GET)
	public ModelAndView getAdMoreNotices(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admoreNotices");
		return mv;
	}


	@RequestMapping(value = "/getAdContact", method = RequestMethod.GET)
	public ModelAndView getAdContact(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adcontact");
		return mv;
	}

	@RequestMapping(value = "/getAdMoreContact", method = RequestMethod.GET)
	public ModelAndView getAdMoreContact(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admorecontact");
		return mv;
	}


	@RequestMapping(value = "/getUserView", method = RequestMethod.GET)
	public ModelAndView getUserView(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user");
		return mv;
	}

}
