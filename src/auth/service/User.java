package auth.service;

import java.util.Date;

public class User {
	private String id;
	private String name;
	private String password;
	private Date regdate;
	
	public User() {
		
	}
	
	public User(String id, String name, String password, Date regdate) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.regdate = regdate;
	}
	
	public Date getRegdate() {
		return regdate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
