abstract class ApiManager {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParams});
  Future<Map<String, dynamic>> post(String url, {Map<String, dynamic>? data});
  Future<Map<String, dynamic>> put(String url, {Map<String, dynamic>? data});
  Future<Map<String, dynamic>> delete(String url, {Map<String, dynamic>? data});
}
