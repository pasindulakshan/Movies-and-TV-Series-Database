package com.util;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

public class ImageUtil extends CommonUtil{
	
	private static String imageFolderPath = properties.getProperty(CommonConstants.IMAGES_UPLOAD_PATH);
	
	public static String uploadMovieCover(Part cover) {
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String coverName = "img"+timestamp.getTime()+".jpg";
		String uploadPath = imageFolderPath + CommonConstants.MOVIE_COVERS_UPLOAD_PATH + coverName; 
		try
		{
			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = cover.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return coverName;
	}
	
	public static String uploadTVShowCover(Part cover) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String coverName= "img"+timestamp.getTime()+".jpg";
		String uploadPath = imageFolderPath + CommonConstants.TVSHOW_COVERS_UPLOAD_PATH + coverName; 
		try
		{
		
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=cover.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return coverName;
	}
	
	public static List<String> uploadMovieImages(List<Part> fileParts) {
		List<String> partNames = new ArrayList<>();
		for (Part filePart : fileParts) { 
			Timestamp timestamp2 = new Timestamp(System.currentTimeMillis());
			String partName = "img"+timestamp2.getTime()+".jpg";
			partNames.add(partName);
			String partuploadPath = imageFolderPath + CommonConstants.MOVIE_IMAGES_UPLOAD_PATH + partName; 
			
			try
			{
			
				FileOutputStream fos=new FileOutputStream(partuploadPath);
				InputStream is=filePart.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
			
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
	    }
		
		return partNames;
	}
	
	public static List<String> uploadTVShowImages(List<Part> fileParts) {
		List<String> partNames = new ArrayList<>();
		for (Part filePart : fileParts) {
			Timestamp timestamp2 = new Timestamp(System.currentTimeMillis());
			String partName= "img"+timestamp2.getTime()+".jpg";
			partNames.add(partName);
			String partuploadPath = imageFolderPath + CommonConstants.TVSHOW_IMAGES_UPLOAD_PATH + partName; 
			
			try
			{
			
				FileOutputStream fos=new FileOutputStream(partuploadPath);
				InputStream is=filePart.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
			
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
	    }
		return partNames;
	}
	
	public static String uploadCelebrityCover(Part cover) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String coverName= "img"+timestamp.getTime()+".jpg";
		String uploadPath = imageFolderPath + CommonConstants.CELEBRITY_COVERS_UPLOAD_PATH + coverName; 
		try
		{
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=cover.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		return coverName;
	}
}
