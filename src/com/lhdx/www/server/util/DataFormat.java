package com.lhdx.www.server.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class DataFormat {
	private static SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd-HH:mm");
	
	public static String formatDate(Date date){
		return sd.format(date);
	}

	public static String getUUID(){
		String s = UUID.randomUUID().toString();
		return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
	}
}
