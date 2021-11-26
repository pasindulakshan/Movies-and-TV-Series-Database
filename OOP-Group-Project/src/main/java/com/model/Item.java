package com.model;

import java.util.ArrayList;
import java.util.List;

public class Item {
	
	private String title;
	private String description;
	private String rdate;
	private String runtime;
	private String country;
	private int[] genres;
	private int[] directors;
	private int[] writers;
	private int[] actors;
	private String[] roles;
	private String trailer;
	private String cover;
	private List<String> gallery;
	
	
	private ArrayList<Genre> genres1;
	private ArrayList<Celebrity>  directors1;
	private ArrayList<Celebrity> writers1;
	private ArrayList<Cast>  casts;
	
	private int id;
	private double rating;
	private int views;
	private String added_date;
	private String added_by;
	private String category;

	// Constructors
	public Item(int tid, String title, String cover, double rating) {
		this.id = tid;
		this.title = title;
		this.cover = cover;
		this.rating = rating;
	}

	public Item(int mid, String title, int views, double rating, String poster) {
		this.title = title;
		this.id = mid;
		this.views = views;
		this.rating = rating;
		this.cover = poster;
	}

	public Item(int id, String title, int views, String added_date, String category) {
		this.id = id;
		this.title = title;
		this.views = views;
		this.added_date = added_date;
		this.category = category;
	}

	public Item(int tid, String title, String cover, double rating, String category) {
		this.id = tid;
		this.title = title;
		this.cover = cover;
		this.rating = rating;
		this.category = category;
	}

	public Item(int id2, String title2, String poster, String category2, String release_date) {
		this.id = id2;
		this.title = title2;
		this.cover = poster;
		this.category = category2;
		this.rdate = release_date;
	}

	
	public Item(int id, String title, double rating, int views, String added_date, String added_by) {
		this.id = id;
		this.title = title;
		this.rating = rating;
		this.views = views;
		this.added_date = added_date;
		this.added_by = added_by;
	}
	
	public Item(String title, String description, String rdate, String runtime, String country, int[] genres,
			int[] directors, int[] writers, int[] actors, String[] roles, String trailer, String cover, List<String> gallery) {
		
		this.title = title;
		this.description = description;
		this.rdate = rdate;
		this.runtime = runtime;
		this.country = country;
		this.genres = genres;
		this.directors = directors;
		this.writers = writers;
		this.actors = actors;
		this.roles = roles;
		this.trailer = trailer;
		this.cover = cover;
		this.gallery = gallery;
	}


	
	public Item(String title, String description, String rdate, String runtime, String country, String trailer, String cover,
			ArrayList<Genre> genres2, ArrayList<Celebrity> directors2, ArrayList<Celebrity> writers2, ArrayList<Cast> casts) {
		
		this.title = title;
		this.description = description;
		this.rdate = rdate;
		this.country = country;
		this.trailer = trailer;
		this.cover = cover;
		this.genres1 = genres2;
		this.directors1 = directors2;
		this.writers1 = writers2;
		this.casts = casts;
		this.runtime = runtime;
		
	}
	
	public Item(String title, String description, String rdate, String runtime, String country, String trailer, String cover,
			ArrayList<Genre> genres2, ArrayList<Celebrity> directors2, ArrayList<Celebrity> writers2, ArrayList<Cast> casts, double rating) {
		
		this.title = title;
		this.description = description;
		this.rdate = rdate;
		this.country = country;
		this.trailer = trailer;
		this.cover = cover;
		this.genres1 = genres2;
		this.directors1 = directors2;
		this.writers1 = writers2;
		this.casts = casts;
		this.runtime = runtime;
		this.rating = rating;
		
	}


	// Getters 
	public int getId() {
		return id;
	}


	public double getRating() {
		return rating;
	}



	public int getViews() {
		return views;
	}


	public String getAddedDate() {
		return added_date;
	}


	public String getAddedBy() {
		return added_by;
	}


	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}


	public String getRdate() {
		return rdate;
	}


	public String getRuntime() {
		return runtime;
	}

	public String getCountry() {
		return country;
	}


	public int[] getGenres() {
		return genres;
	}


	public int[] getDirectors() {
		return directors;
	}


	public int[] getWriters() {
		return writers;
	}

	public int[] getActors() {
		return actors;
	}

	public String[] getRoles() {
		return roles;
	}

	public String getTrailer() {
		return trailer;
	}

	public String getCover() {
		return cover;
	}


	public List<String> getGallery() {
		return gallery;
	}


	public ArrayList<Genre> getGenres1() {
		return genres1;
	}

	public ArrayList<Celebrity> getDirectors1() {
		return directors1;
	}

	public ArrayList<Celebrity> getWriters1() {
		return writers1;
	}
	public ArrayList<Cast> getCasts() {
		return casts;
	}
	
	public void setID(int id) {
		this.id = id;
	}


	public String getCategory() {
		return category;
	}
	

}
