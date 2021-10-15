# ApiGatewayEurekaComboWithContainer
This repo contains implementation for Api Gateway Eureka Combo deployable in container

This contains the below 4 services

0) Discovery service
1) Api gateway service
2) Sender service
3) reciever service

- The Api gateway, Sender and reciever service will register with Eureka server.
- The sender and reciever service will be using dynamic port
- The api gateway and eureka will be using static port [8080 and 8761 repectively]
- Each service has associated Dockerfile
- The orchestration is done using docker-compose

