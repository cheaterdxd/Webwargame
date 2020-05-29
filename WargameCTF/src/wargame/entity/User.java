package wargame.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NaturalId;
import org.hibernate.annotations.NaturalIdCache;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import com.sun.istack.internal.NotNull;
import com.sun.istack.internal.Nullable;

@Entity
@Table(name = "Users")
public class User {
	// declare field
	@Id
//	@Email(message = "Xin vui lòng nhập đúng định dạng")
	@Column(name = "Mail")
	private String mail;
	
//	@Pattern(regexp = "\\w+",message = "Username chỉ gồm chữ và số")
//	@Length(max =15,min = 1,message = "Username ngắn hơn 15 kí tự")
	@Column(name = "Username")
	private String userName;
	
	@Column(name = "Password")
	private String passWord;
	
	@Column(name = "Validation")
	private boolean valid;
	
	@Column(name = "Isadmin")
	private boolean isAdmin;

	@OneToMany(mappedBy = "solvedKey.user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Solved> challs = new ArrayList<Solved>();

	public User() {
	}

	public User(String mail, String userName, String passWord, boolean valid, boolean isAdmin) {
		super();
		this.mail = mail;
		this.userName = userName;
		this.passWord = passWord;
		this.valid = valid;
		this.isAdmin = isAdmin;
	}

//	public void addSolved(Challenge chall) {
//		Solved solved = new Solved(this, chall);
//		solves.add(solved);
//		chall.getSolvedBy().add(solved);
//	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public boolean getIsAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

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

	public List<Solved> getSolves() {
		return challs;
	}

	public List<Solved> getChalls() {
		return challs;
	}

	public void setChalls(List<Solved> challs) {
		this.challs = challs;
	}

	@Override
	public String toString() {
		return ("Mail:" + this.mail + "\n" + "Username:" + this.userName + "\n" + "Password:" + this.passWord + "\n"
				+ "Isvalid:" + this.valid + "\n" + "IsAdmin:" + this.isAdmin);
	}

	public void addSolved(Solved s) {
		this.challs.add(s);
	}
}
