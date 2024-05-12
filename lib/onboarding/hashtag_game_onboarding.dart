// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HashTagGameOnboarding extends StatefulWidget {
  const HashTagGameOnboarding({super.key});
  @override
  State<HashTagGameOnboarding> createState() => _HashTagGameOnboardingState();
}

class _HashTagGameOnboardingState extends State<HashTagGameOnboarding> {
  bool _isVisible = true;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    //if (width < 1126) return ReadyPage();
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: width * (98 / 1283), top: height * (65 / 834)),
          child: RawKeyboardListener(
            focusNode: focusNode,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.escape) {
                Navigator.of(context).pop();
              }
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white,
              icon: const ImageIcon(AssetImage('assets/images/Exit.png')),
              iconSize: width * 0.03,
            ),
          ),
        ),
        //여기에 온보딩 내용을 추가하기
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * (126 / 834)),
            Container(
              width: width * (450 / 1283),
              height: height * (90 / 834),
              decoration: const BoxDecoration(color: Color(0xffFFB202)),
              child: Center(
                child: Text(
                  '해시태그',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0E193E),
                    fontFamily: 'DungGeunMo',
                    fontSize: width * (57 / 1283),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * (34 / 834)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '권장인원: 4-6명',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFFD1D1D1),
                      fontFamily: 'DungGeunMo',
                      fontSize: width * (30 / 1283),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: width * (55 / 1283)),
                Text(
                  '난이도: ☆☆☆',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFFD1D1D1),
                      fontFamily: 'DungGeunMo',
                      fontSize: width * (30 / 1283),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: height * (50 / 834)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: width * (98 / 1283)),
                    Text(
                      '1) ',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '각 팀에서 대표 한 명씩 앞으로 나와주세요.',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: height * (10 / 834)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: width * (98 / 1283)),
                    Text(
                      '2) ',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '제시어를 보고, 각자의 해시태그(#)를 생각해 주세요.',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: height * (10 / 834)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: width * (98 / 1283)),
                    Text(
                      '3) ',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '순서대로 각자의 해시태그(#)를 이야기해 주세요.',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: height * (10 / 834)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: width * (98 / 1283)),
                    Text(
                      '4) ',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '남은 구성원들이 제시어를 맞추면 승리해요.',
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'DungGeunMo',
                          fontSize: width * (35 / 1283),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: height * (698 / 834)),
          RawKeyboardListener(
            focusNode: focusNode,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.enter ||
                    event.logicalKey == LogicalKeyboardKey.space) {
                  Navigator.pushNamed(context, '/hashtaggame');
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.1,
                  duration: const Duration(seconds: 1), // Animation duration
                  child: Image.asset(
                    "assets/images/splash_left.png",
                    width: 22,
                    height: 38.5,
                  ),
                ),
                SizedBox(width: width * 0.026),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/hashtaggame');
                  },
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFFFEE100), Color(0xFFFF008E)],
                        stops: [0.276, 0.9844],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.1,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        "Game Start",
                        style: TextStyle(
                            fontFamily: 'DungGeunMo',
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.056,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.026),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.1,
                  duration: const Duration(seconds: 1), // Animation duration
                  child: Image.asset(
                    "assets/images/splash_right.png",
                    width: 22,
                    height: 38.5,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
