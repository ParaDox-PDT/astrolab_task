import 'package:flutter_defualt_project/data/network/api_service.dart';

import '../local/storage_repository/storage_repository.dart';
import '../models/universal_response.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> loginUser(
      {required String username, required String password}) async {
    return apiService.loginUser(username: username, password: password);
  }

  Future<UniversalData> loginEdit(
      {required String name,
      required String phone,
      required String username,
      required String password}) async {
    return apiService.loginEdit(
        name: name, phone: phone, username: username, password: password);
  }

  Future<UniversalData> getUser() async {
    return apiService.getUser();
  }
  String getToken() => StorageRepository.getString("tokens");

  Future<bool?> putToken(String token)async=>StorageRepository.putString("token", token);
  Future<bool?> putTokenInMain(String token)async=>StorageRepository.putString("tokens", token);

  Future<bool?> deleteToken() async => StorageRepository.deleteString("token");
  Future<bool?> deleteTokens() async => StorageRepository.deleteString("tokens");
}
