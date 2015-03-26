package com.lhdx.www.server.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lhdx.www.server.dao.DcDao;
import com.lhdx.www.server.model.Dc;

@Service("dcService")
public class DcService {
	@Resource(name = "dcDao")
	private DcDao dcDao;

	public String insertDc(String q1, String q2, String q3,String q4,String q5,String q6,String q7,String otherq,String wxId) {
		if(!isDcExisted(wxId)){
			Dc d = new Dc();
			d.setOtherq(otherq);
			d.setQ1(q1);
			d.setQ2(q2);
			d.setQ3(q3);
			d.setQ4(q4);
			d.setQ5(q5);
			d.setQ6(q6);
			d.setQ7(q7);
			d.setWxId(wxId);
			dcDao.addDc(d);
			return "true";
		}else{
			return "false";
		}
	}	
	
	public boolean isDcExisted(String wxId){
		Dc d = dcDao.findDcByWxId(wxId);
		if (d != null) {
			return true;
		}else{
			return false;
		}
	}
	
	public String findByWxId(String wxId){
		boolean isExisted = isDcExisted(wxId);
		if (isExisted) {
			return "true";
		}else{
			return "false";
		}
	}
}
