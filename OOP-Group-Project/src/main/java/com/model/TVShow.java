package com.model;

import java.util.ArrayList;
import java.util.List;

public class TVShow extends Item{
	private List<Episode> episodes;
	private int noOfSeasons;
	private int noOfEpisodes;

	// Constructors
	public TVShow(int tid, String title, String cover, double rating) {
		super(tid, title, cover,rating);
	}

	public TVShow(int id, String title, double rating, int views, String added_date, String added_by, int noOfSeasons, int noOfEpisodes) {
		
		super(id, title, rating, views, added_date, added_by);
		
		this.noOfSeasons = noOfSeasons;
		this.noOfEpisodes = noOfEpisodes;
	}

	public TVShow(String title, String description, String rdate, String runtime, String country, int[] genres, int[] directors, int[] writers, 
			int[] actors, String[] roles, String trailer, String cover, List<String> gallery, List<Episode> episodes) {
		
		super(title, description, rdate, runtime, country, genres, directors, writers, actors, roles, trailer, cover, gallery);
		
		this.episodes = episodes;
	}
	
	public TVShow(String title, String description, String rdate, String runtime, String country, ArrayList<Genre> genres, ArrayList<Celebrity> directors, 
			ArrayList<Celebrity> writers,  ArrayList<Cast> casts, String trailer, String cover, List<Episode> episodes2) {
		
		super(title, description, rdate, runtime, country, trailer, cover, genres, directors, writers, casts);
		
		this.episodes = episodes2;
	}
	
	public TVShow(String title, String description, String rdate, String runtime, String country, ArrayList<Genre> genres, ArrayList<Celebrity> directors, 
			ArrayList<Celebrity> writers,  ArrayList<Cast> casts, String trailer, String cover, List<Episode> episodes2, double rating) {
		
		super(title, description, rdate, runtime, country, trailer, cover, genres, directors, writers, casts, rating);
		
		this.episodes = episodes2;
	}

	// Getters 
	public int getNoOfSeasons() {
		return noOfSeasons;
	}

	public int getNoOfEpisodes() {
		return noOfEpisodes;
	}

	public List<Episode> getEpisodes() {
		return episodes;
	}
	
}
