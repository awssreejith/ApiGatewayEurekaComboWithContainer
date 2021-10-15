package com.sreejith.sender.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.UUID;

@RestController
@RequestMapping("/sender")
public class SenderController {

    @Autowired
    private RestTemplate restTemplate;

    private static String myId  =UUID.randomUUID().toString();

    @GetMapping("/message")
    public ResponseEntity<?> message()
    {
        String myString = myId+"_Fizz - ";
        String receiver = "reciever-service";
        String fullUrl = String.format("http://%s/reciever/message",receiver);
        String response = restTemplate.getForObject(fullUrl,String.class);
        String retRespone = myString+response;
        return ResponseEntity.status(HttpStatus.OK).body(retRespone);
    }
}
