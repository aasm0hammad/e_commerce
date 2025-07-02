class AppException implements Exception {
  String errorTitle;
  String errorMessage;

  AppException({required this.errorTitle, required this.errorMessage});

  @override
  String toString() {
    return "$errorTitle: $errorMessage";
  }
}


class NoInternetException extends AppException{
  NoInternetException({required super.errorMessage}) : super(errorTitle: "No Internet Connection");
}

class BadRequestException extends AppException{
  BadRequestException({required super.errorMessage}) : super(errorTitle: "Bad Request");
}

class UnauthorisedException extends AppException{
  UnauthorisedException({required super.errorMessage}) : super(errorTitle: "Unauthorised");
}

class InvalidInputException extends AppException{
  InvalidInputException({required super.errorMessage}) : super(errorTitle: "Invalid Input");
}

class FetchDataException extends AppException{
  FetchDataException({required super.errorMessage}) : super(errorTitle: "Error During Communication");
}