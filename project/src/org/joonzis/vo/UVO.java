package org.joonzis.vo;

import java.sql.Date;

public class UVO {
	private int u_idx;
	private String id, pw, name, nickname, birth_d, phone, addr1, addr2, addr3;
	private Date joindate;
	
	public UVO() {}

	public UVO(int u_idx, String id, String pw, String name, String nickname, String birth_d, String phone,
			String addr1, String addr2, String addr3, Date joindate) {
		super();
		this.u_idx = u_idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth_d = birth_d;
		this.phone = phone;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.joindate = joindate;
	}

	public int getU_idx() {
		return u_idx;
	}

	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth_d() {
		return birth_d;
	}

	public void setBirth_d(String birth_d) {
		this.birth_d = birth_d;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
	
}
