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

}





