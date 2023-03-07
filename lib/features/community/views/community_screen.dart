import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minigym/common/widgets/routine_card.dart';

import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/community/views/share_my_routine_screen.dart';

class CommunityScreen extends StatefulWidget {
  static const routeName = "community_screen";
  static const routeURL = "/community";
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final db = FirebaseFirestore.instance;

  final List<String> title = [
    '무분할 루틴',
  ];

  void _onShareTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShareMyRoutineScreen()));
  }

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("커뮤니티"),
          centerTitle: false,
          actions: <Widget>[
            TextButton(
              onPressed: _onPressed,
              child: TextButton(
                onPressed: _onShareTap,
                child: Text(
                  "공유하기",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Gaps.h20,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          child: ListView.separated(
            itemCount: title.length,
            itemBuilder: (context, index) => RoutineCard(
              mode: "community",
              title: title[index],
            ),
            separatorBuilder: (context, index) => Gaps.v12,
          ),
        ),
      ),
    );
  }
}
