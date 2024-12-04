

import jakarta.annotation.Resource;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

import javax.sql.DataSource;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.sql.Connection;
import java.sql.SQLException;

import static java.lang.System.out;

@Path("/hello")
public class HelloResource {

    @Resource(lookup = "jdbc/MySqlPool")
    DataSource dataSource;


    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getHello() {
        try (Connection connection = dataSource.getConnection()) {
            return ((java.sql.Connection) connection).getMetaData().getDatabaseProductName() + "-" + ((java.sql.Connection) connection).getCatalog();

        } catch (SQLException e) {
            //e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}
