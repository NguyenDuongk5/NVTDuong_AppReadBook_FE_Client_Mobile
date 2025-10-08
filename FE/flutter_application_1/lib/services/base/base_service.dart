// Dùng để chuyển đổi dữ liệu JSON <-> Map
import 'dart:convert';
// Thư viện http để gửi request
import 'package:http/http.dart' as http;

/// BaseService: lớp cơ sở để thực hiện các yêu cầu HTTP cơ bản (GET, POST, PUT, DELETE)
/// Sử dụng package http để gửi yêu cầu và nhận phản hồi
/// Author: NHThai 6.9.2024
class BaseService {
  final String baseUrl;

  /// baseUrl: URL gốc của API, truyền vào khi khởi tạo đối tượng, ví dụ 'https://api.example.com'
  BaseService({required this.baseUrl});

  /// =======================
  /// GET request(lấy)
  /// endpoint: đường dẫn API, ví dụ '/posts'
  /// headers: thêm header tuỳ chọn
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return _processResponse(response);
  }

  /// =======================
  /// POST request(tạo)
  /// endpoint: đường dẫn API
  /// body: dữ liệu gửi lên dạng Map
  /// headers: thêm header tuỳ chọn (default JSON)
  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _processResponse(response);
  }

  /// =======================
  /// PUT request(thay thế)
  /// endpoint: đường dẫn API
  /// body: dữ liệu cập nhật
  /// headers: tuỳ chọn
  Future<dynamic> put(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.put(
      //Gửi request GET
      Uri.parse('$baseUrl$endpoint'), //Ghép baseUrl + endpoint thành Url đầy đủ
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _processResponse(response); // Xử lý response trả về
  }

  /// =======================
  /// DELETE request
  /// endpoint: đường dẫn API
  /// headers: tuỳ chọn
  Future<dynamic> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return _processResponse(response);
  }

  /// =======================
  /// Batch request (nhiều request cùng lúc)
  /// requests: List<Map> mỗi Map chứa:
  ///   - method: 'GET', 'POST', 'PUT', 'DELETE'
  ///   - endpoint: đường dẫn API
  ///   - body: dữ liệu gửi (tuỳ method)
  Future<List<dynamic>> batch(List<Map<String, dynamic>> requests) async {
    List<dynamic> results = [];

    for (var req in requests) {
      String method = req['method']?.toUpperCase() ?? 'GET';
      String endpoint = req['endpoint'];
      Map<String, dynamic>? body = req['body'];
      Map<String, String>? headers = req['headers'];

      switch (method) {
        case 'GET':
          results.add(await get(endpoint, headers: headers));
          break;
        case 'POST':
          results.add(await post(endpoint, body ?? {}, headers: headers));
          break;
        case 'PUT':
          results.add(await put(endpoint, body ?? {}, headers: headers));
          break;
        case 'DELETE':
          results.add(await delete(endpoint, headers: headers));
          break;
        default:
          throw Exception('Method không hỗ trợ: $method');
      }
    }

    return results;
  }

  /// =======================
  /// Xử lý response chung
  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Nếu response rỗng
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    } else {
      throw Exception('Lỗi API: ${response.statusCode} - ${response.body}');
    }
  }
}
