import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/breakpoints.dart';
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
                      color: Colors.black,
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
        style: const TextStyle(
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}
