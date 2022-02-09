import org.sql2o.Sql2o;
import org.sql2o.Connection;
//import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ConnectionJDBC {

    public static void main(String[] args) throws SQLException {

        Sql2o sql2o = new Sql2o("jdbc:postgresql://localhost:5432/postgres",
                "admin", "admin123");
        Connection connection = null;
        try {

            connection = sql2o.open();

            System.out.println("Conexión abierta");


        } catch (Exception e) {
            System.out.println("No se pudo conectar" + e);
        }
        try {
            String sql = "SELECT * FROM producto;";

            List<Producto> result = connection
                    .createQuery(sql)
                    .executeAndFetch(Producto.class);

            result.forEach(System.out::println);

        } catch (Exception e) {

            System.out.println("No pudo hacer la consulta" + e);
        }


//        String jdbcURL = "jdbc:postgresql://localhost:5432/bd_prueba";
//        String username="admin";
//        String password = "admin123";
//
//
//        try{
//
//            Connection connection = DriverManager.getConnection(jdbcURL,username,password);
//            System.out.println("Conexion OK");
//            connection.close();
//        }catch (SQLException e){
//            System.out.println("No se pudo conectar"+e);
//            e.printStackTrace();
//        }
    }

}