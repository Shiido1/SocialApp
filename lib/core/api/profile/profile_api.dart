import '../../network/network_service.dart';

class ProfileApi {
  final NetworkService _networkService;

  ProfileApi({required NetworkService networkService})
      : _networkService = networkService;
}
