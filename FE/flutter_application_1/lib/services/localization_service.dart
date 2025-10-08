// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_application_1/services/base/base_service.dart';

// /// Service gọi API Localization
// /// Dùng để lấy toàn bộ dữ liệu đa ngôn ngữ từ backend
// class LocalizationService extends BaseService {
//   LocalizationService() : super(baseUrl: 'https://localhost:7231/Localization');

//   /// Map lưu trữ key-value localization sau khi tải về
//   static final Map<String, String> _localizedValues = {};

//   /// GET /Localization/all
//   /// Lấy toàn bộ danh sách key/value từ backend
//   Future<void> fetchAll() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/all'));

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonData = json.decode(response.body);

//         _localizedValues.clear();
//         for (var item in jsonData) {
//           final k = item['key'] ?? item['Key'];
//           final v = item['value'] ?? item['Value'];
//           if (k != null && v != null) {
//             _localizedValues[k.toString()] = v.toString();
//           }
//         }
//       } else {
//         throw Exception(
//           'Failed to load localization (status ${response.statusCode})',
//         );
//       }
//     } catch (e) {
//       rethrow; // để cho caller tự xử lý nếu cần
//     }
//   }

//   /// Hàm lấy text theo key
//   /// Nếu chưa có dữ liệu hoặc key không tồn tại → trả về chính key
//   static String text(String key) => _localizedValues[key] ?? key;
// }
