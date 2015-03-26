package com.lhdx.www.server.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	
	@RequestMapping(value = "/addContact",method = RequestMethod.POST)
	public @ResponseBody
	String addContact(
			@RequestParam("name") String name,
			@RequestParam("phone") String phone,
			@RequestParam("wxId") String wxId,
			@RequestParam(value = "addr", required = false)  String addr,
			@RequestParam(value = "wenti", required = false)  String wenti) {
		contactService.insertContact(name, phone, wenti, wxId, addr);
		return "{success:true,msg:'保存成功!'}";
	}
	
	@RequestMapping(value = "/findContacts",method = RequestMethod.POST)
	public @ResponseBody
	List<Contact> findContactsById(
			@RequestParam("wxId") String wxId) {
		return contactService.findContactsByXiaoqu(wxId);
	}
	
	@RequestMapping(value = "/findContactsByOwner",method = RequestMethod.POST)
	public @ResponseBody
	Map findContactsByOwner(
			@RequestParam("wxId") String wxId) {
		return contactService.findContactsById(wxId);
	}
	@RequestMapping(value = "/findAdContactsByOwner",method = RequestMethod.POST)
	public @ResponseBody
	Map findAdContactsByOwner(
			@RequestParam("wxId") String wxId) {
		return contactService.findAdContactsById(wxId);
	}
	
	@RequestMapping(value = "/updateContact",method = RequestMethod.POST)
	public @ResponseBody
	String updateContact(
			@RequestParam("id") String id,
			@RequestParam("flag") String flag,
			@RequestParam("wxId") String wxId) {
		boolean isUpdated = contactService.updateContactById(wxId, flag, id);
		if(isUpdated){
			return "true";
		}else{
			return "false";
		}
		
	}
	
	@RequestMapping(value = "/repContact",method = RequestMethod.POST)
	public @ResponseBody
	String replyContact(
			@RequestParam("id") String id,
			@RequestParam("rep") String rep,
			@RequestParam("wxId") String wxId) {
		boolean isUpdated = contactService.replyContactById(wxId, rep, id);
		if(isUpdated){
			return "true";
		}else{
			return "false";
		}
		
	}
}
