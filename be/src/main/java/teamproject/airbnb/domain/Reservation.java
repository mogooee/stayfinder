package teamproject.airbnb.domain;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.Data;

@Data
@Entity
public class Reservation {

	@Id
	@GeneratedValue
	@Column(name = "RESERVATION_ID")
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ROOM_ID")
	private Room room;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MEMBER_ID")
	private Member member;

	private LocalDate checkIn;
	private LocalDate checkOut;
	private String hostName;
	private Long guest;
	private Long kid;
	private Long payment;

	// TODO
	public Boolean isExist(LocalDate checkIn, LocalDate checkOut) {

//		if((this.getCheckIn().isEqual(checkIn) || this.getCheckIn().isAfter(checkIn))
//			&&
//		(this.getCheckOut().isEqual(checkOut) || this.getCheckOut().isBefore(checkOut)))

		return !isBefore(checkOut) && !isAfter(checkIn);
	}

	// TODO
	public Boolean isBefore(LocalDate checkOut) {
		return this.getCheckIn().isBefore(checkOut);
	}

	// TODO
	public Boolean isAfter(LocalDate checkIn) {
		return this.getCheckOut().isAfter(checkIn);
	}
}
