import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  const NetworkImageWidget({super.key, this.url,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorWidget: (context, url, error) => Image.asset("assets/avathar.png"),
    );
  }
}
