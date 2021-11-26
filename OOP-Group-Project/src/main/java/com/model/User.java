package com.model;

public class User {

	private int id ;
	private String firstName;
	private String lastName;
	private String email;
	private String joinedDate;

	// Constructors
	public User(int id, String firstName, String lastName,String email) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email =email;
	}
	
	public User(int id, String firstName, String lastName, String email, String joinedDate) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.joinedDate = joinedDate;
	}

	//getters
	public int getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}



	public String getJoinedDate() {
		return joinedDate;
	}
	
}
