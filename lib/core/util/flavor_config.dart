import '../../core/util/string_util.dart';
import 'env/env.dart';

enum Flavor { DEV, PROD }

extension FlavorExtension on Flavor {
  String get env {
    switch (this) {
      case Flavor.DEV:
        return ".env.dev";
      case Flavor.PROD:
        return ".env.prod";
      default:
        return ".env.dev";
    }
  }
}

class FlavorValues {
  FlavorValues({
    required this.baseApiUrl,
  });

  final String baseApiUrl;
}

Flavor? globalFlavor;

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static late FlavorConfig _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    globalFlavor = flavor;
    _instance = FlavorConfig._internal(
      flavor,
      flavor.toString().enumName(),
      values,
    );

    return _instance;
  }

  FlavorConfig._internal(
    this.flavor,
    this.name,
    this.values,
  );

  static FlavorConfig get instance => _instance;

  static init(Flavor flavor) async {
    final env = _getEnvironment(flavor);

    FlavorConfig(
      flavor: flavor,
      values: FlavorValues(
        baseApiUrl: env['BASE_API_URL'],
      ),
    );
  }

  static _getEnvironment(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        return {
          'BASE_API_URL': DevEnv.baseApiUrl,
        };
      case Flavor.PROD:
      default:
        return {
          'BASE_API_URL': ProdEnv.baseApiUrl,
        };
    }
  }

  static bool isProduction() => _instance.flavor == Flavor.PROD;

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
}
