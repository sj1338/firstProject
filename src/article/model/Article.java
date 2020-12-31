package article.model;

import java.util.Date;

public class Article {
	private String category;
	private Integer number;
	private Writer writer;
	private String title;
	private String content;
	private Date regDate;
	private Date modifiedDate;
	private int readCount;
	public Article(String category, Integer number, Writer writer, String title, String content, Date regDate, Date modifiedDate, int readCount) {
		super();
		this.category = category;
		this.number = number;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.modifiedDate = modifiedDate;
		this.readCount = readCount;
	}
	
	
	
	public Article() {
		// TODO Auto-generated constructor stubs
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public void setNo(int number) {
		this.number = number;
	}
	
	
	public String getCategory() {
		return category;
	}
	public Integer getNumber() {
		return number;
	}
	public Writer getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public int getReadCount() {
		return readCount;
	}



	@Override
	public String toString() {
		return "Article [category=" + category + ", number=" + number + ", writer=" + writer + ", title=" + title
				+ ", content=" + content + ", regDate=" + regDate + ", modifiedDate=" + modifiedDate + ", readCount="
				+ readCount + "]";
	}
	
	
}
