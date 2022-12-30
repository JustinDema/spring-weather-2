package app.springweather.entity.forecast;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class HourlyForecast {
    private String dateTime;
    private Double temp;
    private Double feelsLike;
    private Double humidity;
    private Double snow;
    private Double snowDepth;
    private Double windSpeed;
    private Double pressure;
    private Double visibility;
    private String conditions;
    private String icon;
}
