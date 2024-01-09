class ErrorDto{
  String message;
  int code;

  ErrorDto({
    required this.code,
    required this.message,
  });
  factory ErrorDto.fromJson(Map<String, dynamic> json) => ErrorDto(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}