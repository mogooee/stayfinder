package teamproject.airbnb;

import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AirbnbApplication {

	public static void main(String[] args) {
		SpringApplication.run(AirbnbApplication.class, args);
	}

	@Bean
	Hibernate5Module hibernate5Module(){
		// 지연로딩이면 잭슨이 도메인을 굳이 json 으로 뽑아내지 말고 놔두게 하기 위함
		// 도메인을 DTO 로 전환하면 필요 없어질듯
		return new Hibernate5Module();
	}
}
