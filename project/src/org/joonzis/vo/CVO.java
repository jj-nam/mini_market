package org.joonzis.vo;

import java.sql.Date;

public class CVO {
	private int b_idx, c_idx, c_price;
	private String writer, content, c_ip;
	private Date reg_date;
	
	public CVO() {}

	public CVO(int b_idx, int c_idx, int c_price, String writer, String content, String c_ip, Date reg_date) {
		super();
		this.b_idx = b_idx;
		this.c_idx = c_idx;
		this.c_price = c_price;
		this.writer = writer;
		this.content = content;
		this.c_ip = c_ip;
		this.reg_date = reg_date;
	}

	public int getB_idx() {
		return b_idx;
	}

	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}

	public int getC_idx() {
		return c_idx;
	}

	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getC_ip() {
		return c_ip;
	}

	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
