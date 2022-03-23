import 'package:google_sign_in/google_sign_in.dart';

import '../../network/network_service.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class AuthApi {
  final NetworkService _networkService;

  AuthApi({required NetworkService networkService})
      : _networkService = networkService;
}
