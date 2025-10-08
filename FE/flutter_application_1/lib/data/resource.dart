/**
 * nvtduong
 * 11/09/25
 * noi luu tru text
 */
class LocalizationService {
  static const Map<String, String> vi = {
    "home_cannot_miss": "Không thể bỏ lỡ",
    "home_hot": "Hot nhất",
    "menu_home": "Trang chủ",
    "menu_category": "Danh mục",
    "menu_follow": "Theo dõi",
    "menu_book": "Tủ sách",
    "menu_self": "Tôi",
    "search_hint": "Tìm kiếm...",
    //text trang ranking_list
    "ranking_this_month": "BXH tháng này",
    "ranking_full": "BXH hoàn chỉnh",
    //text trang recomment_list
    "you_can_like": "Có thể bạn sẽ thích",
    "more": "Thêm",
    "all_shown": "Đã hiển thị hết",
  };

  // Nếu muốn hỗ trợ đa ngôn ngữ sau này thì có thể thêm map en, jp,...
  // static const Map<String, String> en = {...};

  static String text(String key) {
    return vi[key] ?? key;
  }
}
