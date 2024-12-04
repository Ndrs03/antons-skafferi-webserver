
import jakarta.annotation.Resource;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jsonStructures.GreetingJson;

import javax.sql.DataSource;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/greeting")
public class GreetingResource {



    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public GreetingJson getGreeting() {
        return new GreetingJson("Hello, World!");
    }
}
