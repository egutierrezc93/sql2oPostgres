import lombok.Data;

import java.util.Date;

@Data
public class Producto {

    private Long id;
    private String nombre;
    private Double precio;
    private Integer cantidad;
    private Date fecha;
}