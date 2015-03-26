package com.lhdx.www.server.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.service.WeixinService;
import com.lhdx.www.server.util.MessageUtil;

@Controller
@RequestMapping(value = "/weixinservice")
public class WeixinController {
	
	private static final String TOKEN = "aixuexiao";
	
	
	@Resource(name="weixinService")
	private WeixinService weixinService;
	
	
	
	//接收微信公众号接收的消息，处理后再做相应的回复
	@RequestMapping(value="/weixin",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String replyMessage(HttpServletRequest request){
		//仅处理微信服务端发的请求
		return weixinService.coreService(request);
//		if (checkWeixinReques(request)) {
//			return weixinService.coreService(request);
//		}else{
//			return "error";
//		}
	}
	
	
	//微信公众平台验证url是否有效使用的接口
	@RequestMapping(value="/weixin",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String initWeixinURL(HttpServletRequest request){
		String echostr = request.getParameter("echostr");
		if (checkWeixinReques(request) && echostr != null) {
			return echostr;
		}else{
			return "error";
		}
	}
	
	
	/**
	 * 根据token计算signature验证是否为weixin服务端发送的消息
	 */
	private static boolean checkWeixinReques(HttpServletRequest request){
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		if (signature != null && timestamp != null && nonce != null ) {
			String[] strSet = new String[] { TOKEN, timestamp, nonce };
			java.util.Arrays.sort(strSet);
			String key = "";
			for (String string : strSet) {
				key = key + string;
			}
			String pwd = MessageUtil.sha1(key);
			return pwd.equals(signature);
		}else {
			return false;
		}
	}
	
	
	
}
