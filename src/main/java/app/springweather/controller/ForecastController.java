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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        System.out.println(countryService.getAll().size());
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

    @GetMapping("/forecast")
    public ResponseEntity<Forecast> forecast() throws IOException, URISyntaxException{

        /*return new ResponseEntity<>(userService.getAllUsers(), HttpStatus.OK);*/
        return ResponseEntity.ok().body(visualcrossing.days(cityService.allCities().get(2)));

    }

    @GetMapping("/22")
    public String viewStorePage(Model model) throws IOException, URISyntaxException {
        model.addAttribute("forecast", visualcrossing.days(cityService.allCities().get(0)));
        return "index22";
    }
}
