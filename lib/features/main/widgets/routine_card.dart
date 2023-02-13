import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/sizes.dart';

class RoutineCard extends StatefulWidget {
  final String title;

  const RoutineCard({
    super.key,
    required this.title,
  });

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(
          Sizes.size16,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5.0,
              offset: const Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(Sizes.size14),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "삭제하기",
                    style: TextStyle(
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.pen,
                    size: Sizes.size20,
                    color: Colors.black87,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.personWalking,
                    size: Sizes.size20,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
