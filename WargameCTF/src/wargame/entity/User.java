package wargame.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.istack.internal.Nullable;


@Entity
@Table(name="Users")
public class User {
	// declare field
	@Column(name="Username")
	private String userName;
	@Id
	@Column(name="Mail")
	private String mail;
	@Column(name="Password")
	private String passWord;
	@Column(name ="Validation")
	private boolean valid;
	@Column(name="Isadmin")
	@Nullable
	private boolean isAdmin;
	
	public boolean getIsAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	// generate get/set method
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public boolean getValidation() {
		return valid;
	}
	public void setValidation(boolean valid) {
		this.valid = valid;
	}
}
