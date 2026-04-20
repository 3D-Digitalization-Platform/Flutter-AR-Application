class EnvConfig {

  /// 🌐 TODO Add static env variables here
  /// 🌐 Backend API URL
  /// Change this to your production URL when ready
  static const String baseUrl = "http://localhost:5109";

  /// 🛠 Environment Mode
  static const bool isDevelopment = true;

  /// ⏳ Request Timeout in milliseconds
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;

  /*
   * 💡 HOW TO USE THIS CONFIG:
   * 
   * 1. Import it: 
   *    import 'path/to/core/config/env_config.dart';
   * 
   * 2. Use the constants directly:
   *    final url = Uri.parse('${EnvConfig.baseUrl}/users');
   * 
   * 3. Example of conditional logic:
   *    if (EnvConfig.isDevelopment) {
   *      print("Running in Dev Mode");
   *    }
   */
}
