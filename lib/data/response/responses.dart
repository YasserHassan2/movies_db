import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/error_dto.dart';



@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "error")
  ErrorDto? error;
  @JsonKey(name: "access_token")
  String? access_token;

  BaseResponse({
    this.status,
    this.data,
    this.success,
    this.error,
    this.access_token,
  });


  BaseResponse.fromJson(Map<String, dynamic> json, {int? statusCode}) {
    status = json['status'];
    error = json['error'];
    success = json['success'];
    data = json['data'];
    access_token = json['access_token'];
  }
}
