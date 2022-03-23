import 'package:faker/faker.dart';
import 'package:logger/logger.dart';

import '../../network/app_config.dart';
import '../../network/network_service.dart';

final Logger log = Logger();
final NetworkService apiBaseHelper =
    NetworkService(baseUrl: AppConfig.coreBaseUrl);
final Faker faker = Faker();
