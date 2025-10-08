import 'dart:convert';
import 'package:http/http.dart' as http;

class RankingStories {
  final String img;
  final String title;
  final String views;
  final String author;
  final String rank;

  RankingStories({
    required this.img,
    required this.title,
    required this.views,
    required this.author,
    required this.rank,
  });

  /// Parse JSON -> RankingStories
  /// dùng khi nhận dữ liệu từ API
  factory RankingStories.fromJson(Map<String, dynamic> json) {
    return RankingStories(
      img: json['img']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      views: json['views']?.toString() ?? '',
      author: json['author']?.toString() ?? '',
      rank: json['rank']?.toString() ?? '',
    );
  }

  /// RankingStories -> JSON
  /// dùng khi cần gửi dữ liệu về API
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
  static List<RankingStories> listFromJson(String jsonStr) {
    final List<dynamic> data = json.decode(jsonStr);
    return data.map((e) => RankingStories.fromJson(e)).toList();
  }
}
