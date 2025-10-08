import 'package:flutter_application_1/models/recommended_manga.dart';
import 'base/base_service.dart';

class RecommendedMangaService extends BaseService {
  /// Service gọi API RecommendedManga
  /// Dùng để lấy danh sách truyện được đề xuất từ backend
  RecommendedMangaService()
    : super(baseUrl: 'https://localhost:7231/RecommendedManga');

  /// Add fields here as needed, e.g. final String title;

  /// GET /RecommendedManga/all
  /// Lấy toàn bộ danh sách truyện được đề xuất
  /// Trả về List<dynamic> vì chưa có model cụ thể
  Future<List<RecommendedManga>> getAllRecommended() async {
    var item = await get('/all');
    List<RecommendedManga> result = (item as List)
        .map((json) => RecommendedManga.fromJson(json))
        .toList();
    return result;
  }
}
