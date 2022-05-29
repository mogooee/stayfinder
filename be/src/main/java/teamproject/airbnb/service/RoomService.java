package teamproject.airbnb.service;

import java.time.LocalDate;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import teamproject.airbnb.repository.RoomRepository;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class RoomService {

	private final RoomRepository roomRepository;

	// TODO
	public RoomQuantityDto loadQuantity(LocalDate checkIn) {
		// 체크인 ~ 체크아웃에 해당하는 room 을 모두 조회해서
		// 모든 room 중에서 잔여방의 수가 있고, ( 이건 roomRepository를 이용해서 스트림으로 모든 것을 조회해서 꺼내면서 DTO로 변환
		// 예약 중에 해당 checkIn~checkOut 기간을 제외한 예약을 지니고 있는
		// 종류의 room 들을의 종류 수를 요금에 따라 구분
		// 물론 최소요금이랑 최대요금도 미리 구해놔야겠지

		// 여기서 DTO 만들어야할듯 최소값, 최대값, 가격별 방개수를 기록한 배열이 담긴 DTO를 넘겨줘야할듯

		return RoomQuantityDto.from(roomRepository.findReservationAvailable(checkIn));
	}
}
