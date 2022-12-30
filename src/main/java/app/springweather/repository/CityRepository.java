package app.springweather.repository;

import app.springweather.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityRepository extends JpaRepository<City, Long> {

    @Query("select c from City c where c.state.country.id = ?1")
    List<City> findByCountryId(Long id);

    @Query("select c from City c where c.state.id = ?1")
    List<City> findByStateId(Long id);

}
