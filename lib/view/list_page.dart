import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_place_task/base/base_view.dart';
import 'package:market_place_task/utils/app_utils.dart';
import 'package:market_place_task/view/single_post_view_page.dart';
import 'package:market_place_task/viewModel/list_view_model.dart';
import 'package:market_place_task/widget/profile_card_widget.dart';
import 'package:market_place_task/widget/text_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      model: ListViewModel(),
      onModelReady: (data) async {
        await data.fetchPostList(context);
      },
      builder:
          (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const TextWidget(
                text: "Marketplace",
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
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
                  const SearchTab(),
                  model.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (!model.isLoading &&
                                scrollInfo.metrics.pixels >=
                                    scrollInfo.metrics.maxScrollExtent - 100) {
                              model.fetchPostList(context, loadMore: true);
                            }
                            return false;
                          },
                          child: ListView.builder(
                            itemCount:
                                (model
                                        .listPageModel
                                        ?.marketplaceRequests
                                        ?.length ??
                                    0) +
                                (model.isLoading ? 1 : 0),
                            itemBuilder: (context, index) {
                              final requests =
                                  model.listPageModel?.marketplaceRequests ??
                                  [];

                              if (index < requests.length) {
                                final profile = requests[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18.0,
                                  ),
                                  child: ProfileCardWidget(
                                    marketplaceRequest: profile,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => SinglePostViewPage(
                                                id: profile.idHash,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  AppUtils.showSnackBar(context, "Data is not Available");
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const TextWidget(
                  text: "Post Request",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFE4545),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ),
    );
  }
}

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String selectedTab = "Recent";

  final List<String> tabs = ["For You", "Recent", "My Requests", "⭐ Top Ideas"];

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
                  "assets/person_img.png",
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              const TextWidget(
                text: "Type your requirement here . . .",
                color: Colors.grey,
                fontSize: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                tabs.map((tab) {
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

  Widget _buildTabButton(
    String text, {
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.red : Color(0xFFE9E9E9),
            width: 1.2,
          ),
        ),
        child: TextWidget(
          text: text,
          fontSize: 14,
          color: isSelected ? Colors.red : Colors.black87,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
    );
  }
}
