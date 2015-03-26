package com.lhdx.www.server.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DataFormat {
	private static SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
	
	public static String formatDate(Date date){
		return sd.format(date);
	}
	

}
