import 'package:flutter/material.dart';
import '../game_contents.dart';

class GameCardBrandApp extends StatelessWidget {
  final GameContents gameContents;

  const GameCardBrandApp({
    super.key,
    required this.gameContents,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -5), // 위로 이동할 양을 조정하십시오.
        child: Text(
          gameContents.name,
          style: const TextStyle(
            fontFamily: 'DungGeunMo',
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
