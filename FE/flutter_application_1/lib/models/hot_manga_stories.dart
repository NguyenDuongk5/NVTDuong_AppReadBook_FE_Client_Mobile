class HotMangaStories {
  final String mangaId;
  final String? mangaTitle;
  final String? mangaImage;
  final String categoryId;

  HotMangaStories({
    required this.mangaId,
    this.mangaTitle,
    this.mangaImage,
    required this.categoryId,
  });

  factory HotMangaStories.fromJson(Map<String, dynamic> json) {
    return HotMangaStories(
      mangaId: json['manga_id'] ?? '',
      mangaTitle: json['manga_tilte'], // chú ý BE đang để sai chính tả
      mangaImage: json['manga_image'],
      categoryId: json['category_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manga_id': mangaId,
      'manga_tilte': mangaTitle,
      'manga_image': mangaImage,
      'category_id': categoryId,
    };
  }
}
