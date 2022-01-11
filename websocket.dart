

import 'dart:html';

WebSocket? _socket;

WebSocketClass() {
  connectToServer();
}

connectToServer() async {
  _socket = WebSocket("wss://ws.ifelse.io");


  await _socket?.onOpen.first.then((value) {
    print("Opened");
    socketOpened();
  });
  _socket?.onError.first.then((value) {
    print("Error");
    socketClosed();
  });


  _socket?.onClose.first.then((value) {
    print("Closed");
    socketClosed();
  });
}

socketOpened(){
  _socket?.onMessage.listen((event) {
    print("Message: \n${event.data}");
  });
}

socketClosed(){
  print("Socket closed, please run again");
}

sendMessage(String text){
  _socket?.send(text);
}

void main()async{
  await connectToServer();
  sendMessage('Hello');
}

