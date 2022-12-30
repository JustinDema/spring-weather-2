package app.springweather.util;

import app.springweather.entity.City;
import app.springweather.entity.forecast.DailyForecast;
import app.springweather.entity.forecast.Forecast;
import app.springweather.entity.forecast.HourlyForecast;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.nio.charset.Charset;

@Service
public class Visualcrossing {
    private String rawResult( City city) throws IOException, URISyntaxException {
        final  String startDate = new DateUtil().dateFormatter(new Date());
        final String endDate = new DateUtil().dateFormatter(new DateUtil().fiveDaysFromNow(new Date()));
        final String apiEndPoint="https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/";
        final String unitGroup="metric";
        final String apiKey="ZBNUN6MVSDYDRYS4P5YDLZCQ2";

        String location = city.cityAdress();
        StringBuilder requestBuilder = new StringBuilder(apiEndPoint);
        requestBuilder.append(URLEncoder.encode(location, StandardCharsets.UTF_8.toString()));

        if (startDate!=null && !startDate.isEmpty()) {
            requestBuilder.append("/").append(startDate);
            if (endDate!=null && !endDate.isEmpty()) {
                requestBuilder.append("/").append(endDate);
            }
        }

        URIBuilder builder = new URIBuilder(requestBuilder.toString());

        builder.setParameter("unitGroup", unitGroup)
                .setParameter("key", apiKey);



        HttpGet get = new HttpGet(builder.build());

        CloseableHttpClient httpclient = HttpClients.createDefault();

        CloseableHttpResponse response = httpclient.execute(get);

        String rawResult=null;
        try {
            if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
                System.out.printf("Bad response status code:%d%n", response.getStatusLine().getStatusCode());
                return "Bad response status code:" + response.getStatusLine().getStatusCode();
            }

            HttpEntity entity = response.getEntity();
            if (entity != null) {
                rawResult= EntityUtils.toString(entity, Charset.forName("utf-8"));
            }


        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            response.close();
        }
        return rawResult;
    }
    List<HourlyForecast> hours(JSONArray hours){
        List<HourlyForecast> output = new ArrayList<>();
        for (int i = 0; i < hours.length(); i++) {
            JSONObject hourValue = hours.getJSONObject(i);

            String dateTime = hourValue.getString("datetime");
            Double temp = hourValue.getDouble("temp");
            Double feelsLike = hourValue.getDouble("feelslike");
            Double humidity = hourValue.getDouble("humidity");
            Double snow = hourValue.getDouble("snow");
            Double snowDepth = hourValue.getDouble("snowdepth");
            Double windSpeed = hourValue.getDouble("windspeed");
            Double pressure = hourValue.getDouble("pressure");
            Double visibility = hourValue.getDouble("visibility");
            String conditions = hourValue.getString("conditions");
            String icon = "static/img/" + hourValue.getString("icon")+".png";

            HourlyForecast hourlyForecast = new HourlyForecast(dateTime, temp, feelsLike, humidity, snow, snowDepth, windSpeed, pressure, visibility, conditions,  icon);
            output.add(hourlyForecast);
        }
        return output;
    }

    public Forecast days(City city) throws IOException, URISyntaxException {
        String rawResult = rawResult(city);
        List<DailyForecast> output = new ArrayList<>();

        if (rawResult==null || rawResult.isEmpty()) {
            return null;
        }else {
            JSONObject timelineResponse = new JSONObject(rawResult);
            JSONArray values=timelineResponse.getJSONArray("days");
            for (int i = 0; i < values.length(); i++) {
                JSONObject dayValue = values.getJSONObject(i);

                String dateTime = dayValue.getString("datetime");
                String address = city.cityAdress().replace(",", ", ");
                Double maxTemp = dayValue.getDouble("tempmax");
                Double minTemp = dayValue.getDouble("tempmin");
                Double temp = dayValue.getDouble("temp");
                Double feelsLike = dayValue.getDouble("feelslike");
                Double humidity = dayValue.getDouble("humidity");
                Double snow = dayValue.getDouble("snow");
                Double snowDepth = dayValue.getDouble("snowdepth");
                Double windSpeed = dayValue.getDouble("windspeed");
                Double pressure = dayValue.getDouble("pressure");
                Double visibility = dayValue.getDouble("visibility");
                String sunrise = dayValue.getString("sunrise");;
                String sunset = dayValue.getString("sunset");;
                String conditions = dayValue.getString("conditions");
                String description = dayValue.getString("description");
                String icon = "static/img/" + dayValue.getString("icon")+".png";
                List<HourlyForecast> hourly = hours(dayValue.getJSONArray("hours"));

                DailyForecast dailyForecast = new DailyForecast(dateTime,  maxTemp, minTemp, temp, feelsLike, humidity, snow, snowDepth, windSpeed, pressure, visibility, sunrise,sunset,conditions,description, icon, hourly );
                output.add(dailyForecast);
            }

            String timezone = timelineResponse.getString("timezone");
            Forecast forecast = new Forecast(city,timezone, output);
            return forecast;
        }
    }
}
