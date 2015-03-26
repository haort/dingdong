package com.lhdx.www.server.service;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.lhdx.www.server.model.weixin.WeixinOauth2Token;
import com.lhdx.www.server.util.SystemParam;
import com.sina.sae.fetchurl.SaeFetchurl;
import com.sina.sae.memcached.SaeMemcache;

@Service("authorityService")
public class AuthorityService {
	private SaeMemcache mc;

	public AuthorityService() {
		mc = new SaeMemcache();
		mc.init();
	}

	public String getToken() {
		String token = mc.get("access_token");
		if (token == null || "".equals(token)) {
			token = getAccessToken();
			mc.set("access_token", token, 60);
		}
		return token;
	}
	
	private String getAccessToken() {
		System.out.println(System.currentTimeMillis()+"\n获取token");
		String APPID = "wx3f8b40498989b267";
		String APPSECRET = "29a373a60ca885161f1bfaab4422ea25";
		String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
				+ APPID + "&secret=" + APPSECRET;
		String accessToken = null;
		try {
			SaeFetchurl fetchUrl = new SaeFetchurl();
			fetchUrl.setMethod("get");
			String message = fetchUrl.fetch(url);
			JSONObject json = new JSONObject(message);
			accessToken = json.getString("access_token");

			System.out.println(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return accessToken;
	}
	
	public static void main(String[] args){
		System.out.println(System.currentTimeMillis()+"\n获取token");
		String APPID = "wxf10bdb22db196716";
		String APPSECRET = "1b725d6920eb37adcf5df5845a2976d8";
		String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
				+ APPID + "&secret=" + APPSECRET;
		String accessToken = null;
		try {
			SaeFetchurl fetchUrl = new SaeFetchurl();
			fetchUrl.setMethod("get");
			String message = fetchUrl.fetch(url);
			JSONObject demoJson = new JSONObject(message);
			accessToken = demoJson.getString("access_token");
			System.out.println(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(accessToken); 
	}
	public WeixinOauth2Token getOauth2AccessToken(String code) {
		WeixinOauth2Token wat = null;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		requestUrl = requestUrl.replace("APPID", SystemParam.APPID);
		requestUrl = requestUrl.replace("SECRET", SystemParam.APPSECRET);
		requestUrl = requestUrl.replace("CODE", code);
		// 获取网页授权凭证
		String accessToken = null;
		SaeFetchurl fetchUrl = new SaeFetchurl();
		fetchUrl.setMethod("get");
		String message = fetchUrl.fetch(requestUrl);
		JSONObject jsonObject;
		try {
			jsonObject = new JSONObject(message);
			accessToken = jsonObject.getString("access_token");
			if (null != jsonObject) {
				try {
					wat = new WeixinOauth2Token();
					wat.setAccessToken(jsonObject.getString("access_token"));
					wat.setExpiresIn(jsonObject.getInt("expires_in"));
					wat.setRefreshToken(jsonObject.getString("refresh_token"));
					wat.setOpenId(jsonObject.getString("openid"));
					wat.setScope(jsonObject.getString("scope"));
				} catch (Exception e) {
					
				}
			}
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		
		return wat;
	}
	
}
