import 'package:flutter_application_1/models/ranking_stories.dart';
import 'base/base_service.dart';

/// Service gọi API RankingStories
/// Dùng để lấy danh sách truyện xếp hạng từ backend
class RankingStoriesService extends BaseService {
  // ✅ Chú ý: đổi baseUrl đúng với BE của bạn
  // Nếu chạy emulator Android thì dùng http://10.0.2.2:5000 thay cho localhost
  RankingStoriesService()
    : super(baseUrl: 'https://localhost:7231/RankingStories');

  /// GET /RankingStories/all
  /// Lấy toàn bộ danh sách truyện xếp hạng
  Future<List<RankingStories>> getAllRanking() async {
    var item = await get('/all');
    List<RankingStories> result = (item as List)
        .map((json) => RankingStories.fromJson(json))
        .toList();
    return result;
  }

  /// POST /RankingStories/post
  /// (Nếu BE có API tạo mới, bạn có thể gọi như thế này)
  Future<Map<String, dynamic>> createRanking(Map<String, dynamic> data) async {
    return await post('/post', data);
  }
}
