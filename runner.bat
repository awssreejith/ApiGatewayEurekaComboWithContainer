START /B java -jar C:\MyStudy\Java\SenderReceiver\discovery\target\discovery-1.0.0.jar
timeout /t 10
START /B java -jar C:\MyStudy\Java\SenderReceiver\apigateway\target\apigateway-1.0.0.jar
START /B java -jar C:\MyStudy\Java\SenderReceiver\sender\target\sender-1.0.0.jar
START /B java -jar C:\MyStudy\Java\SenderReceiver\reciever\target\reciever-1.0.0.jar

Rem Additional instances of same services
Rem START /B java -jar C:\MyStudy\Java\SenderReceiver\sender\target\sender-1.0.0.jar
Rem START /B java -jar C:\MyStudy\Java\SenderReceiver\reciever\target\reciever-1.0.0.jar