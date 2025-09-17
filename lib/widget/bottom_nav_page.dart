import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/core/app_assets.dart';
import 'package:market_place_task/view/list_page.dart';
import 'package:market_place_task/widget/no_data_widget.dart';

class BottomNavPage extends StatefulWidget {
  final int initialIndex;

  const BottomNavPage({super.key, this.initialIndex = 0});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const NoDataWidget(),
    ListPage(),
    const NoDataWidget(),
    const NoDataWidget(),
    const NoDataWidget(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1), // shadow on top
              blurRadius: 4,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, AppAssets.explore_ico, "Explore"),
              _buildNavItem(1, AppAssets.market_place_ico, "Market Place"),
              _buildNavItem(2, AppAssets.search_ico, "Search"),
              _buildNavItem(3, AppAssets.activity_ico, "Activity"),
              _buildNavItem(4, AppAssets.profile_ico, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildNavItem(int index, String icon, String label) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 24,
            width: 24,
            color: isSelected ? const Color(0xFFFE4545) : Colors.grey[700],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFFFE4545) : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
