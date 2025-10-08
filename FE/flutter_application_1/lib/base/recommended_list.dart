import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/fake_data.dart';
import 'package:flutter_application_1/services/recommended_service.dart';
import 'package:flutter_application_1/models/recommended_manga.dart';
import 'package:flutter_application_1/data/resource.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => RecommendedListState();
}

/// danh sach truyen dc goi y
/// Author: nvtduong
/// Date: 11/09/25
class RecommendedListState extends State<RecommendedList> {
  final List<Map<String, String>> _items = []; // Danh sách dữ liệu đã load
  int _page = 0; // trang hiện tại

  // số truyện mỗi lần load
  final int _pageSize = 2;

  // cờ báo đang load dữ liệu
  bool _isLoading = false;

  // cờ báo xem còn dữ liệu hay không
  bool _hasMore = true;

  // Giả lập dữ liệu từ API
  final RecommendedMangaService recommendedMangaService =
      RecommendedMangaService();
  List<RecommendedManga> _recommendedMangaList = [];

  Future<List<RecommendedManga>> fetchRecommendedManga() async {
    var recommendedService = RecommendedMangaService();
    var items = await recommendedService.getAllRecommended();
    return items; // items là List<RecommendedManga>
  }

  /// Khởi tạo lần đầu với 1 trang dữ liệu
  @override
  void initState() {
    fetchAndLoadFirstPage(); // Load trang đầu tiên
    loadMore(); // Load trang đầu tiên
  }

  /// Hàm tải lại dữ liệu và load trang đầu tiên
  /// Gọi khi khởi tạo hoặc khi muốn tải lại từ đầu
  Future<void> fetchAndLoadFirstPage() async {
    setState(() => _isLoading = true);

    /// Lấy toàn bộ danh sách truyện được đề xuất từ API
    _recommendedMangaList = await recommendedMangaService.getAllRecommended();
    _items.clear();
    _page = 0;
    _hasMore = true;

    /// Load trang đầu tiên
    setState(() => _isLoading = false);
    await loadMore();
  }

  /// Hàm load thêm dữ liệu
  /// Gọi khi cuộn đến cuối danh sách
  Future<void> loadMore() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);

    /// Giả lập độ trễ tải dữ liệu từ API
    await Future.delayed(const Duration(milliseconds: 2000));

    final start = _page * _pageSize;
    final end = start + _pageSize;

    /// Kiểm tra nếu đã hết dữ liệu
    if (start >= _recommendedMangaList.length) {
      _hasMore = false;
    } else {
      _items.addAll(
        _recommendedMangaList
            .sublist(
              start,
              end > _recommendedMangaList.length
                  ? _recommendedMangaList.length
                  : end,
            )
            .map(
              (manga) => {
                'img': manga.img,
                'title': manga.title,
                'views': manga.views.toString(),
                'author': manga.author,
                'rank': manga.rank.toString(),
              },
            ),
      );
      _page++;
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tiêu đề
              Text(
                LocalizationService.text("you_can_like"),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                // nút xem thêm
                children: [
                  Text(
                    LocalizationService.text("more"),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_right, color: Colors.grey, size: 18),
                ],
              ),
            ],
          ),
        ),

        // Danh sách
        ListView.separated(
          // cho phép ListView trong Column
          shrinkWrap: true,

          // không cho phép cuộn trong ListView, tránh xung đột với CustomScrollView cha
          physics: const NeverScrollableScrollPhysics(),

          padding: const EdgeInsets.symmetric(horizontal: 16),

          // +1 để hiển thị widget loading hoặc hết dữ liệu
          itemCount: _items.length + 1,

          // khoảng cách giữa các item
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            // index của item
            // Nếu index nhỏ hơn độ dài danh sách thì hiển thị item
            if (index < _items.length) {
              // Lấy dữ liệu item
              final item = _items[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ảnh bìa
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['img']!,
                      height: MediaQuery.of(context).size.width * 0.2 * 1.25,
                      width: MediaQuery.of(context).size.width * 0.2,
                      fit: BoxFit.cover, // cover để ảnh không bị méo
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Nội dung
                  Expanded(
                    // Expanded để chiếm hết không gian còn lại
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // canh trái
                      children: [
                        // Tiêu đề
                        Text(
                          item['title']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          // Lượt xem
                          children: [
                            const Icon(
                              Icons.visibility,
                              color: Colors.white70,
                              size: 18,
                            ),
                            Flexible(
                              child: Text(
                                " ${item["views"]}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Tác giả
                        Text(
                          item['author']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),

                        // ranking
                        Text(
                          "Hot nhất No.${item['rank']!}",
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // Hiển thị widget loading hoặc hết dữ liệu
              if (_isLoading) {
                // đang load dữ liệu
                return const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 4,
                        strokeCap: StrokeCap.round,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Đang tải dữ liệu...',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                );
              }
              // Nếu đã hết dữ liệu thì hiển thị thông báo
              if (!_hasMore) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      LocalizationService.text("all_shown"),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
