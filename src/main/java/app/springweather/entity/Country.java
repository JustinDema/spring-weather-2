package app.springweather.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "country")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "country_id", nullable = false)
    private Long id;

    @Column(name = "country_name", nullable = false, unique = true, length = 100)
    private String name;

    @Column(name = "country_code", nullable = false, unique = true, length = 3)
    private String code;

    @OneToMany(mappedBy = "country", orphanRemoval = true)
    @JsonIgnoreProperties("country")
    private Set<State> states = new LinkedHashSet<>();

}
