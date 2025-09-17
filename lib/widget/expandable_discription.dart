import 'package:flutter/material.dart';
import 'package:market_place_task/widget/info_chip_expandable.dart';
import 'package:market_place_task/widget/text_widget.dart';

class ExpandableDescription extends StatefulWidget {
  final String text;
  final int trimLines;
  final double fontSize;
  final FontWeight fontWeight;

  const ExpandableDescription({
    super.key,
    required this.text,
    this.trimLines = 3,
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
          child: TextWidget(
            text: isExpanded ? "See less" : "See more",

            color: Color(0xFFAAAAAA),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
