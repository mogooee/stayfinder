package teamproject.airbnb.controller;

import java.time.LocalDate;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomSearchInfoRequestDto {

	private LocalDate checkIn;
	private LocalDate checkOut;
	private Long minimumPrice;
	private Long maximumPrice;
	private Integer guestCount;
	private Integer kidCount;
	private List<Long> wishList;
}
