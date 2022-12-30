package app.springweather.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "state")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class State {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "state_id", nullable = false)
    private Long id;

    @Column(name = "state_name", nullable = false, length = 100)
    private String name;

    @ManyToOne(optional = false)
    @JoinColumn(name = "country_id", nullable = false)
    @JsonIgnoreProperties("states")
    private Country country;

    @OneToMany(mappedBy = "state", orphanRemoval = true)
    @JsonIgnoreProperties("state")
    private Set<City> cities = new LinkedHashSet<>();

}
