package com.model;

public class Episode {
	
	private int snumber;
	private int enumber;
	private String airdate;
	private String etitle;
	private String tdlink;
	
	//constructor
	public Episode(int snumber, int enumber, String airdate, String etitle, String tdlink) {
		this.snumber = snumber;
		this.enumber = enumber;
		this.airdate = airdate;
		this.etitle = etitle;
		this.tdlink = tdlink;
	}

	//getters
	public int getSnumber() {
		return snumber;
	}

	public int getEnumber() {
		return enumber;
	}

	public String getAirdate() {
		return airdate;
	}

	public String getEtitle() {
		return etitle;
	}

	public String getTdlink() {
		return tdlink;
	}

}
