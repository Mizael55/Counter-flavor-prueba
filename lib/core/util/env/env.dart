import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env.dev')
abstract class DevEnv {
  @EnviedField(varName: 'BASE_API_URL')
  static const String baseApiUrl = _DevEnv.baseApiUrl;
}

@Envied(path: '.env.prod')
abstract class ProdEnv {
  @EnviedField(varName: 'BASE_API_URL')
  static const String baseApiUrl = _ProdEnv.baseApiUrl;
}
