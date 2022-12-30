package app.springweather.entity.forecast;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DailyForecast {
    private String dateTime;
    private Double tempMax;
    private Double tempMin;
    private Double temp;
    private Double feelsLike;
    private Double humidity;
    private Double snow;
    private Double snowDepth;
    private Double windSpeed;
    private Double pressure;
    private Double visibility;
    private String sunrise;
    private String sunset;
    private String conditions;
    private String description;
    private String icon;
    private List<HourlyForecast> hours;
}
