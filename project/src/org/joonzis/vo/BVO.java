package org.joonzis.vo;

import java.sql.Date;

public class BVO {
	private int b_idx, hit, price;
	private String writer, title, content, filename, ip;
	private Date reg_date;
	
	public BVO() {}

	public BVO(int b_idx, int hit, int price, String writer, String title, String content, String filename,
			String ip, Date reg_date) {
		super();
		this.b_idx = b_idx;
		this.hit = hit;
		this.price = price;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.ip = ip;
		this.reg_date = reg_date;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
