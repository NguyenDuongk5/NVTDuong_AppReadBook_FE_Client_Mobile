import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/resource.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  /// Thanh tìm kiếm ở đầu trang
  /// Author: nvtduong
  /// Date: 9/9/25
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
        color: const Color(0xFF242424), // nền ngoài cùng

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // thanh tìm kiếm
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                // TextField để nhập tìm kiếm
                child: TextField(
                  style: const TextStyle(color: Colors.white60),
                  decoration: InputDecoration(
                    // placeholder trong ô tìm kiếm
                    hintText: LocalizationService.text("search_hint"),

                    hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end, // canh phải
              children: [
                IconButton(
                  icon: const Icon(Icons.leaderboard, color: Colors.white70),
                  onPressed: () {
                    print("Leaderboard");
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.grid_view, color: Colors.white70),
                  onPressed: () {
                    print("Grid view");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
