package com.lhdx.www.server.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.lhdx.www.server.model.User;
import com.lhdx.www.server.service.UserService;
import com.mchange.v2.util.DoubleWeakHashMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.model.Contact;
import com.lhdx.www.server.service.ContactService;

@Controller
@RequestMapping(value = "/service")
public class ContactController {

	@Resource(name = "contactService")
	private ContactService contactService;

	//新增反馈
	@RequestMapping(value = "/addNewContact",method = RequestMethod.POST)
	public @ResponseBody
	String addNewContact(
			@RequestParam("name") String name,
			@RequestParam("phone") String phone,
			@RequestParam(value = "addr", required = false)  String addr,
			@RequestParam(value = "wenti", required = false)  String wenti,HttpSession httpSession) {

		User u = (User) httpSession.getAttribute("user");
		contactService.insertContact(name, phone, wenti, u.getWxId(), addr);
		return "{success:true,msg:'保存成功!'}";
	}

	//用户评价
	@RequestMapping(value = "/repContact2",method = RequestMethod.POST)
	public @ResponseBody
	boolean replyContact2(
			@RequestParam("id") String id,
			@RequestParam("rep") String rep,HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return contactService.replyContactById(u.getWxId(), rep, id);
	}

	//管理员处理反馈结果
	@RequestMapping(value = "/updateContact2",method = RequestMethod.POST)
	public @ResponseBody
	Map updateContact2(
			@RequestParam("id") String id,
			@RequestParam("flag") String flag,
			HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		map.put("isUpdateSuccess",contactService.updateContactById(u.getWxId(), flag, id));
		return map;
	}

	@RequestMapping(value = "/findContactsByXiaoqu2",method = RequestMethod.POST)
	public @ResponseBody
	Map findContactsByXiaoqu2(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return contactService.findContactsByXiaoqu2(u.getWxId());
	}


	@RequestMapping(value = "/findAdContacts",method = RequestMethod.POST)
	public @ResponseBody
	Map findAdContacts(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return contactService.findAdContacts(u.getWxId());
	}

	@RequestMapping(value = "/findContactsByOwner2",method = RequestMethod.POST)
	public @ResponseBody
	Map findContactsByOwner2(HttpSession httpSession) {

		User u = (User) httpSession.getAttribute("user");
		return contactService.findContactsById(u.getWxId());
	}
}
