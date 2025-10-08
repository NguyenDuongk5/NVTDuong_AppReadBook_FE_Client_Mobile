import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/resource.dart';
import 'package:flutter_application_1/models/ranking_stories.dart';
import 'package:flutter_application_1/services/ranking_service.dart'; // Add this import or correct the path if needed

class RankingList extends StatefulWidget {
  const RankingList({super.key});

  @override
  State<RankingList> createState() => _RankingListState();
}

/// danh sach truyen xep hang
/// Author: nvtduong
/// Date: 11/09/25
class _RankingListState extends State<RankingList> {
  // Controller để điều khiển PageView
  late PageController _pageController;
  int _currentPage = 0;
  var itemAll = [];

  // Giả lập tải dữ liệu từ API
  final rankingService = RankingStoriesService();

  Future<void> loadData() async {
    // Gọi API RankingStories
    var rankingService = RankingStoriesService();
    var item = await rankingService.getAllRanking();
    setState(() {
      itemAll = item; // itemAll là List<RankingStories>
    });
  }

  @override
  void initState() {
    super.initState();
    // Khởi tạo PageController với viewportFraction để hiển thị nhiều cột
    _pageController = PageController(viewportFraction: 0.8);
    Future.delayed(Duration.zero, () async {
      await loadData();
    });
  }

  @override
  void dispose() {
    // Giải phóng tài nguyên
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mỗi trang có 3 mục
    final totalPages = (itemAll.length / 3).ceil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Tiêu đề
              Text(
                LocalizationService.text("ranking_this_month"),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // nút xem thêm
                  Text(
                    LocalizationService.text("ranking_full"),
                    style: TextStyle(
                      color: Color.fromARGB(255, 194, 194, 194),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4), // cách chữ với icon 1 chút
                  const Icon(
                    Icons.arrow_right,
                    color: Color.fromARGB(255, 194, 194, 194),
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Danh sách BXH từng trang
        Container(
          height: MediaQuery.of(context).size.height * 0.18 * 3,
          child: PageView.builder(
            // cho phép cuộn ngang
            controller: _pageController,

            // Tổng số trang
            itemCount: totalPages,

            // Cập nhật chỉ số trang hiện tại khi trang thay đổi
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },

            // Xây dựng từng trang
            itemBuilder: (context, columnIndex) {
              // Lấy 3 mục cho mỗi trang
              final startIndex = columnIndex * 3;

              // Đảm bảo không vượt quá độ dài danh sách
              final endIndex = (startIndex + 3 <= itemAll.length)
                  ? startIndex + 3
                  : itemAll.length;

              // Lấy nhóm 3 mục
              final group = itemAll.sublist(startIndex, endIndex);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,

                // Duyệt qua từng mục trong nhóm
                children: group.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),

                      // khung chứa mỗi mục
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          //xếp hạng
                          Text(
                            item.rank!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(width: 10),
                          // Ảnh
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              item.img!,
                              height:
                                  MediaQuery.of(context).size.height *
                                  0.1 *
                                  (4 / 3),
                              width: MediaQuery.of(context).size.height * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Nội dung
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title!,
                                  maxLines: 1,

                                  // nếu tiêu đề dài quá thì hiện dấu ...
                                  overflow: TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  // Lượt xem và tác giả
                                  children: [
                                    const Icon(
                                      Icons.visibility,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    Flexible(
                                      child: Text(
                                        " ${item.views}",
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
                                Text(
                                  item.author!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),

        // số trang
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          // Dấu chấm chỉ số trang
          children: List.generate(totalPages, (index) {
            /// hiệu ứng chuyển động mượt mà khi trang thay đổi
            return AnimatedContainer(
              duration: const Duration(
                // thời gian chuyển đổi
                milliseconds: 300,
              ),
              curve: Curves.easeInOut, // hiệu ứng chuyển đổi

              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              width: _currentPage == index
                  ? 16
                  : 8, // rộng hơn nếu là trang hiện tại
              height: 8,

              // màu sắc thay đổi nếu là trang hiện tại
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.white70
                    : Colors.grey.shade600,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
