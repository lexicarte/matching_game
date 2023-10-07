import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';
import 'globals.dart';

class MemoryCard extends ConsumerStatefulWidget {
  const MemoryCard({
    Key? key,
    required this.index,
    required this.text,
    required this.matchKey,
  }) : super(key: key);

  final int index;
  final String text;
  final String matchKey;

  @override
  _MemoryCardState createState() => _MemoryCardState();
}

class _MemoryCardState extends ConsumerState<MemoryCard> {
  @override
  Widget build(BuildContext context) {
    final selectionState = ref.watch(selectionsStateProvider);
    final completeState = ref.watch(cardCompleteStateProviders[widget.index]);
    final flippedState = ref.watch(cardTappedStateProviders[widget.index]);
    final frozenState = ref.watch(frozenStateProvider);

    void onCardTap() {
      // Flip the card
      ref.read(cardTappedStateProviders[widget.index].notifier).state =
          !flippedState;

      selectedIndex.add(widget.index);

      // Identify if it is the first or second card flipped
      // Set the matchKey accordingly
      if (selectionState == 0) {
        ref.read(selectionsStateProvider.notifier).state = 1;
        selectionA = widget.matchKey;
        // print(selectionState);
      } else if (selectionState == 1) {
        ref.read(selectionsStateProvider.notifier).state = 2;
        ref.read(frozenStateProvider.notifier).state = true;
        selectionB = widget.matchKey;
        // print(selectionState);
      } else {
        ref.read(selectionsStateProvider.notifier).state = 0;
        // print(selectionState);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: frozenState
            ? () {}
            : flippedState
                ? () {}
                : completeState
                    ? () {}
                    : () => onCardTap(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: kCardBorderColor,
              width: 5.0,
            ),
          ),
          elevation: 5.0,
          shadowColor: kCardBorderColor,
          color: completeState ? kCardBorderColor : kCardBgColor,
          child: SizedBox(
            // width: width,
            // height: height,
            child: Center(
              child: flippedState
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        widget.text,
                        minFontSize: 22,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: completeState ? kSmallDarkText : kSmallText,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        (widget.index + 1).toString(),
                        style: kLargeText,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 16,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
