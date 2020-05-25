package wargame.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NaturalIdCache;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "SolvedComposite")
public class Solved implements Serializable {
	@EmbeddedId
	private SolvedKey solvedKey;

	@Column(name = "dateSolved")
	private String dateSolved ;

	public Solved() {
	}

	public SolvedKey getSolvedKey() {
		return solvedKey;
	}

	public void setSolvedKey(SolvedKey solvedKey) {
		this.solvedKey = solvedKey;
	}

	public String getDateSolved() {
		return dateSolved;
	}

	public void setDateSolved(String dateSolved) {
		this.dateSolved = dateSolved;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Solved that = (Solved) o;
		return Objects.equals(solvedKey, that.solvedKey);
	}

	@Override
	public int hashCode() {
		return Objects.hash(solvedKey);
	}

//	@Override
//	public String toString() {
//		return (this.user + "\n" + this.chall + "\n" + this.dateSolved + "\n");
//	}
}
