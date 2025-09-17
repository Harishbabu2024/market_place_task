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
              child: ListView.builder(
                itemCount:
                    model.listPageModel?.marketplaceRequests?.length ?? 0,
                itemBuilder: (contexr, index) {
                  final profile =
                      model.listPageModel?.marketplaceRequests?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ProfileCardWidget(
                      marketplaceRequest: profile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SinglePostViewPage(id: profile?.idHash),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
    );
  }
}
