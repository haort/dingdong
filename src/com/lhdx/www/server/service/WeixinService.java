package com.lhdx.www.server.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.lhdx.www.server.dao.NoticeDao;
import com.lhdx.www.server.dao.UserDao;
import com.lhdx.www.server.model.Message;
import com.lhdx.www.server.model.Notice;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.model.resp.Article;
import com.lhdx.www.server.model.resp.NewsMessageResp;
import com.lhdx.www.server.model.resp.TextMessageResp;
import com.lhdx.www.server.util.MessageUtil;

@Service("weixinService")
public class WeixinService {
	@Resource(name = "userDao")
	private UserDao userDao;
	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;
	
	public String coreService(HttpServletRequest request) {
		String respMessage = null;
		try {
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			Message message = MessageUtil.mapToMessage(requestMap);
			String replyContent = null;
			String type = message.getMsgType();
			TextMessageResp textMessage = new TextMessageResp();
			textMessage.setToUserName(message.getFromUserName());
			textMessage.setFromUserName(message.getToUserName());
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setContent(getMainMenu());
			// 将文本消息对象转换成xml字符串
			respMessage = MessageUtil.textMessageToXml(textMessage);
			
			if (type.equals(Message.TEXT)) {
				respMessage = doTextResponse(message);
			}
			//【微信触发类型】图片消息
			else if (type.equals(Message.IMAGE)) {
				replyContent = getOtherReply();
			}
			//【微信触发类型】地理位置消息
			else if (type.equals(Message.LOCATION)) {
				replyContent = getOtherReply();
			}
			//【微信触发类型】链接消息
			else if (type.equals(Message.LINK)) {
				replyContent = getOtherReply();
			}
			//【微信触发类型】音频消息
			else if (type.equals(Message.VOICE)) {
				replyContent = getOtherReply();
			}
			//【微信触发类型】事件推送
			else if (type.equals(Message.EVENT)) {
				// 事件类型
				String eventType = message.getEvent();
				// 订阅
				if (eventType.equals(Message.SUBSCRIBE)) {
					respMessage = doDingYueEventResponse(message);
				}
				// 取消订阅
				else if (eventType.equals(Message.UNSUBSCRIBE)) {
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
				}
				// 自定义菜单点击事件
				else if (eventType.equals(Message.EVENT_TYPE_CLICK)) {
					respMessage = doMyMenuEvent(message,message.getEventKey());
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return respMessage;
	}



	/**
	 * 针对文本消息
	 * @param content
	 * @param toUserName
	 * @param textMessage
	 * @param bundler
	 * @param sys_accountId
	 * @param respMessage
	 * @param fromUserName
	 * @param request
	 * @throws Exception 
	 */
	String doTextResponse(Message message) throws Exception{
		String responsContent = getOtherReply();
		String wxId = message.getFromUserName();
		TextMessageResp textMessage = new TextMessageResp();
		textMessage.setToUserName(message.getFromUserName());
		textMessage.setFromUserName(message.getToUserName());
		textMessage.setCreateTime(new Date().getTime());
		textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
		if(!isUserRegisted(wxId)){
			return reg(message,wxId);
		}else{
			if(isAdmin(wxId)){
			String content = message.getContent();//消息内容
			String [] cs = content.split("_");//消息内容都以下划线_分隔
			if(cs.length == 2){
				String phone ;
				String process = cs[0];//操作
				try {
					phone = cs[1];
					if("TSQX".equals(process)||"tsqx".equals(process)){
						User u = userDao.findUserByPhone(phone);
						if(u!=null){
							userDao.updateUser(u.getId(), "admin1");
							responsContent="您为"+u.getName()+"提升权限！";
						}else{
							responsContent = "需提升权限用户不存在";
						}
					}else if("QXQX".equals(process)||"qxqx".equals(process)){
						User u = userDao.findUserByPhone(phone);
						if(u!=null){
							userDao.updateUser(u.getId(), "");
							responsContent="您为"+u.getName()+"取消权限！";
						}else{
							responsContent = "需取消权限用户不存在";
						}
					}else {
						responsContent = getOtherReply();
					}
				} catch (NumberFormatException e) {
					responsContent = getOtherReply();
				}
			}
		}
		}
		textMessage.setContent(responsContent);
		return MessageUtil.textMessageToXml(textMessage);
	}
	
	/**
	 * 针对事件消息
	 * @param requestMap
	 * @param textMessage
	 * @param bundler
	 * @param respMessage
	 * @param toUserName
	 * @param fromUserName
	 */
	String doDingYueEventResponse(Message message){
		TextMessageResp textMessage = new TextMessageResp();
		textMessage.setToUserName(message.getFromUserName());
		textMessage.setFromUserName(message.getToUserName());
		textMessage.setCreateTime(new Date().getTime());
		textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
		textMessage.setContent("订阅成功，太湖世家将为您提供更优质的服务，请点击相关菜单获得了解更多内容！");
		return  MessageUtil.textMessageToXml(textMessage);
	}
	
	/**
	 * 
	 * @param requestMap
	 * @param textMessage
	 * @param bundler
	 * @param respMessage
	 * @param toUserName
	 * @param fromUserName
	 * @param respContent
	 * @param sys_accountId
	 * @param request
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	String doMyMenuEvent(Message message,String eventKey) throws Exception{
		String wxId = message.getFromUserName();
		String responsMessage = null;
		User u = userDao.findUserByWxId(wxId);
		if(u!=null){
			if("B_WTFK".equals(eventKey)){
				Article article = new Article();
				article.setTitle("问题反馈");
				article.setDescription("请准确填写您的问题，以便我们能及时联系您！");
				article.setPicUrl("http://yixinservice.sinaapp.com/images/contact.png");
				article.setUrl("http://yixinservice.sinaapp.com/service/getContact.do?wxId="+wxId);
				List<Article> articleList = new ArrayList<Article>();
				articleList.add(article);
				NewsMessageResp newsResp = new NewsMessageResp();
				newsResp.setCreateTime(new Date().getTime());
				newsResp.setFromUserName(message.getToUserName());
				newsResp.setToUserName(message.getFromUserName());
				newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				newsResp.setArticleCount(articleList.size());
				newsResp.setArticles(articleList);
				responsMessage = MessageUtil.newsMessageToXml(newsResp);
			}else if("B_WYGG".equals(eventKey)){
				Notice n= noticeDao.findNoticeByXiaoqu(u.getXiaoqu());
				if(n!=null){
					TextMessageResp textMessage = new TextMessageResp();
					textMessage.setToUserName(message.getFromUserName());
					textMessage.setFromUserName(message.getToUserName());
					textMessage.setCreateTime(new Date().getTime());
					textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
					textMessage.setContent("尊敬的业主您好:\n"+"'"+u.getXiaoqu()+"'物业管理处于"+n.getCreateTime()+"发布最新公告:\n"+"\""+n.getDescription()+"\"");
					responsMessage = MessageUtil.textMessageToXml(textMessage);
				}else{
					TextMessageResp textMessage = new TextMessageResp();
					textMessage.setToUserName(message.getFromUserName());
					textMessage.setFromUserName(message.getToUserName());
					textMessage.setCreateTime(new Date().getTime());
					textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
					textMessage.setContent("尊敬的业主您好:\n"+u.getXiaoqu()+"目前暂无公告");
					responsMessage = MessageUtil.textMessageToXml(textMessage);
				}
			}else if ("B_CKFK".equals(eventKey)){
				Article article = new Article();
				article.setTitle("反馈查看");
				article.setDescription("查看你所反馈的问题");
				article.setPicUrl("http://yixinservice.sinaapp.com/images/ck.png");
				article.setUrl("http://yixinservice.sinaapp.com/service/getCkcontact.do?wxId="+wxId);
				List<Article> articleList = new ArrayList<Article>();
				articleList.add(article);
				NewsMessageResp newsResp = new NewsMessageResp();
				newsResp.setCreateTime(new Date().getTime());
				newsResp.setFromUserName(message.getToUserName());
				newsResp.setToUserName(message.getFromUserName());
				newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				newsResp.setArticleCount(articleList.size());
				newsResp.setArticles(articleList);
				responsMessage = MessageUtil.newsMessageToXml(newsResp);
			}else if ("B_MYDC".equals(eventKey)){
				Article article = new Article();
				article.setTitle("满意度调查");
				article.setDescription("请您参加满意度调查");
				article.setPicUrl("http://yixinservice.sinaapp.com/images/dc.png");
				article.setUrl("http://yixinservice.sinaapp.com/service/getDc.do?wxId="+wxId);
				List<Article> articleList = new ArrayList<Article>();
				articleList.add(article);
				NewsMessageResp newsResp = new NewsMessageResp();
				newsResp.setCreateTime(new Date().getTime());
				newsResp.setFromUserName(message.getToUserName());
				newsResp.setToUserName(message.getFromUserName());
				newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				newsResp.setArticleCount(articleList.size());
				newsResp.setArticles(articleList);
				responsMessage = MessageUtil.newsMessageToXml(newsResp);
			}else if ("B_LSGG".equals(eventKey)){
				Article article = new Article();
				article.setTitle("历史公告");
				article.setDescription("查看历史公告");
				article.setPicUrl("http://yixinservice.sinaapp.com/images/gg.png");
				article.setUrl("http://yixinservice.sinaapp.com/service/getNotice.do?wxId="+wxId);
				List<Article> articleList = new ArrayList<Article>();
				articleList.add(article);
				NewsMessageResp newsResp = new NewsMessageResp();
				newsResp.setCreateTime(new Date().getTime());
				newsResp.setFromUserName(message.getToUserName());
				newsResp.setToUserName(message.getFromUserName());
				newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				newsResp.setArticleCount(articleList.size());
				newsResp.setArticles(articleList);
				responsMessage = MessageUtil.newsMessageToXml(newsResp);
			}else if ("B_QDYL".equals(eventKey)){
				Article article = new Article();
				article.setTitle("签到有礼");
				article.setDescription("签到获得积分，可以兑换礼品");
				article.setPicUrl("http://yixinservice.sinaapp.com/images/qd.png");
				article.setUrl("http://yixinservice.sinaapp.com/service/getQd.do?wxId="+wxId);
				List<Article> articleList = new ArrayList<Article>();
				articleList.add(article);
				NewsMessageResp newsResp = new NewsMessageResp();
				newsResp.setCreateTime(new Date().getTime());
				newsResp.setFromUserName(message.getToUserName());
				newsResp.setToUserName(message.getFromUserName());
				newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				newsResp.setArticleCount(articleList.size());
				newsResp.setArticles(articleList);
				responsMessage = MessageUtil.newsMessageToXml(newsResp);
			}else if ("B_GLYDL".equals(eventKey)){
				if(u.getAuth()!=null&&"admin1".equals(u.getAuth())){
					Article article = new Article();
					article.setTitle("管理员登陆");
					article.setDescription("管理员登陆");
					article.setPicUrl("http://yixinservice.sinaapp.com/images/ad.png");
					article.setUrl("http://yixinservice.sinaapp.com/service/getAd.do?wxId="+wxId);
					List<Article> articleList = new ArrayList<Article>();
					articleList.add(article);
					NewsMessageResp newsResp = new NewsMessageResp();
					newsResp.setCreateTime(new Date().getTime());
					newsResp.setFromUserName(message.getToUserName());
					newsResp.setToUserName(message.getFromUserName());
					newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					newsResp.setArticleCount(articleList.size());
					newsResp.setArticles(articleList);
					responsMessage = MessageUtil.newsMessageToXml(newsResp);
				}
			}else if ("B_JFSC".equals(eventKey)){
				Article article = new Article();
				article.setTitle("积分商城");
				article.setDescription("签到获得积分，可以兑换礼品");
				article.setPicUrl("http://yixinservice.sinaapp.com/images/jfsc.png");
				article.setUrl("http://yixinservice.sinaapp.com/service/getJfsc.do?wxId="+wxId);
				List<Article> articleList = new ArrayList<Article>();
				articleList.add(article);
				NewsMessageResp newsResp = new NewsMessageResp();
				newsResp.setCreateTime(new Date().getTime());
				newsResp.setFromUserName(message.getToUserName());
				newsResp.setToUserName(message.getFromUserName());
				newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
				newsResp.setArticleCount(articleList.size());
				newsResp.setArticles(articleList);
				responsMessage = MessageUtil.newsMessageToXml(newsResp);
			}
			
		}else{
			responsMessage = reg(message,wxId);
		}
		return responsMessage;
	}
	
	public String reg(Message message,String wxId){
		Article article = new Article();
		article.setTitle("绑定小区");
		article.setDescription("请绑定您所属小区，以便于获得更好的服务！");
		article.setPicUrl("http://yixinservice.sinaapp.com/images/reg.png");
		article.setUrl("http://yixinservice.sinaapp.com/service//getReg.do?wxId="+wxId);
		List<Article> articleList = new ArrayList<Article>();
		articleList.add(article);
		NewsMessageResp newsResp = new NewsMessageResp();
		newsResp.setCreateTime(new Date().getTime());
		newsResp.setFromUserName(message.getToUserName());
		newsResp.setToUserName(message.getFromUserName());
		newsResp.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
		newsResp.setArticleCount(articleList.size());
		newsResp.setArticles(articleList);
		return MessageUtil.newsMessageToXml(newsResp);
	}
	
	/**
	 * 欢迎语
	 * @return
	 */
	public static String getMainMenu() {
		return "订阅成功，太湖世家将为您提供更优质的服务，请点击相关菜单获得了解更多内容！";
	}
	public static String getOtherReply() {
		return "1、请点击左下角菜单图标。\n2、点击“问题反馈”菜单。\n3、点击“最新反馈”菜单。\n4、填写相关信息和问题。（首次请绑定小区）";
	}
	public boolean isUserRegisted(String wxId){
		User u = userDao.findUserByWxId(wxId);
		if(u!=null){
			return true;
		}else{
			return false;
		}
		
	}
	public boolean isAdmin(String wxId){
		User u = userDao.findAdmin(wxId);
		if(u!=null){
			return true;
		}else{
			return false;
		}
		
	}
	
}
