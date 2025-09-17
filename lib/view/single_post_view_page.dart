import 'package:flutter/material.dart';
import 'package:market_place_task/base/base_view.dart';
import 'package:market_place_task/viewModel/list_view_model.dart';
import 'package:market_place_task/widget/text_widget.dart';

class SinglePostViewPage extends StatelessWidget {
  final String? id;
  const SinglePostViewPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Marketplace", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset("assets/delete_ico.png", height: 28),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset("assets/filter_ico.png", height: 28),
          ),
        ],
      ),
      body: BaseView(
        model: ListViewModel(),
        onModelReady: (data) async {
          await data.fetchSinglePost(context, id);
        },
        builder:
            (context, model, child) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color(0xFFF5F6FB),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/avathar.png",
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                       Text(
                                        model.singlePostModel?.webMarketplaceRequests?.userDetails?.name ?? "Unknown",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1F1F1F),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Image.asset(
                                        "assets/linkedin_ico.png",
                                        height: 14,
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.verified,
                                        size: 14,
                                        color: Colors.teal,
                                      ),
                                    ],
                                  ),
                                   Text(
                                    "2 days",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                               Text(
                                model.singlePostModel?.webMarketplaceRequests?.userDetails?.designation ?? "Senior Sales Manager",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF7E7E7E),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children:  [
                                  Icon(
                                    Icons.business,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    model.singlePostModel?.webMarketplaceRequests?.userDetails?.company ?? "Meesho",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF7E7E7E),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(text: "Looking For"),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                             Expanded(
                              child: TextWidget(
                                text:
                                 model.singlePostModel?.webMarketplaceRequests?.serviceType ??   "Sales Manager at Meesho privated limited",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F1F1F),
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 32),
                        const TextWidget(text: "Highlights"),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildInfoChip(
                              icon: Icons.people_outline,
                              text: '10k - 100k',
                              color: Color(0xFFF5F6FB),
                            ),
                            SizedBox(width: 12),
                            _buildInfoChip(
                              icon: Icons.category_outlined,
                              text: 'Lifestyle, Fashion',
                              color: Color(0xFFF5F6FB),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        _buildDetailText("Budget", model.singlePostModel?.webMarketplaceRequests?.requestDetails?.budget ?? "₹1,45,000"),
                        _buildDetailText("Brand", model.singlePostModel?.webMarketplaceRequests?.requestDetails?.brand ?? "Unknown"),
                        _buildDetailText("Location", "Goa & Kerala"),
                        _buildDetailText(
                          "Type",
                          "Lifestyle & Adventure travel content with a focus on young, urban audiences",
                        ),
                        _buildDetailText("Language", "English and Hindi"),
                        _buildDetailText(
                          "Description",
                       model.singlePostModel?.webMarketplaceRequests?.description ?? "Looking for a travel influencer who can showcase our premium luggage line in scenic beach and nature destinations. Content should emphasize ease of travel and durability of the product.",
                        ),

                        const SizedBox(height: 16),
                        _buildShareButtons(),

                        const SizedBox(height: 24),
                        const Text(
                          "Key Highlighted Details",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(1),
                          },
                          children: const [
                            TableRow(
                              children: [
                                DetailTile(
                                  title: "Category",
                                  value: "Lifestyle, Fashion",
                                ),
                                DetailTile(
                                  title: "Platform",
                                  value: "Instagram, Youtube",
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                DetailTile(
                                  title: "Language",
                                  value:
                                      "Hindi, Kannada, Malayalam, Tamil & Telugu",
                                ),
                                DetailTile(
                                  title: "Location",
                                  value:
                                      "Bangalore, Tamilnadu, Kerala & Goa/Bengaluru",
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                DetailTile(
                                  title: "Required count",
                                  value: "15 - 20",
                                ),
                                DetailTile(
                                  title: "Our Budget",
                                  value: "₹1,45,000",
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                DetailTile(
                                  title: "Brand collab with",
                                  value: "Swiggy",
                                ),
                                DetailTile(
                                  title: "Required followers",
                                  value: "⬜ 500k - 1M+\n⬜ 500k - 1M+",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
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

Widget _buildDetailText(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: TextWidget(
      text: "$title: $value",
      fontSize: 14,
      fontWeight: FontWeight.w400,
      maxLines: 3,
    ),
  );
}

Widget _buildShareButtons() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset("assets/whats_app_ico.png", height: 20),
          label: const Text(
            "Share via WhatsApp",
            style: TextStyle(fontWeight: FontWeight.bold), // matches bold
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xFF25D366,
            ).withOpacity(0.18), // light green
            foregroundColor: const Color(0xFF25D366), // text/icon color
            elevation: 0, // flat look
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset("assets/linkedin_ico.png", height: 20),
          label: const Text(
            "Share on LinkedIn",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xFF0077B5,
            ).withOpacity(0.18), // light blue
            foregroundColor: const Color(0xFF0077B5),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildBottomBar() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image.asset("assets/timer_ico.png", height: 14, width: 14),
            SizedBox(width: 6),
            Expanded(
              child: TextWidget(
                text: "Sales Manager at Meesho privated limited",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFE4545)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    color: Color(0xFFFE4545),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFE4545),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class DetailTile extends StatelessWidget {
  final String title;
  final String value;
  const DetailTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1F1F1F),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xFFAAAAAA),
            ),
          ),
        ],
      ),
    );
  }
}
