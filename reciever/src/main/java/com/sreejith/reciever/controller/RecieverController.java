package com.sreejith.reciever.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.UUID;

@RestController
@RequestMapping("/reciever")
public class RecieverController {

    private static String myId = UUID.randomUUID().toString();

    @GetMapping("/message")
    public ResponseEntity<?> message()
    {
        String retRespone = "Buzz_"+myId;
        return ResponseEntity.status(HttpStatus.OK).body(retRespone);
    }
}
