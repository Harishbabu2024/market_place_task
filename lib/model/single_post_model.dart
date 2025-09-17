import 'dart:convert';

import 'package:market_place_task/model/list_page_model.dart';

SinglePostModel singlePostModelFromJson(String str) =>
    SinglePostModel.fromJson(json.decode(str));

String singlePostModelToJson(SinglePostModel data) =>
    json.encode(data.toJson());

class SinglePostModel {
  bool? ok;
  MarketplaceRequest? webMarketplaceRequests;

  SinglePostModel({this.ok, this.webMarketplaceRequests});

  factory SinglePostModel.fromJson(Map<String, dynamic> json) =>
      SinglePostModel(
        ok: json["ok"],
        webMarketplaceRequests:
            json["web_marketplace_requests"] == null
                ? null
                : MarketplaceRequest.fromJson(json["web_marketplace_requests"]),
      );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "web_marketplace_requests": webMarketplaceRequests?.toJson(),
  };
}
