package com.postech.fiap.googlecloudfunctions;

import io.quarkus.funqy.Funq;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class HelloWorldHttpFunction {

    @Funq
    public String hello() {
        return "Hello World Tiko";
    }
}
