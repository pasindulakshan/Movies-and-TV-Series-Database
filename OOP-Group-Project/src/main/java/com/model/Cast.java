package com.model;

public class Cast {
	private Celebrity actor;
	private String role;
	
	// Constructor
	public Cast(Celebrity actor, String role) {
		this.actor = actor;
		this.role = role;
	}

	// Getters 
	public Celebrity getActor() {
		return actor;
	}

	public String getRole() {
		return role;
	}
	
}
