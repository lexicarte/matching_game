import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectionsStateProvider = StateProvider<int>((ref) => 0);
final frozenStateProvider = StateProvider<bool>((ref) => false);

List<int> selectedIndex = [];

String selectionA = 'x';
String selectionB = 'z';

List<StateProvider> cardCompleteStateProviders = [
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
];

List<StateProvider> cardTappedStateProviders = [
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
  StateProvider<bool>((ref) => false),
];
