import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/resource.dart';
// import 'package:flutter_application_1/services/localization_service.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  // Xử lý chuyển trang
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Color _iconColor(int index) {
    return _currentIndex == index
        ? const Color(0xFF3EA7FF) // xanh khi chọn
        : const Color(0xFFC2C2C2); // xám khi không chọn
  }

  Color _textColor(int index) {
    return _currentIndex == index ? const Color(0xFF3EA7FF) : Colors.white;
  }

  /// Thanh điều hướng dưới cùng
  /// Author: nvtduong
  /// Date: 9/9/25
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C1C1C),

      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Trang chủ
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: _iconColor(0)),
                onPressed: () => _onItemTapped(0),
                iconSize: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                LocalizationService.text("menu_home"),
                style: TextStyle(color: _textColor(0), fontSize: 12),
              ),
            ],
          ),

          // Phân loại
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.layers, color: _iconColor(1)),
                onPressed: () => _onItemTapped(1),
                iconSize: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                LocalizationService.text("menu_category"),
                style: TextStyle(color: _textColor(1), fontSize: 12),
              ),
            ],
          ),

          // Theo dõi
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.person_add, color: _iconColor(2)),
                onPressed: () => _onItemTapped(2),
                iconSize: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                LocalizationService.text("menu_follow"),
                style: TextStyle(color: _textColor(2), fontSize: 12),
              ),
            ],
          ),

          // Tủ sách
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.bookmark, color: _iconColor(3)),
                onPressed: () => _onItemTapped(3),
                iconSize: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                LocalizationService.text("menu_book"),
                style: TextStyle(color: _textColor(3), fontSize: 12),
              ),
            ],
          ),

          // Tôi
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.mood, color: _iconColor(4)),
                onPressed: () => _onItemTapped(4),
                iconSize: MediaQuery.of(context).size.width * 0.06,
              ),
              Text(
                LocalizationService.text("menu_self"),
                style: TextStyle(color: _textColor(4), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
