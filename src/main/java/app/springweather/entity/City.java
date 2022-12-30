package app.springweather.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "city")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id", nullable = false)
    private Long id;

    @Column(name = "city_name", nullable = false, length = 100)
    private String name;

    @ManyToOne(optional = false)
    @JoinColumn(name = "state_id", nullable = false)
    private State state;

    public String cityAdress(){
        return name.concat(",").concat(state.getName()).concat(",").concat(state.getCountry().getName());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
