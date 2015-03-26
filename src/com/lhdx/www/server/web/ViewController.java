package com.lhdx.www.server.web;

import javax.annotation.Resource;

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
	
	@RequestMapping(value = "/getProduct", method = RequestMethod.GET)
	public ModelAndView getProduct(int productId,String wxId,String nowScore) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product");
		Product product = productService.findProductById(productId);
		if(product!=null){
			mv.addObject("productId",product.getProductId());
			mv.addObject("productPic",product.getProductPic());
			mv.addObject("productName", product.getProductName());
			mv.addObject("productScore", product.getProductScore());
			mv.addObject("productDes", product.getProductDes());
			mv.addObject("num", product.getNum());
			mv.addObject("wxId", wxId);
			mv.addObject("nowScore", nowScore);
		}
		return mv;
	}

	@RequestMapping(value = "/getTypography", method = RequestMethod.GET)
	public ModelAndView getTypography() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("typography");
		return mv;
	}

	@RequestMapping(value = "/getJfsc", method = RequestMethod.GET)
	public ModelAndView getJfsc(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jfsc");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getAd", method = RequestMethod.GET)
	public ModelAndView getAd(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ad");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getCkcontact", method = RequestMethod.GET)
	public ModelAndView getCkcontact(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ckcontact");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getAdCkcontact", method = RequestMethod.GET)
	public ModelAndView getAdCkcontact(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adCkcontact");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getNotice", method = RequestMethod.GET)
	public ModelAndView getNotice(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cknotice");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getContact", method = RequestMethod.GET)
	public ModelAndView getContact(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("contact");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getDc", method = RequestMethod.GET)
	public ModelAndView getDc(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("dc");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getDocontact", method = RequestMethod.GET)
	public ModelAndView getDocontact(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("docontact");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getHelp", method = RequestMethod.GET)
	public ModelAndView getHelp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("help");
		return mv;
	}

	@RequestMapping(value = "/getIndex", method = RequestMethod.GET)
	public ModelAndView getIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(value = "/getFbNotice", method = RequestMethod.GET)
	public ModelAndView getFbNotice(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getQd", method = RequestMethod.GET)
	public ModelAndView getQd(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qd");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getReg", method = RequestMethod.GET)
	public ModelAndView getReg(String wxId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reg");
		if (wxId != null && !"".equals(wxId)) {
			mv.addObject("wxId", wxId);
		}
		return mv;
	}

	@RequestMapping(value = "/getView", method = RequestMethod.GET)
	public ModelAndView getView(String code, String state) {
		ModelAndView mv = new ModelAndView();
		if (code != null) {
			WeixinOauth2Token wo = authorityService.getOauth2AccessToken(code);
			if (wo != null) {
				User u = userService.findUserByWxId(wo.getOpenId());
				mv.addObject("wxId", wo.getOpenId());
				if(u!=null){
					if(state != null&&!"ad".equals(state)){
						mv.setViewName(state);
					}else if(state != null&&"ad".equals(state)){
						if(u.getAuth()!=null&&"admin1".equals(u.getAuth())){
							mv.setViewName("ad");
						}else{
							mv.setViewName("notad");
						}
					}else{
						mv.setViewName("404");
					}
				}else{
					mv.setViewName("reg");
				}
			}
		}
		return mv;
	}
	
	@RequestMapping(value = "/getTest", method = RequestMethod.GET)
	public ModelAndView getTest() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}

}
