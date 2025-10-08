import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/resource.dart';
import 'dart:async';
import 'package:flutter_application_1/services/hot_manga_service.dart';
// import 'package:flutter_application_1/services/localization_service.dart';

class HotManga extends StatefulWidget {
  const HotManga({super.key});

  @override
  State<HotManga> createState() => _HotMangaState();
}

/// danh sach truyen hot
/// Author: nvtduong
/// Date: 11/09/25

class _HotMangaState extends State<HotManga> {
  // hiển thị nhiều cột
  final PageController _pageController = PageController(viewportFraction: 0.25);

  /// lưu số trang hiên tại
  int _currentPage = 0;

  Timer? _timer;

  /// lưu toàn bộ dữ liệu manga
  var itemAll = [];

  @override
  /// Khi widget được tạo, sẽ gọi loadData() → lấy dữ liệu từ API (HomeService).
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      // load dữ liệu từ API
      await loadData();

      // sau khi load xong thì auto scroll
      _startAutoScroll();
    });
  }

  /// Giả lập tải dữ liệu từ API
  Future<void> loadData() async {
    /// tạo service
    var homeService = HomeService();

    /// gọi API
    var item = await homeService.getHotmanga();

    ///Cập nhật vào itemAll để UI render lại.
    setState(() {
      itemAll = item;
    });
  }

  void _startAutoScroll() {
    // Hủy timer cũ nếu có
    _timer?.cancel();

    // Tạo timer mới để tự động cuộn mỗi 3 giây
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // Kiểm tra nếu vẫn còn trang và controller còn hoạt động
      if (_pageController.hasClients) {
        setState(() {
          _currentPage++;

          // Nếu vượt quá số trang, quay lại trang đầu
          if (_currentPage >= itemAll.length) {
            _currentPage = 0;

            // nhảy thẳng về trang đầu
            _pageController.jumpToPage(0);
          } else {
            // Cuộn mượt đến trang tiếp theo
            _pageController.animateToPage(
              _currentPage,

              duration: const Duration(milliseconds: 600), // thời gian cuộn
              curve: Curves.easeInOut, // hiệu ứng cuộn
            );
          }
        });
      }
    });
  }

  @override
  // Hủy timer khi widget bị hủy để tránh rò rỉ bộ nhớ
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  /// Tạm dừng tự động cuộn khi người dùng tương tác
  void _pauseAutoScroll() {
    _timer?.cancel();
    // sau 1s ko vuốt thì chạy tiếp
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) _startAutoScroll();
    });
  }

  @override
  /// Xây dựng giao diện
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            // canh đều 2 bên
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // canh giữa theo chiều dọc
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Tiêu đề
              Text(
                LocalizationService.text("home_cannot_miss"),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // nút xem thêm
                  Text(
                    LocalizationService.text("home_hot"),
                    style: const TextStyle(
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

        // PageView
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Container(
            height: MediaQuery.of(context).size.width * 0.45 * (4 / 3),
            margin: EdgeInsets.only(left: 10),

            // Thêm PageView.builder để hiển thị các mục
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                _pauseAutoScroll();
                setState(() {
                  _currentPage = index;
                });
              },

              // Số lượng mục trong danh sách
              itemCount: itemAll.length,

              // Không cần pad hai đầu
              padEnds: false,
              itemBuilder: (context, index) {
                final story = itemAll[index];

                // Kiểm tra nếu mục hiện tại được chọn
                bool isActive = index == _currentPage;

                // Trả về widget cho mỗi mục
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  margin: EdgeInsets.symmetric(
                    horizontal: isActive ? 4 : 8,
                    vertical: isActive ? 10 : 15,
                  ),

                  // Hiệu ứng mờ dần khi không được chọn
                  child: AnimatedOpacity(
                    opacity: isActive ? 1.0 : 0.6,
                    duration: const Duration(milliseconds: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ảnh
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),

                            boxShadow: [
                              BoxShadow(
                                color: isActive
                                    ? Colors.white.withOpacity(0.8)
                                    : const Color(0xFFFFFFFF).withOpacity(0.3),
                                blurRadius: isActive ? 4 : 1,
                                spreadRadius: isActive ? 4 : 1,
                              ),
                            ],
                          ),

                          /// Ảnh bìa
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              story.mangaImage,
                              width: MediaQuery.of(context).size.width * 0.25,
                              height:
                                  MediaQuery.of(context).size.width *
                                  0.25 *
                                  1.25, // giữ tỉ lệ 1.25
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Tiêu đề
                        Container(
                          width: 120,
                          child: Text(
                            story.mangaTitle,
                            maxLines: 2,
                            // nếu tiêu đề dài quá thì hiện dấu ...
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width *
                                  0.03, // 3% chiều rộng màn hình
                            ),
                          ),
                        ),

                        // Thể loại
                        Wrap(
                          spacing: 4,
                          runSpacing: -4,
                          children: story.categoryId
                              // Duyệt qua từng thể loại và tạo widget Text
                              .map<Widget>(
                                (cat) => Text(
                                  cat,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 194, 194, 194),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                        0.03, // 3% chiều rộng màn hình
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
