package com.model;

public class Genre {
	private int gid;
	private String name;
	
	// Constructors
	public Genre(int gid, String name) {
		this.gid = gid;
		this.name = name;
	}

	public Genre(String name) {
		this.name = name;
	}

	// Getters
	public int getGid() {
		return gid;
	}

	public String getName() {
		return name;
	}
}
