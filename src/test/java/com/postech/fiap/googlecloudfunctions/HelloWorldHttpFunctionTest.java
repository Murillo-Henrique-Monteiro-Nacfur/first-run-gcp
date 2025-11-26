package com.postech.fiap.googlecloudfunctions;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
public class HelloWorldHttpFunctionTest {

    @Test
    public void testHelloEndpoint() {
        // Funqy maps functions with no input to a POST request by default.
        // The endpoint name matches the method name.
        given()
          .when().post("/hello")
          .then()
             .statusCode(200)
             .body(is("Hello World"));
    }

}
