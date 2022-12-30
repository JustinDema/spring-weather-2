package app.springweather.repository;

import app.springweather.entity.State;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StateRepository extends JpaRepository<State,Long> {

    @Query("select s from State s where s.country.id = ?1")
    List<State> findByCountry_Id(Long id);

    @Query("select s from State s inner join s.cities cities where cities.id = ?1")
    State findByCities_Id(Long id);



}
