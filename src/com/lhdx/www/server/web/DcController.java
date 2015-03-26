package com.lhdx.www.server.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lhdx.www.server.service.DcService;

@Controller
@RequestMapping(value = "/service")
public class DcController {

	@Resource(name = "dcService")
	private DcService dcService;
	
	@RequestMapping(value = "/addDc",method = RequestMethod.POST)
	public @ResponseBody
	String addDc(
			@RequestParam("q1") String q1,
			@RequestParam("q2") String q2,
			@RequestParam("q3") String q3,
			@RequestParam("q4") String q4,
			@RequestParam("q5") String q5,
			@RequestParam("q6") String q6,
			@RequestParam("q7") String q7,
			@RequestParam("otherq") String otherq,
			@RequestParam("wxId") String wxId) {
		return dcService.insertDc(q1, q2, q3, q4, q5, q6, q7, otherq, wxId);
	}
	
	@RequestMapping(value = "/findDc",method = RequestMethod.POST)
	public @ResponseBody
	String findDcBywxId(
			@RequestParam("wxId") String wxId) {
		return dcService.findByWxId(wxId);
	}
	
}
