import 'package:flutter/material.dart';
import '../game_contents.dart';

class ChurchGameCard extends StatelessWidget {
  final GameContents gameContents;
  final bool answer;
  final double fontSize;

  const ChurchGameCard({
    super.key,
    required this.gameContents,
    this.answer = false,
    this.fontSize = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -10), // 위로 이동할 양을 조정하십시오.
        child: Text(
          answer ? gameContents.name : gameContents.answer,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'DungGeunMo',
            color: !answer ? Colors.white :  Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
            height: 1.286,
          ),
        ),
      ),
    );
  }
}
