package app.springweather.entity.forecast;

import app.springweather.entity.City;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Forecast {

    private City city;

    private String timezone;
    private List<DailyForecast> dailyForecasts;
}
