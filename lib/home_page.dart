import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:confetti/confetti.dart';

import 'constants.dart';
import 'globals.dart';
import 'lists.dart';
import 'memory_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late ConfettiController _controllerCenter;
  List<Widget> cardList = [];

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 3));
    matchCards.shuffle();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectionState = ref.watch(selectionsStateProvider);

    return Scaffold(
      backgroundColor: kMainBgColor,
      body: Column(
        children: [
          Stack(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                itemCount: matchCards.length,
                itemBuilder: (BuildContext context, index) {
                  return MemoryCard(
                    index: index,
                    text: matchCards[index].text,
                    matchKey: matchCards[index].key,
                  );
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  numberOfParticles: 25,
                  emissionFrequency: 0.01,
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  shouldLoop:
                      false, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  // createParticlePath: drawStar, // define a custom shape/path.
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          selectionState == 2
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => checkAnswer(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kCardBorderColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 12.0,
                          ),
                          child: Text(
                            'IS IT A MATCH?',
                            style: kMedDarkText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                )
              : const SizedBox(height: 30),
        ],
      ),
    );
  }

  checkAnswer() {
    if (selectionA == selectionB) {
      print('true');
      ref.read(cardCompleteStateProviders[selectedIndex[0]].notifier).state =
          true;
      ref.read(cardCompleteStateProviders[selectedIndex[1]].notifier).state =
          true;
      selectedIndex.clear();
      _controllerCenter.play();
    } else {
      ref.read(cardTappedStateProviders[selectedIndex[0]].notifier).state =
          false;
      ref.read(cardTappedStateProviders[selectedIndex[1]].notifier).state =
          false;
      selectedIndex.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'N O P E',
              style: kLargeRedText,
            ),
          ],
        ),
        duration: const Duration(milliseconds: 1200),
        backgroundColor: kMainBgColor,
      ));
      print('false');
    }
    ref.read(selectionsStateProvider.notifier).state = 0;
    ref.read(frozenStateProvider.notifier).state = false;
    selectionA = 'x';
    selectionB = 'z';
  }
}
