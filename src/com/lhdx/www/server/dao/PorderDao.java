package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lhdx.www.server.model.PorderDetailInfo;
import com.lhdx.www.server.model.PorderInfo;
import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.Porder;

@Component("porderDao")
public class PorderDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.PorderDao";
	private static final String ADDORDER = ".addPorder";
	private static final String SELECTPORDERINFOBYWXID = ".selectPorderInfoByWxId";
	private static final String SELECTPORDERSELECTPORDERDETAILINFO = ".selectPorderDetailInfo";


	public void addPorder(Porder o) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o", o);
		sqlSession.insert(NAMESPACE + ADDORDER, map);
	}


	public List<PorderInfo> findPorders(String wxId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxId);
		return sqlSession.selectList(NAMESPACE+SELECTPORDERINFOBYWXID,map);
	}

	public List<PorderDetailInfo> findPorderDetails() {
		return sqlSession.selectList(NAMESPACE+SELECTPORDERSELECTPORDERDETAILINFO);
	}

}
