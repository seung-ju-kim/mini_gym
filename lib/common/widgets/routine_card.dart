import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/common/widgets/add_body_part_button.dart';
import 'package:minigym/constants/breakpoints.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/utils.dart';

class RoutineCard extends StatefulWidget {
  final String title;
  final String mode;

  const RoutineCard({
    super.key,
    required this.title,
    required this.mode,
  });

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  static const bodyPart = [
    "가슴",
    "등",
    "하체",
    "어깨",
    "팔",
    "복근",
    "전신",
    "유산소",
  ];

  late final Animation<double> _sizeFactor =
      Tween(begin: 0.0, end: 1.0).animate(_animationController);

  void _onTap() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: Breakpoints.sm,
        ),
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(
          Sizes.size16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDarkMode(context) ? Colors.white : Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(Sizes.size14),
          color: isDarkMode(context) ? Colors.grey.shade800 : Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/85879970?s=400&u=550e98bbea81923cf6e172a49c129b8a6982df24&v=4"),
                      radius: Sizes.size16,
                    ),
                    Gaps.h10,
                    Text(
                      "김승주",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                if (widget.mode == "share_routine")
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.squareCheck,
                      size: Sizes.size20,
                    ),
                  ),
              ],
            ),
            Gaps.v12,
            Row(
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Gaps.v12,
            Wrap(
              runSpacing: 3,
              spacing: 1,
              children: [
                for (var part in bodyPart) AddBodyPartButton(part: part)
              ],
            ),
            Gaps.v12,
            Divider(
              thickness: 0.6,
              color: isDarkMode(context)
                  ? Colors.white.withOpacity(0.8)
                  : Colors.grey.shade600.withOpacity(0.3),
            ),
            Row(
              mainAxisAlignment: widget.mode == "share_routine"
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceBetween,
              children: [
                if (widget.mode == "community")
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.bookmark,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                if (widget.mode == "my_routine")
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.hourglass,
                          size: Sizes.size20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.shareFromSquare,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                IconButton(
                  onPressed: _onTap,
                  icon: const FaIcon(
                    FontAwesomeIcons.angleDown,
                    size: Sizes.size20,
                  ),
                ),
              ],
            ),
            SizeTransition(
              sizeFactor: _sizeFactor,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    DetailWidget(text: "벤치프레스 5세트"),
                    DetailWidget(text: "풀업 3세트"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size4,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
