import 'dart:math';

import '../../domain/requests/login_request.dart';
import '../../domain/requests/register_request.dart';
import '../network/app_api.dart';
import '../response/responses.dart';

abstract class RemoteDataSource {
  Future<BaseResponse> login(LoginRequest loginRequest);

  Future<BaseResponse> register(RegisterRequest registerRequest);

  Future<BaseResponse> getLookups();

  Future<BaseResponse> getCountries();

  Future<BaseResponse> getServices();

  Future<BaseResponse> getPopularServices();

  Future<BaseResponse> getWhoAmIData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<BaseResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<BaseResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.registration(
        registerRequest.firstName!,
        registerRequest.lastName!,
        registerRequest.about!,
        registerRequest.tags!,
        registerRequest.preferredSocialMedia!,
        registerRequest.salary!,
        registerRequest.password!,
        registerRequest.email!,
        registerRequest.birthDate!,
        registerRequest.gender!,
        registerRequest.typeId!,
        registerRequest.confirmPassword!,
        registerRequest.avatar!);
  }

  @override
  Future<BaseResponse> getCountries() async {
    return await _appServiceClient.countries();
  }

  @override
  Future<BaseResponse> getLookups() async {
    return await _appServiceClient.lookupsData();
  }

  @override
  Future<BaseResponse> getPopularServices() async {
    return await _appServiceClient.popularServices();
  }

  @override
  Future<BaseResponse> getServices() async {
    return await _appServiceClient.services();
  }

  @override
  Future<BaseResponse> getWhoAmIData() async {
    return await _appServiceClient.whoAmIData();
  }
}
