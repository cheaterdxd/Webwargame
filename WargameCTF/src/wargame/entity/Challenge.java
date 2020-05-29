package wargame.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NaturalIdCache;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "Challenges")
public class Challenge {
	@Id
	@GeneratedValue
	@Column(name = "challengeID")
	private int challengeID;
	
	@Column(name = "challengName")
	private String challengeName;
	
	@Column(name = "score")
	private int score;
	
	@Column(name = "fileAttach")
	private String fileAttach;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "hint")
	private String hint;
	
	@Column(name = "major")
	private String major;
	
	@Column(name = "flag")
	private String flag;

	@OneToMany(mappedBy = "solvedKey.chall", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<Solved> solvedBy = new ArrayList<>();

	public Challenge() {
	}

	public Challenge(String challengeName, int score, String fileAttach, String description, String hint, String major,
			String flag) {
		super();
		this.challengeName = challengeName;
		this.score = score;
		this.fileAttach = fileAttach;
		this.description = description;
		this.hint = hint;
		this.major = major;
		this.flag = flag;
	}

	public int getId() {
		return challengeID;
	}

	public void setId(int id) {
		this.challengeID = id;
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

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public List<Solved> getSolvedBy() {
		return solvedBy;
	}

	public void setSolvedBy(List<Solved> solvedBy) {
		this.solvedBy = solvedBy;
	}

	// method bất đắc dĩ :<
	public List<String> changeStringFileToList() {
//		String fileRootPath = "D:/JAVACODE/WargameCTF/";
		List<String> listFile = new ArrayList<String>();
		if (this.fileAttach == null)
			return listFile;
		String[] fileAtt = this.fileAttach.split(";");
		for (String file : fileAtt) {
			System.out.println(file.equals(""));
			if (!file.equals("") && file != null)
				listFile.add(file);
		}
		System.out.println(listFile);
		return listFile;
	}

	public boolean isSovledBy(String mail) {
		boolean check = false;
		for (Solved s : this.solvedBy) {
			if (s.getSolvedKey().getUser().getMail().equals(mail)) {
				check = true;
			}
		}
		return check;
	}

	@Override
	public String toString() {
		return ("Id:" + this.challengeID + "\n" + "Name:" + this.challengeName + "\n" + "Score:" + this.score + "\n" + "File:"
				+ this.fileAttach + "\n" + "Description:" + this.description + "\n" + "Major:" + this.major + "\n"
				+ "Hint:" + this.hint + "\n" + "Flag:" + this.flag);
	}
}
