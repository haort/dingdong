package com.lhdx.www.server.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.lhdx.www.server.model.User;
import com.lhdx.www.server.service.UserService;
import com.lhdx.www.server.util.DataFormat;
import com.mchange.v2.util.DoubleWeakHashMap;
import com.sina.sae.storage.SaeStorage;
import com.sina.sae.util.SaeUserInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.model.Contact;
import com.lhdx.www.server.service.ContactService;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/service")
public class ContactController {

	@Resource(name = "contactService")
	private ContactService contactService;

	//新增反馈
	@RequestMapping(value = "/addNewContact",method = RequestMethod.POST)
	public @ResponseBody
	Map addNewContact(
			@RequestParam("name") String name,
			@RequestParam("phone") String phone,
			@RequestParam(value = "addr", required = false)  String addr,
			@RequestParam(value = "wenti", required = false)  String wenti,
			@RequestParam(value = "contactImage", required = false) MultipartFile contactImage, HttpSession httpSession) {

		User u = (User) httpSession.getAttribute("user");

		SaeStorage storage = new SaeStorage();
		String contactName = null;
		String contactPhone = null;
		String contactAddr = null;
		String contactWenti = null;
		try {
			contactName = new String(name.getBytes("ISO8859-1"), "UTF-8");
			contactPhone = new String(phone.getBytes("ISO8859-1"), "UTF-8");
			contactAddr = new String(addr.getBytes("ISO8859-1"), "UTF-8");
			contactWenti = new String(wenti.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String image = null;
		if (contactImage == null || contactImage.isEmpty()) {
			System.out.println("文件未上传");
			image = null;
		} else {
			try {
				String fileName = contactImage.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				image = DataFormat.getUUID() + "." + suffix;
				FileUtils.copyInputStreamToFile(contactImage.getInputStream(), new File(SaeUserInfo.getSaeTmpPath() + image));
				storage.upload("contact", SaeUserInfo.getSaeTmpPath() + image, image);
//				String realPath = httpSession.getServletContext().getRealPath("/contactImages/");
//				FileUtils.copyInputStreamToFile(contactImage.getInputStream(), new File(realPath, image));

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return contactService.insertContact(contactName, contactPhone, contactWenti, u.getWxId(), contactAddr,image);
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

	@RequestMapping(value = "/getContactsInfo", method = RequestMethod.POST)
	public
	@ResponseBody
	List getContactsInfo(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return contactService.findContactsInfo(u.getWxId());
	}
}
