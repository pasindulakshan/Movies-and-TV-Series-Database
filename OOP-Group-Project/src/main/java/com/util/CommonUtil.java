package com.util;

import java.io.IOException;
import java.util.Properties;

public class CommonUtil {
	
	public static final Properties properties = new Properties();
	
	static {
		try {
			properties.load(CommonUtil.class.getResourceAsStream(CommonConstants.PROPERTY_FILE));
			
		} catch (IOException e) {
			e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
		}
	}
}
