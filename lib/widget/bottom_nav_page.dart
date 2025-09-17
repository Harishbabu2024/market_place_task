import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/core/app_assets.dart';
import 'package:market_place_task/view/list_page.dart';
import 'package:market_place_task/widget/dummy.dart';

// // class BottomNavPage extends StatefulWidget {
// //   final int initialIndex;

// //   const BottomNavPage({super.key, this.initialIndex = 0});

// //   @override
// //   State<BottomNavPage> createState() => _BottomNavPageState();
// // }

// // class _BottomNavPageState extends State<BottomNavPage>
// //     with TickerProviderStateMixin {
// //   int _selectedIndex = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _selectedIndex = widget.initialIndex;
// //   }

// //   final List<Widget> _pages = [
// //     const Dummy(key: PageStorageKey('home')),
// //     Dummy(key: PageStorageKey('booking')),
// //     const Dummy(key: PageStorageKey('account')),
// //   ];

// //   void _onItemTapped(int index) {
// //     if (_selectedIndex != index) {
// //       setState(() {
// //         _selectedIndex = index;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: AnimatedSwitcher(
// //         duration: const Duration(milliseconds: 300),
// //         switchInCurve: Curves.easeInOut,
// //         switchOutCurve: Curves.easeInOut,
// //         layoutBuilder: (currentChild, previousChildren) {
// //           return Stack(
// //             children: <Widget>[
// //               ...previousChildren,
// //               if (currentChild != null) currentChild,
// //             ],
// //           );
// //         },
// //         transitionBuilder: (Widget child, Animation<double> animation) {
// //           return FadeTransition(opacity: animation, child: child);
// //         },
// //         child: KeyedSubtree(
// //           key: ValueKey<int>(_selectedIndex),
// //           child: _pages[_selectedIndex],
// //         ),
// //       ),
// //       bottomNavigationBar: Container(
// //         padding: const EdgeInsets.all(10),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black12,
// //               offset: Offset(0, 0), // negative Y -> shadow on top
// //               blurRadius: 4,
// //             ),
// //           ],
// //         ),
// //         child: SafeArea(
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: [
// //               _buildAnimatedNavItem(0, AppAssets.explore_ico, "Explore"),
// //               _buildAnimatedNavItem(1, AppAssets.explore_ico, "Market Place"),
// //               _buildAnimatedNavItem(2, AppAssets.explore_ico, "Search"),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildAnimatedNavItem(int index, String icon, String label) {
// //     final bool isSelected = _selectedIndex == index;
// //     return GestureDetector(
// //       onTap: () => _onItemTapped(index),
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 250),
// //         curve: Curves.easeInOut,
// //         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
// //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             AnimatedScale(
// //               scale: isSelected ? 1.1 : 1,
// //               duration: const Duration(milliseconds: 200),
// //               child: SvgPicture.asset(icon, height: 28, width: 28),
// //             ),
// //             const SizedBox(height: 4),
// //             AnimatedDefaultTextStyle(
// //               duration: const Duration(milliseconds: 200),
// //               style: TextStyle(
// //                 fontSize: 12,
// //                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //                 color: Colors.grey,
// //               ),
// //               child: Text(label),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  bool? isNipUser;

  @override
  void initState() {
    super.initState();
    _pages = [Dummy(), ListPage(), Dummy(), Dummy(), Dummy()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Define the callback function to update the index
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFFFE4545),
            unselectedItemColor: Colors.grey[700],
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.explore_ico),
                  color:
                      _selectedIndex == 0
                          ? Color(0xFFFE4545)
                          : Colors.grey[700],
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.explore_ico),
                  color:
                      _selectedIndex == 1
                          ? Color(0xFFFE4545)
                          : Colors.grey[700],
                ),
                label: 'MarketPlace',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.explore_ico),
                  color:
                      _selectedIndex == 2
                          ? Color(0xFFFE4545)
                          : Colors.grey[700],
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.explore_ico),
                  color:
                      _selectedIndex == 3
                          ? Color(0xFFFE4545)
                          : Colors.grey[700],
                ),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppAssets.explore_ico),
                  color:
                      _selectedIndex == 4
                          ? Color(0xFFFE4545)
                          : Colors.grey[700],
                ),
                label: 'Profile',
              ),
            ],
          ),

          // BottomNavigationBar(
          //   type: BottomNavigationBarType.fixed,
          //   items: <BottomNavigationBarItem>[
          //     const BottomNavigationBarItem(
          //       icon: const ImageIcon(AssetImage("assets/explore_ico.png")),
          //       label: 'Explore',
          //     ),
          //     const BottomNavigationBarItem(
          //       icon: const ImageIcon(AssetImage("assets/explore_ico.png")),
          //       label: 'MarketPlace',
          //     ),
          //     const BottomNavigationBarItem(
          //       icon: const ImageIcon(AssetImage("assets/explore_ico.png")),
          //       label: 'Search',
          //     ),
          //     const BottomNavigationBarItem(
          //       icon: const ImageIcon(AssetImage("assets/explore_ico.png")),
          //       label: 'Activity',
          //     ),
          //     const BottomNavigationBarItem(
          //       icon: const ImageIcon(AssetImage("assets/explore_ico.png")),
          //       label: 'Profile',
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: Color(0xFFFE4545),
          //   selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          //   unselectedItemColor: Colors.grey[700],
          //   backgroundColor: Colors.white,
          //   onTap: _onItemTapped,
          // ),
        ],
      ),
    );
  }
}
