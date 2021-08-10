List<String> _messages = [];

addMessage(msg, isUser) {
  if(isUser) {
    if(msg=="Привет") {
      return "Привет-привет!";
    }
    else if (msg == null || msg == "") {
      return "...";
    }
    else {
      return "Шалаш";
    }
  }
}

addUMessage(msg, isUser) {
  _messages = [];
  _messages.add('{"msg":"$msg", "isUser":$isUser}');
  if(isUser) {
    if(msg=="Привет") {
      _messages.add('{"msg":"Привет-привет!", "isUser":false}');
    }
  }
  print(_messages);
}