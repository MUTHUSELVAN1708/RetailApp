import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/state_management/riverpod/floating_provider.dart';

class BoolState {
  final bool isExpanded;
  final bool isLoading;
  final int bottomIndex;

  BoolState(
      {this.isExpanded = false, this.isLoading = false, this.bottomIndex = 0});

  BoolState copyWith({bool? isExpanded, bool? isLoading, int? bottomIndex}) {
    return BoolState(
        isExpanded: isExpanded ?? this.isExpanded,
        isLoading: isLoading ?? this.isLoading,
        bottomIndex: bottomIndex ?? this.bottomIndex);
  }
}

final boolProvider = StateNotifierProvider<BoolNotifier, BoolState>((ref) {
  return BoolNotifier();
});
