package com.model;

public class Admin {
    private int AdminID;
    private String fname;
    private String lname;
    private String email;
    
    //constructor
    public Admin(int AdminID, String fname, String lname, String email) {
	this.AdminID = AdminID;
	this.fname = fname;
	this.lname = lname;
	this.email = email;

    }

    //getters
    public int getAdminId() {
        return AdminID;
    }

    public String getFName() {
        return fname;
    }

    public String getLName() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    
}
