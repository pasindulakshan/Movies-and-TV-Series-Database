package com.model;

public class Celebrity {
	private int cid;
    private String fname;
    private String lname;
    private String dob;
    private String country;
    private int height;
    private String description;
    private String bio;
    private String profession;
    private String coverName;

    //constructors
	public Celebrity(int i) {
		this.cid = i;
	}

	public Celebrity(int cid, String fname, String lname) {
		this.cid = cid;
		this.fname = fname;
		this.lname = lname;
	}

	public Celebrity(int cid2, String fname2, String lname2, String image) {
		this.cid = cid2;
		this.fname = fname2;
		this.lname = lname2;
		this.coverName = image;
	}
	
	public Celebrity(int cid, String fname, String lname, String dob, String country, int height, String description,
			String bio, String profession, String coverName) {
		this.cid = cid;
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
		this.country = country;
		this.height = height;
		this.description = description;
		this.bio = bio;
		this.profession = profession;
		this.coverName = coverName;
	}
	
	public Celebrity(String fname, String lname, String dob, String country, int height, String description,
			String bio, String profession, String coverName) {
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
		this.country = country;
		this.height = height;
		this.description = description;
		this.bio = bio;
		this.profession = profession;
		this.coverName = coverName;
	}	
	
	public Celebrity(int cid, String fname, String lname, String country, String profession, String coverName) {
		this.cid = cid;
		this.fname = fname;
		this.lname = lname;
		this.country = country;
		this.profession = profession;
		this.coverName = coverName;
	}	

	//getters 
	public int getCid() {
		return cid;
	}
	public String getFname() {
		return fname;
	}
	public String getLname() {
		return lname;
	}
	public String getDob() {
		return dob;
	}
	public String getCountry() {
		return country;
	}
	public int getHeight() {
		return height;
	}
	public String getDescription() {
		return description;
	}
	public String getBio() {
		return bio;
	}
	public String getProfession() {
		return profession;
	}
	public String getCoverName() {
		return coverName;
	}
	
}
