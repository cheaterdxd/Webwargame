package wargame.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class SolvedKey implements Serializable {

	@ManyToOne(optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "Mail", referencedColumnName = "Mail")
	private User user;

	@ManyToOne(optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "challengeID", referencedColumnName = "challengeID")
	private Challenge chall;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Challenge getChall() {
		return chall;
	}

	public void setChall(Challenge chall) {
		this.chall = chall;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		SolvedKey that = (SolvedKey) o;
		return Objects.equals(user, that.user) && Objects.equals(chall, that.chall);
	}

	@Override
	public int hashCode() {
		return Objects.hash(user, chall);
	}
}
