import 'package:flutter_application_1/models/hot_manga_stories.dart';

/// Import BaseService (class đã viết trong base_service) để tái sử dụng các hàm gọi API
import 'base/base_service.dart';

class HomeService extends BaseService {
  HomeService() : super(baseUrl: 'https://localhost:7231/Manga');

  ///Hàm lấy danh sách Hot Manga
  Future<List<HotMangaStories>> getHotmanga() async {
    ///Gọi API GET https://localhost:7231/HotMangaStories/all
    var item = await get('/all');

    ///item chính là danh sách JSON (List<dynamic>) từ server.
    List<HotMangaStories> result = (item as List)
        .map((json) => HotMangaStories.fromJson(json))
        .toList();
    return result;
  }
}
