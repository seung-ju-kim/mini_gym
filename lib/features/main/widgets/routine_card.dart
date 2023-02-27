import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/breakpoints.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/utils.dart';

class RoutineCard extends StatefulWidget {
  final String title;

  const RoutineCard({
    super.key,
    required this.title,
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
    return GestureDetector(
      onTap: _onTap,
      child: Align(
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
            color: isDarkMode(context) ? Colors.black : Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.trash,
                      size: Sizes.size20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.pen,
                      size: Sizes.size20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.personWalking,
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
