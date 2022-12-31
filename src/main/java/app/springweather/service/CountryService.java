package app.springweather.service;

import app.springweather.entity.Country;
import app.springweather.repository.CountryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CountryService {
    private final CountryRepository countryRepository;

    public List<Country> getAll(){
        return countryRepository.findAll();
    }
}
