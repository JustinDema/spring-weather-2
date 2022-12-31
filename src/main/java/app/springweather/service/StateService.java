package app.springweather.service;

import app.springweather.entity.State;
import app.springweather.repository.StateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StateService {
    private final StateRepository stateRepository;
    public List<State> getAll(){
      return   stateRepository.findAll();
    }

    public List<State> findByCountryId(Long id){
        return stateRepository.findByCountry_Id(id);
    }
}
