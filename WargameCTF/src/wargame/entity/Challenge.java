package wargame.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Challenges")
public class Challenge {
	@Id
	@Column(name = "ID")
	private int id;
	
	@Column(name="challengName")
	private String challengeName;
	
	@Column(name = "score")
	private int score;
	
	@Column(name="fileAttach")
	private String fileAttach;
	
	@Column(name="fileAttach")
	private String description;
	
	@Column(name="hint")
	private String hint;
	
	@Column(name="major")
	private String major;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChallengeName() {
		return challengeName;
	}
	public void setChallengeName(String challengeName) {
		this.challengeName = challengeName;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getFileAttach() {
		return fileAttach;
	}
	public void setFileAttach(String fileAttach) {
		this.fileAttach = fileAttach;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHint() {
		return hint;
	}
	public void setHint(String hint) {
		this.hint = hint;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
}
