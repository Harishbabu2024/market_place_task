import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/widget/profile_card_widget.dart';
import 'package:market_place_task/widget/text_widget.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Marketplace", style: TextStyle(color: Colors.white)),
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
            // ProfileCardWidget(
            //   borderRadius: 12,
            //   borderColor: Color(0xFFE9E9E9),
            //   child:
            //    Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Flexible(
            //             flex: 2,
            //             child: Container(
            //               height: 56,
            //               width: 56,
            //               decoration: const BoxDecoration(
            //                 shape: BoxShape.circle,
            //               ),
            //               clipBehavior: Clip.antiAlias,
            //               child: Image.asset("assets/avathar.png"),
            //             ),
            //           ),
            //           Flexible(
            //             flex: 8,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 TextWidget(
            //                   text: "Angel Rosser",
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w600,
            //                   color: Color(0xFF1F1F1F),
            //                 ),
            //                 TextWidget(
            //                   text: "Sales Manager at Meesho privated limited",
            //                   fontSize: 12,
            //                   fontWeight: FontWeight.w400,
            //                   maxLines: 1,
            //                   color: Color(0xFF7E7E7E),
            //                 ),
            //                 Row(
            //                   children: [
            //                     const Icon(
            //                       Icons.access_time, // Clock icon
            //                       size: 16, // Adjust size as needed
            //                       color:
            //                           Colors
            //                               .grey, // Typical color for time icons
            //                     ),
            //                     const SizedBox(
            //                       width: 4,
            //                     ), // Small space between icon and text
            //                     const Text(
            //                       "2m",
            //                       style: TextStyle(
            //                         fontSize: 14,
            //                         color: Colors.grey,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Flexible(
            //             flex: 2,
            //             child: SvgPicture.asset(
            //               "assets/right_arrow_ico.svg",
            //               height: 28,
            //               width: 28,
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 8),
            //       Row(
            //         children: [
            //           const Icon(
            //             Icons.access_time, // Clock icon
            //             size: 16, // Adjust size as needed
            //             color: Colors.grey, // Typical color for time icons
            //           ),
            //           const SizedBox(
            //             width: 4,
            //           ), // Small space between icon and text
            //           TextWidget(
            //             text: "Sales Manager at Meesho privated limited",
            //             fontSize: 12,
            //             fontWeight: FontWeight.w600,
            //             maxLines: 1,
            //             color: Color(0xFF1F1F1F),
            //           ),
            //         ],
            //       ),

            //       SizedBox(height: 8),
            //       Divider(),
            //       SizedBox(height: 2),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           TextWidget(
            //             text: "Budget: \$${3000}",
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //           TextWidget(
            //             text: "Brand: \$${3000}",
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //           TextWidget(
            //             text: "Location: \$${3000}",
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //           TextWidget(
            //             text:
            //                 "Type: Lifestyle & Adventure travel content with a focus on young, urban audiences",
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //           TextWidget(
            //             text: "Language: English and Hindi",
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //           TextWidget(
            //             text:
            //                 "Looking for a travel influencer who can showcase our premium luggage line in scenic beach and nature destinations. Content should emphasize ease of travel and durability of the product.",
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400,
            //           ),
            //           SizedBox(height: 12),
            //           InfoChipsExpandable(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            "Post Request",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFE4545),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class InfoChipsExpandable extends StatefulWidget {
  const InfoChipsExpandable({super.key});

  @override
  State<InfoChipsExpandable> createState() => _InfoChipsExpandableState();
}

class _InfoChipsExpandableState extends State<InfoChipsExpandable> {
  bool isExpanded = false;

  final List<String> locations = [
    'Bangalore',
    'Tamilnadu',
    'Kerala',
    'Pune',
    'Tamilnadu',
    'Kerala',
    'Pune',
    'Tamilnadu',
    'Kerala',
    'Pune',
    'Tamilnadu',
    'Kerala',
    'Pune',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> displayedLocations =
        isExpanded ? locations : locations.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildLocationChip(displayedLocations),
            _buildInfoChip(icon: Icons.people_outline, text: '10k - 100k'),
            _buildInfoChip(
              icon: Icons.category_outlined,
              text: 'Lifestyle, Fashion',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationChip(List<String> displayedLocations) {
    String locationText = displayedLocations.join(', ');

    int remainingCount = locations.length - displayedLocations.length;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6FB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 18,
              color: Colors.grey,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: TextWidget(
                text: locationText,
                maxLines: 8,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xFFAAAAAA),
              ),
            ),
            if (remainingCount > 0 && !isExpanded) ...[
              const SizedBox(width: 4),
              Text(
                '+$remainingCount more',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFAAAAAA),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6FB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.grey[700]),
          const SizedBox(width: 6),
          Flexible(
            child: TextWidget(
              text: text,
              maxLines: 8,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color(0xFFAAAAAA),
            ),
          ),
        ],
      ),
    );
  }
}
