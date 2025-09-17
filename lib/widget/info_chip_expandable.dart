import 'package:flutter/material.dart';
import 'package:market_place_task/widget/text_widget.dart';

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
            _buildChip(
              icon: Icons.location_on_outlined,
              text: displayedLocations.join(', '),
              isLocation: true,
              remainingCount: locations.length - displayedLocations.length,
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
            _buildChip(icon: Icons.people_outline, text: '10k - 100k'),
            _buildChip(
              icon: Icons.category_outlined,
              text: 'Lifestyle, Fashion',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChip({
    required IconData icon,
    required String text,
    bool isLocation = false,
    int remainingCount = 0,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FB),
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
                color: const Color(0xFFAAAAAA),
              ),
            ),
            if (isLocation && remainingCount > 0 && !isExpanded) ...[
              const SizedBox(width: 4),
              TextWidget(
                text: '+$remainingCount more',

                fontSize: 12,
                color: Color(0xFFAAAAAA),
                fontWeight: FontWeight.w400,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
