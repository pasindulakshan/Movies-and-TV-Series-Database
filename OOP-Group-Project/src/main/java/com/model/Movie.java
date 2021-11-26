package com.model;

import java.util.ArrayList;
import java.util.List;

public class Movie extends Item {
	
	private String mdlink;

	// Constructors
	public Movie(int id,String title, String poster,double rating) {
		super(id, title, poster,rating);
	}

	public Movie(int id,String title, double rating, int views, String added_date, String added_by) {
		super(id, title, rating, views, added_date, added_by);
	}
	
	public Movie(String title, String description, String rdate, String runtime, String country, int[] genres, int[] directors, int[] writers, 
			int[] actors, String[] roles, String trailer, String mdlink, String cover, List<String> gallery) {
		
		super(title, description, rdate, runtime, country, genres, directors, writers, actors, roles, trailer, cover, gallery);
		this.mdlink = mdlink;
	}
	

	public Movie(String title, String description, String rdate, String runtime, String country, ArrayList<Genre> genres, 
			ArrayList<Celebrity> directors, ArrayList<Celebrity> writers, ArrayList<Cast> casts, String trailer, String mdlink, String cover) {

		super(title, description, rdate, runtime, country, trailer, cover, genres, directors, writers, casts);
		this.mdlink = mdlink;

	}
	
	public Movie(String title, String description, String rdate, String runtime, String country, ArrayList<Genre> genres, 
			ArrayList<Celebrity> directors, ArrayList<Celebrity> writers, ArrayList<Cast> casts, String trailer, String mdlink, String cover, double rating) {
		
		super(title, description, rdate, runtime, country, trailer, cover, genres, directors, writers, casts, rating);
		this.mdlink = mdlink;
		
	}


	// Getters
	public String getMdlink() {
		return mdlink;
	}
	

}
