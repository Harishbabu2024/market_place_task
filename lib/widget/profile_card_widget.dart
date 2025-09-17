import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/model/list_page_model.dart';
import 'package:market_place_task/widget/expandable_discription.dart';
import 'package:market_place_task/widget/network_imafe_widget.dart';
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
    return Container(
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
            top: -25,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      marketplaceRequest?.isDealClosed == true
                          ? [Color(0xFFE34E2F), Color(0xFFE23851)]
                          : [Color(0xFFFE9C13), Color(0xFFFB9428)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    marketplaceRequest?.isDealClosed == true
                        ? "assets/expire_ico.png"
                        : "assets/high_val_ico.png",
                    height: 12,
                    width: 12,
                  ),
                  SizedBox(width: 2),
                  TextWidget(
                    text:
                        marketplaceRequest?.isDealClosed == true
                            ? "Expire Soon"
                            : "High Value",
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Column(
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
                        child: NetworkImageWidget(
                          url: marketplaceRequest?.userDetails?.profileImage,
                        ),
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
                              TextWidget(
                                text: "2m",

                                fontSize: 14,
                                color: Colors.grey,
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
                    Image.asset("assets/influ_ico.png", height: 15, width: 15),
                    const SizedBox(width: 4),
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
                Divider(color: Color(0xFFE9E9E9)),
                SizedBox(height: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailText(
                      "Budget",
                      "\₹${marketplaceRequest?.requestDetails?.budget ?? 0}",
                    ),
                    _buildDetailText(
                      "Brand",
                      " ${marketplaceRequest?.requestDetails?.brand ?? ""}",
                    ),
                    _buildDetailText("Location", "Goa & Kerala"),
                    _buildDetailText(
                      "Type",
                      "${marketplaceRequest?.serviceType ?? "Lifestyle & Adventure travel content with a focus on young, urban audiences"}",
                    ),
                    _buildDetailText("Language", "English and Hindi"),
                    ExpandableDescription(
                      text:
                          marketplaceRequest?.description ??
                          "Looking for a travel influencer who can showcase our premium luggage line in scenic beach and nature destinations. Content should emphasize ease of travel and durability of the product.",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: TextWidget(
        text: "$title: $value",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
