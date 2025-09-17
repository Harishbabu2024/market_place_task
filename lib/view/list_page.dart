// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:market_place_task/base/base_view.dart';
// import 'package:market_place_task/view/single_post_view_page.dart';
// import 'package:market_place_task/viewModel/list_view_model.dart';
// import 'package:market_place_task/widget/profile_card_widget.dart';

// class ListPage extends StatelessWidget {
//   const ListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       model: ListViewModel(),
//       onModelReady: (data) async {
//         await data.fetchCategories(context);
//       },
//       builder:
//           (context, model, child) => Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               title: const Text(
//                 "Marketplace",
//                 style: TextStyle(color: Colors.white),
//               ),
//               flexibleSpace: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFFFF7304), Color(0xFFFB2A77)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//               ),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 16.0),
//                   child: SvgPicture.asset(
//                     "assets/list_header_ico.svg",
//                     height: 28,
//                     width: 28,
//                   ),
//                 ),
//               ],
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 children: [
//                   CustomSearchTabUI(),
//                   ListView.builder(
//                     itemCount:
//                         model.listPageModel?.marketplaceRequests?.length ?? 0,
//                     itemBuilder: (contexr, index) {
//                       final profile =
//                           model.listPageModel?.marketplaceRequests?[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: ProfileCardWidget(
//                           marketplaceRequest: profile,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SinglePostViewPage(id: profile?.idHash),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//     );
//   }
// }

// class CustomSearchTabUI extends StatelessWidget {
//   const CustomSearchTabUI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search bar with profile image
//               Row(
//                 children: [
//                   // Profile image
//                   const CircleAvatar(
//                     radius: 20,
//                     backgroundImage: NetworkImage(
//                       "https://i.pravatar.cc/150?img=3", // Replace with your profile image
//                     ),
//                   ),
//                   const SizedBox(width: 8),

//                   // Search field
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 14),
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.grey.shade100,
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       alignment: Alignment.centerLeft,
//                       child: const Text(
//                         "Type your requirement here . . .",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 20),

//               // Tab buttons row
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     _buildTabButton("For You", isSelected: false),
//                     const SizedBox(width: 8),
//                     _buildTabButton("Recent", isSelected: true),
//                     const SizedBox(width: 8),
//                     _buildTabButton("My Requests", isSelected: false),
//                     const SizedBox(width: 8),
//                     _buildTabButton("⭐ Top Ideas", isSelected: false),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );

//   }

//   Widget _buildTabButton(String text, {bool isSelected = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.white : Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: isSelected ? Colors.red : Colors.transparent,
//           width: 1.2,
//         ),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 14,
//           color: isSelected ? Colors.red : Colors.black87,
//           fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/base/base_view.dart';
import 'package:market_place_task/view/single_post_view_page.dart';
import 'package:market_place_task/viewModel/list_view_model.dart';
import 'package:market_place_task/widget/profile_card_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: ListViewModel(),
      onModelReady: (data) async {
        await data.fetchCategories(context);
      },
      builder:
          (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "Marketplace",
                style: TextStyle(color: Colors.white),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF7304), Color(0xFFFB2A77)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SvgPicture.asset(
                    "assets/list_header_ico.svg",
                    height: 28,
                    width: 28,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const CustomSearchTabUI(),

                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          model.listPageModel?.marketplaceRequests?.length ?? 0,
                      itemBuilder: (context, index) {
                        final profile =
                            model.listPageModel?.marketplaceRequests?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: ProfileCardWidget(
                            marketplaceRequest: profile,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => SinglePostViewPage(
                                        id: profile?.idHash,
                                      ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class CustomSearchTabUI extends StatefulWidget {
  const CustomSearchTabUI({super.key});

  @override
  State<CustomSearchTabUI> createState() => _CustomSearchTabUIState();
}

class _CustomSearchTabUIState extends State<CustomSearchTabUI> {
  String selectedTab = "Recent";

  final List<String> tabs = [
    "For You",
    "Recent",
    "My Requests",
    "⭐ Top Ideas",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/avathar.png",
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Type your requirement here . . .",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tabs.map((tab) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: _buildTabButton(
                  tab,
                  isSelected: selectedTab == tab,
                  onTap: () {
                    setState(() {
                      selectedTab = tab;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTabButton(String text,
      {bool isSelected = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.red : Color(0xFFE9E9E9),
            width: 1.2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.red : Colors.black87,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
