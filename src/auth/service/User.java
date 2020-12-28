package auth.service;

import java.util.Date;

public class User {
	private String id;
	private String name;
	private Date regdate;
	
	public User() {
		
	}
	
	public User(String id, String name, Date regdate) {
		super();
		this.id = id;
		this.name = name;
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

	
	
}
