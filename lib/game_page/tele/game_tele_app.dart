import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';
import '../../game_contents.dart';
import '../../card/card_app.dart';
import '../../gameover/gameover_app.dart';

class TeleAppGame extends StatefulWidget {
  const TeleAppGame({super.key});

  @override
  State<TeleAppGame> createState() => _TeleAppGamePageState();
}

class _TeleAppGamePageState extends State<TeleAppGame> {
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<GameCardApp> cards = []; // cards 변수를 초기화
  String setNumber = '';
  final random = Random();
  @override
  void initState() {
    super.initState();

    final teleIndices = List<int>.generate(tele.length, (i) => i);
    final randomTele =
        teleIndices.sublist(0, 10).map((index) => tele[index]).toList();

    cards = randomTele
        .map((gameContents) => GameCardApp(gameContents: gameContents))
        .toList();
  }

  bool isUndoButtonVisible = true;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 25, 62, 1),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 29, top: 62, right: 29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white,
                    icon: const ImageIcon(AssetImage('assets/images/Exit.png')),
                    iconSize: 27,
                  ),
                ],
              ),
              Text(
                setNumber,
                style: const TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${currentCardIndex + 1}/${cards.length}',
                style: const TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Color.fromRGBO(255, 98, 211, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isUndoButtonVisible
                        ? ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                                width: 29, height: 52),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.undo;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.only(left: 0),
                              ),
                              child: const ImageIcon(
                                AssetImage(
                                    'assets/images/icon_chevron_left.png'),
                                size: 90,
                              ),
                            ),
                          )
                        : ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                                width: 29, height: 52),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.undo();
                                if (currentCardIndex == 0) {
                                  setState(() {
                                    isUndoButtonVisible = true;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                padding: const EdgeInsets.only(left: 0),
                              ),
                              child: const ImageIcon(
                                AssetImage(
                                    'assets/images/icon_chevron_left_white.png'),
                                size: 90,
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 277,
                      height: 200,
                      child: CardSwiper(
                        duration: const Duration(milliseconds: 0),
                        controller: controller,
                        cardsCount: cards.length,
                        numberOfCardsDisplayed: 1,
                        cardBuilder: (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) {
                          currentCardIndex = index;

                          return cards[index];
                        },
                        isDisabled: true,
                        onSwipe: _onSwipe,
                        onUndo: _onUndo,
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints.tightFor(width: 29, height: 52),
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentCardIndex == 9) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const GameOverApp(
                                  gameName: 'tele',
                                ),
                              ),
                            );
                          } else {
                            controller.swipeLeft();
                            if (currentCardIndex != 2) {
                              setState(() {
                                isUndoButtonVisible = false;
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                        ),
                        child: const ImageIcon(
                          AssetImage('assets/images/icon_chevron_right.png'),
                          size: 90,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 87)
            ],
          ),
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      currentCardIndex = currentIndex ?? 0; // currentIndex가 null인 경우 기본값 0으로 설정
    });

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      currentCardIndex = currentIndex; // currentIndex가 null인 경우 기본값 0으로 설정
    });
    return true;
  }
}
