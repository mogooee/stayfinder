package teamproject.airbnb.service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import lombok.AllArgsConstructor;
import lombok.Data;
import teamproject.airbnb.domain.Room;

@Data
@AllArgsConstructor
public class RoomQuantityDto {

	private Long minimumPrice;
	private Long maximumPrice;
	private Long[] roomQuantity;

	public static RoomQuantityDto from(List<Room> rooms) {

		Long maximumPrice = rooms.stream()
			.mapToLong(x -> x.getPrice())
			.max()
			.getAsLong();

		Long minimumPrice = rooms.stream()
			.mapToLong(x -> x.getPrice())
			.min()
			.getAsLong();

		// TODO 동일한 값은 같은 인덱스에 넣어주도록 해야 한다.
		Long[] roomQuantity = rooms.stream()
			.sorted(Comparator.comparing(Room::getPrice))
			.toArray(Long[]::new);

		return new RoomQuantityDto(minimumPrice, maximumPrice, roomQuantity);
	}
}
