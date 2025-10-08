// import 'package:flutter/material.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Custom Bottom Bar Demo',
//       theme: ThemeData.dark(),
//       home: const HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   final List<_NavItem> items = [
//     _NavItem(label: 'Trang Chủ', icon: Icons.home),
//     _NavItem(label: 'Phân Loại', icon: Icons.layers),
//     _NavItem(label: 'Theo Dõi', icon: Icons.person_add),
//     _NavItem(label: 'Tủ Sách', icon: Icons.bookmark),
//     _NavItem(label: 'Tôi', icon: Icons.mood),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Màn hình ${items[_currentIndex].label}',
//           style: const TextStyle(fontSize: 24),
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         top: false,
//         child: Container(
//           color: const Color(0xFF1C1C1C),
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(items.length, (index) {
//               final item = items[index];
//               final bool active = index == _currentIndex;
//               return Expanded(
//                 child: InkWell(
//                   onTap: () => setState(() => _currentIndex = index),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         item.icon,
//                         size: 24,
//                         color: active
//                             ? const Color(0xFF3EA7FF)
//                             : const Color(0xFFC2C2C2),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         item.label,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: active
//                               ? const Color(0xFF3EA7FF)
//                               : const Color(0xFFC2C2C2),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _NavItem {
//   final String label;
//   final IconData icon;
//   const _NavItem({required this.label, required this.icon});
// }
