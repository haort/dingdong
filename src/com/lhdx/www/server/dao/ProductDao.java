package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.Notice;
import com.lhdx.www.server.model.Product;

@Component("productDao")
public class ProductDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.ProductDao";
	private static final String SELECTPRODUCTS = ".selectProducts";
	private static final String SELECTPRODUCTBYID = ".selectProductById";
	private static final String UPDATENUM = ".updateNum";
	
	public List<Product> findProducts() {
		Map<String,Object> map = new HashMap<String,Object>();
		return sqlSession.selectList(NAMESPACE+SELECTPRODUCTS,map);
	}
	
	public Product findProductById(int productId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("productId", productId);
		return sqlSession.selectOne(NAMESPACE+SELECTPRODUCTBYID,map);
	}
	
	public void updateNum(int productId,int num){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("productId", productId);
		map.put("num", num);
		sqlSession.update(NAMESPACE+UPDATENUM, map);
	}
}
