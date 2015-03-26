package com.lhdx.www.server.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lhdx.www.server.dao.PorderDao;
import com.lhdx.www.server.dao.ProductDao;
import com.lhdx.www.server.dao.UserDao;
import com.lhdx.www.server.model.Porder;
import com.lhdx.www.server.model.Product;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.util.DataFormat;

@Service("productService")
public class ProductService {
	@Resource(name = "productDao")
	private ProductDao productDao;
	
	@Resource(name = "porderDao")
	private PorderDao porderDao;
	
	@Resource(name = "userDao")
	private UserDao userDao;

	public List<Product> findProducts(){
			return productDao.findProducts();
	}

	public Product findProductById(int productId){
		return productDao.findProductById(productId);
	}
	
	public void insertOrder(String name,String phone,String wxId, String productId,String addr) {
		User u = userDao.findUserByWxId(wxId);
		if(u!=null){
				Porder c = new Porder();
				c.setNum("1");
				c.setProductId(productId);
				c.setWxId(wxId);
				c.setCreateTime(DataFormat.formatDate(new Date()));
				
				
				Product p = productDao.findProductById(Integer.parseInt(productId));
				if(p!=null){
					u.setJf(u.getJf()-p.getProductScore());
				}
				
				if(u.getName()==null||"".equals(u.getName())){
					u.setName(name);
				}
				if(u.getPhone()==null||"".equals(u.getPhone())){
					u.setPhone(phone);
				}
				if(u.getAddr()==null||"".equals(u.getAddr())){
					u.setAddr(addr);
				}
				
				productDao.updateNum(p.getProductId(), p.getNum()-1);
				porderDao.addPorder(c);
				userDao.updateUser(u);
		}
	}
}
