import 'dart:convert';

class RecommendedManga {
  final String img;
  final String title;
  final String views;
  final String author;
  final String rank;

  RecommendedManga({
    required this.img,
    required this.title,
    required this.views,
    required this.author,
    required this.rank,
  });

  /// Parse JSON -> RecommendedManga
  /// dùng khi nhận dữ liệu từ API
  /// Nếu json thiếu trường nào thì gán giá trị mặc định ''
  factory RecommendedManga.fromJson(Map<String, dynamic> json) {
    return RecommendedManga(
      img: json['img']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      views: json['views']?.toString() ?? '',
      author: json['author']?.toString() ?? '',
      rank: json['rank']?.toString() ?? '',
    );
  }

  /// RecommendedManga -> JSON
  /// dùng khi cần gửi dữ liệu về API
  /// Chú ý: nếu trường nào có thể null thì kiểm tra null trước khi thêm vào map
  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'title': title,
      'views': views,
      'author': author,
      'rank': rank,
    };
  }

  /// Tiện dụng: chuyển list object -> list json
  /// dùng khi cần gửi list dữ liệu về API
  static List<RecommendedManga> listFromJson(String jsonStr) {
    final List<dynamic> data = json.decode(jsonStr);
    return data.map((e) => RecommendedManga.fromJson(e)).toList();
  }
}
