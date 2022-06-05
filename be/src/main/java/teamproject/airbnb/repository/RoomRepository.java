package teamproject.airbnb.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import teamproject.airbnb.domain.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {

	public List<Room> findAll();
}
