// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:market_place_task/model/list_page_model.dart';
// import 'package:market_place_task/widget/dummy.dart';
// import 'package:market_place_task/widget/text_widget.dart';

// class ProfileCardWidget extends StatelessWidget {
//   final double? height;
//   final double width;
//   final Color color;
//   final VoidCallback? onTap;
//   final String? name;
//   final MarketplaceRequest? marketplaceRequest;
//   const ProfileCardWidget({
//     super.key,
//     this.height,
//     this.onTap,
//     this.color = Colors.white,
//     this.width = double.infinity,
//     this.name,
//     this.marketplaceRequest,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(15),
//         constraints: BoxConstraints(minHeight: height ?? 0),
//         width: width,
//         decoration: BoxDecoration(
//           border: Border.all(color: Color(0xFFE9E9E9), width: 1.5),
//           borderRadius: BorderRadius.circular(12),
//           color: color,
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xFFF3F5FF),
//               spreadRadius: 6,
//               blurRadius: 8,
//               offset: Offset(0, 1), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Container(
//                     height: 56,
//                     width: 56,
//                     decoration: const BoxDecoration(shape: BoxShape.circle),
//                     clipBehavior: Clip.antiAlias,
//                     child: Image.asset("assets/avathar.png"),
//                   ),
//                 ),
//                 Flexible(
//                   flex: 8,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(
//                         text:
//                             marketplaceRequest?.userDetails?.name ??
//                             "Angel Rosser",
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF1F1F1F),
//                       ),
//                       TextWidget(
//                         text:
//                             marketplaceRequest?.userDetails?.designation ??
//                             "Sales Manager at Meesho privated limited",
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         maxLines: 1,
//                         color: Color(0xFF7E7E7E),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.access_time,
//                             size: 16,
//                             color: Colors.grey,
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             "2m",
//                             style: TextStyle(fontSize: 14, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Flexible(
//                   flex: 2,
//                   child: SvgPicture.asset(
//                     "assets/right_arrow_ico.svg",
//                     height: 28,
//                     width: 28,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.access_time, // Clock icon
//                   size: 16, // Adjust size as needed
//                   color: Colors.grey, // Typical color for time icons
//                 ),
//                 const SizedBox(width: 4), // Small space between icon and text
//                 TextWidget(
//                   text:
//                       marketplaceRequest?.serviceType ??
//                       "Sales Manager at Meesho privated limited",
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   maxLines: 1,
//                   color: Color(0xFF1F1F1F),
//                 ),
//               ],
//             ),

//             SizedBox(height: 8),
//             Divider(),
//             SizedBox(height: 2),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextWidget(
//                   text:
//                       "Budget: \₹${marketplaceRequest?.requestDetails?.budget ?? 0}",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 TextWidget(
//                   text:
//                       "Brand: ${marketplaceRequest?.requestDetails?.brand ?? ""}",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 TextWidget(
//                   text: "Location: Goa & Kerala",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 TextWidget(
//                   text:
//                       "Type: ${marketplaceRequest?.serviceType ?? "Lifestyle & Adventure travel content with a focus on young, urban audiences"}",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 TextWidget(
//                   text: "Language: English and Hindi",
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 ExpandableDescription(
//                   text:
//                       marketplaceRequest?.description ??
//                       "Looking for a travel influencer who can showcase our premium luggage line in scenic beach and nature destinations. Content should emphasize ease of travel and durability of the product.",
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Positioned(
//               top: -20,
//               right: 0,
//               child: Container(height: 40, width: 40, color: Colors.red),
//             ),
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/model/list_page_model.dart';
import 'package:market_place_task/widget/dummy.dart';
import 'package:market_place_task/widget/text_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  final double? height;
  final double width;
  final Color color;
  final VoidCallback? onTap;
  final String? name;
  final MarketplaceRequest? marketplaceRequest;
  const ProfileCardWidget({
    super.key,
    this.height,
    this.onTap,
    this.color = Colors.white,
    this.width = double.infinity,
    this.name,
    this.marketplaceRequest,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        constraints: BoxConstraints(minHeight: height ?? 0),
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE9E9E9), width: 1.5),
          borderRadius: BorderRadius.circular(12),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF3F5FF),
              spreadRadius: 6,
              blurRadius: 8,
              offset: Offset(0, 1), 
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -30,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextWidget(text: "Expire Soon"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset("assets/avathar.png"),
                      ),
                    ),
                    Flexible(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text:
                                marketplaceRequest?.userDetails?.name ??
                                "Angel Rosser",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F1F1F),
                          ),
                          TextWidget(
                            text:
                                marketplaceRequest?.userDetails?.designation ??
                                "Sales Manager at Meesho privated limited",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            maxLines: 1,
                            color: Color(0xFF7E7E7E),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "2m",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: SvgPicture.asset(
                        "assets/right_arrow_ico.svg",
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time, // Clock icon
                      size: 16, // Adjust size as needed
                      color: Colors.grey, // Typical color for time icons
                    ),
                    const SizedBox(
                      width: 4,
                    ), // Small space between icon and text
                    TextWidget(
                      text:
                          marketplaceRequest?.serviceType ??
                          "Sales Manager at Meesho privated limited",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                      color: Color(0xFF1F1F1F),
                    ),
                  ],
                ),

                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text:
                          "Budget: \₹${marketplaceRequest?.requestDetails?.budget ?? 0}",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    TextWidget(
                      text:
                          "Brand: ${marketplaceRequest?.requestDetails?.brand ?? ""}",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    TextWidget(
                      text: "Location: Goa & Kerala",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    TextWidget(
                      text:
                          "Type: ${marketplaceRequest?.serviceType ?? "Lifestyle & Adventure travel content with a focus on young, urban audiences"}",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    TextWidget(
                      text: "Language: English and Hindi",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    ExpandableDescription(
                      text:
                          marketplaceRequest?.description ??
                          "Looking for a travel influencer who can showcase our premium luggage line in scenic beach and nature destinations. Content should emphasize ease of travel and durability of the product.",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableDescription extends StatefulWidget {
  final String text;
  final int trimLines;
  final double fontSize;
  final FontWeight fontWeight;

  const ExpandableDescription({
    super.key,
    required this.text,
    this.trimLines = 4,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
  });

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Description text
        TextWidget(
          text: widget.text,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          maxLines: isExpanded ? null : widget.trimLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        if (isExpanded) ...[const SizedBox(height: 12), InfoChipsExpandable()],
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(
            isExpanded ? "See less" : "See more",
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
