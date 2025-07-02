abstract class UserEvent{}


class SignUpEvent extends UserEvent{

  Map<String,dynamic> bodyParam;

  SignUpEvent({required this.bodyParam});

}

class LoginEvent extends UserEvent{
  Map<String,dynamic> bodyParams;

  LoginEvent({required this.bodyParams});

}