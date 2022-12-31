package app.springweather.service;

import app.springweather.entity.City;
import app.springweather.repository.CityRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CityService {
    private final CityRepository cityRepository;

    public List<City> allCities(){
        return cityRepository.findAll();
    }

    public List<City> findByStateId(Long id){
        return cityRepository.findByStateId(id);
    }

    public City findCityById(Long id){
        return cityRepository.getById(id);
    }
}
