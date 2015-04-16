package com.lhdx.www.server.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.lhdx.www.server.model.Notice;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.service.NoticeService;

@Controller
@RequestMapping(value = "/service")
public class NoticeController {

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@RequestMapping(value = "/findNotice",method = RequestMethod.POST)
	public @ResponseBody
	Notice findNoticeById(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return noticeService.findNotice2(u.getWxId());
	}

	@RequestMapping(value = "/getNotices",method = RequestMethod.POST)
	public @ResponseBody
	List getNoticeById(HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return noticeService.findNotices(u.getWxId());
	}

	@RequestMapping(value = "/addNewNotice",method = RequestMethod.POST)
	public @ResponseBody
	Map addNewNotice(
			@RequestParam("title") String title,
			@RequestParam("description") String description, HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("user");
		return noticeService.insertNotice2(title, description, u.getWxId());
	}

}
