class Story {
  final String title;
  final List<String> categories;
  final String image;

  Story({required this.title, required this.categories, required this.image});
}

/// data ảo về list truyện hot
/// dùng trong file hot_manga.dart
/// author: nvtduong
/// date: 7/9/25

List<Story> HotMangaStories = [
  Story(
    title: "Hợp Đồng Hôn Nhân Với Tổng Tài Ác Ma",
    categories: ["Hôn Nhân", "Ngôn Tình"],
    image: "lib/imgs/onepiece.jpg",
  ),
  Story(
    title: "Truy Thê: Chồng Của Ảnh Hậu Không Dễ Làm",
    categories: ["Tình Yêu", "Đô Thị"],
    image: "lib/imgs/1.png",
  ),
  Story(
    title: "[RhyiCap] Thương Thầm Em Trai Nuôi?",
    categories: ["CP Idol"],
    image: "lib/imgs/2.png",
  ),
  Story(
    title: "[DuongHieu] Một Đời",
    categories: ["CP Idol"],
    image: "lib/imgs/3.png",
  ),
  Story(
    title: "[DuongHieu] Một Đời",
    categories: ["CP Idol"],
    image: "lib/imgs/4.png",
  ),
  Story(
    title: "[DuongHieu] Một Đời",
    categories: ["CP Idol"],
    image: "lib/imgs/1.png",
  ),
  Story(
    title: "[DuongHieu] Một Đời",
    categories: ["CP Idol"],
    image: "lib/imgs/2.png",
  ),
  Story(
    title: "[DuongHieu] Một Đời",
    categories: ["CP Idol"],
    image: "lib/imgs/onepiece.jpg",
  ),
  Story(
    title: "[DuongHieu] Một Đời",
    categories: ["CP Idol"],
    image: "lib/imgs/onepiece.jpg",
  ),
];

/// data ảo về list truyện xếp hạng
/// dùng trong file ranking_list.dart
/// author: nvtduong
/// date: 7/9/25

final List<Map<String, String>> RankingStories = [
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "1",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "2",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "3",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "4",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "5",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "6",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "7",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "8",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "9",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "10",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "11",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "12",
  },
];

final recommendedManga = [
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "7",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "8",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "9",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "10",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "11",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "12",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "7",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "8",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "9",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "10",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "11",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "12",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "7",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "8",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "9",
  },
  {
    "img": "lib/imgs/1.png",
    "title": "TÌNH YÊU MÀU NẮNG: CHÀ...",
    "views": "1.71M",
    "author": "Ngọt sủng / 419",
    "rank": "10",
  },
  {
    "img": "lib/imgs/2.png",
    "title": "Bác Sĩ Hứa Tha Cho Tôi",
    "views": "1.42M",
    "author": "Yêu thầm / Ông Xã Thần Ph...",
    "rank": "11",
  },
  {
    "img": "lib/imgs/3.png",
    "title": "Bất Cẩn Rung Động, Một Đời Nâng Niu",
    "views": "430.28K",
    "author": "Tình yêu / Tổng tài",
    "rank": "12",
  },
];
