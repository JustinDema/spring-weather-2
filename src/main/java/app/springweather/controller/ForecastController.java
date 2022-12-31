package app.springweather.controller;

import app.springweather.entity.City;
import app.springweather.entity.State;
import app.springweather.entity.forecast.DailyForecast;
import app.springweather.entity.forecast.Forecast;
import app.springweather.service.CityService;
import app.springweather.service.CountryService;
import app.springweather.service.StateService;
import app.springweather.util.Visualcrossing;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ForecastController {
    private final CityService cityService;
    private final CountryService countryService;
    private final StateService stateService;
    private final Visualcrossing visualcrossing;

    @GetMapping("/")
    public String showPage(Model model) {
        model.addAttribute("countryList", countryService.getAll());
        return "index";
    }

    @GetMapping("/getStates")
    public @ResponseBody String getStates(@RequestParam Long countryId)
    {
        String json = null;
        List<State> list = stateService.findByCountryId(countryId);
        try {
            json = new ObjectMapper().writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    @GetMapping("/getCities")
    public @ResponseBody String getCities(@RequestParam Long stateId)
    {
        String json = null;
        List<City> list = cityService.findByStateId(stateId);
        try {
            json = new ObjectMapper().writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    @GetMapping("/forecast1")
    public ResponseEntity<Forecast> forecast() throws IOException, URISyntaxException{

        /*return new ResponseEntity<>(userService.getAllUsers(), HttpStatus.OK);*/
        return ResponseEntity.ok().body(visualcrossing.days(cityService.allCities().get(2)));

    }

    @RequestMapping("/forecast/{city_id}")
    public String getForecast(@PathVariable("city_id") Long cityId, Model model) throws IOException, URISyntaxException {
        City city = cityService.findCityById(cityId);
        Forecast forecast = visualcrossing.days(city);
        model.addAttribute("data", forecast);
        return "forecast.html";
    }
}
