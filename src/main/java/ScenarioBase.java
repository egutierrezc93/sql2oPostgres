import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
public class ScenarioBase implements Serializable {
    private int id;
    private String code;
    private int target_id;
    private String description;
    private String test_definition;
    private Date date_created;
    private String assigned;

    @Override
    public String toString() {
        return "ScenarioBase{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", target_id=" + target_id +
                ", description='" + description + '\'' +
                ", test_definition='" + test_definition + '\'' +
                ", date_created=" + date_created +
                ", assigned='" + assigned + '\'' +
                '}';
    }
}





