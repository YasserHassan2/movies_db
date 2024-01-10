import 'package:flutter/material.dart';

import '../../../utils/resources/assets_manager.dart';
import '../../../utils/resources/color_manager.dart';

class CustomNetworkImageWidget extends StatefulWidget {
  String imageUrl;

  CustomNetworkImageWidget({required this.imageUrl});

  @override
  State<CustomNetworkImageWidget> createState() =>
      _CustomNetworkImageWidgetState();
}

class _CustomNetworkImageWidgetState extends State<CustomNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FadeInImage(
      image: NetworkImage(widget.imageUrl),
      placeholder: AssetImage(ImageAssets.appIcon),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(ImageAssets.appIcon,
            color: ColorManager.splashBGColor, fit: BoxFit.fitWidth);
      },
      fit: BoxFit.fitWidth,
    ));
  }
}
