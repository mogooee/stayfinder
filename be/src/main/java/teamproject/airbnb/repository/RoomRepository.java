package teamproject.airbnb.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import javax.persistence.EntityManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import teamproject.airbnb.domain.Room;

@Repository
@RequiredArgsConstructor
public class RoomRepository {

	private EntityManager em;

	public List<Room> findAll() {
		return em.createQuery("select r from Room r", Room.class)
			.getResultList();
	}

	// 체크인, 체크아웃으로 조회해서 반환하는 메소드
	public List<Room> findReservationAvailable(LocalDate checkIn) {

		return findAll().stream()
			.filter(r -> r.isReservationAvailable(checkIn))
			.collect(Collectors.toList());
	}
}
