package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.Porder;

@Component("porderDao")
public class PorderDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.PorderDao";
	private static final String ADDORDER = ".addPorder";

	public void addPorder(Porder o) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o", o);
		sqlSession.insert(NAMESPACE + ADDORDER, map);
	}
}
