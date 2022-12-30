package app.springweather.controller;

import app.springweather.entity.forecast.DailyForecast;
import app.springweather.service.CityService;
import app.springweather.util.Visualcrossing;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ForecastController {
    private final CityService cityService;
    private final Visualcrossing visualcrossing;

    @GetMapping("/forecast")
    public ResponseEntity<List<DailyForecast>> forecast() throws IOException, URISyntaxException{

        /*return new ResponseEntity<>(userService.getAllUsers(), HttpStatus.OK);*/
        return ResponseEntity.ok().body(visualcrossing.days(cityService.allCities().get(0)));

    }

    @GetMapping("/22")
    public String viewStorePage(Model model) throws IOException, URISyntaxException {
        model.addAttribute("forecast", visualcrossing.days(cityService.allCities().get(0)));
        return "index22";
    }
}
