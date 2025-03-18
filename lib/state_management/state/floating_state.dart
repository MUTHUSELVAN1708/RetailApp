import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/state_management/riverpod/floating_provider.dart';

class BoolState {
  final bool isExpanded;
  final bool isLoading;
  final int bottomIndex;
  final int settingsPageIndex;
  final int configurationPageIndex;

  BoolState(
      {this.isExpanded = false,
      this.isLoading = false,
      this.bottomIndex = 0,
      this.settingsPageIndex = 0,
      this.configurationPageIndex = 0});

  BoolState copyWith({
    bool? isExpanded,
    bool? isLoading,
    int? bottomIndex,
    int? settingsPageIndex,
    int? configurationPageIndex,
  }) {
    return BoolState(
      isExpanded: isExpanded ?? this.isExpanded,
      isLoading: isLoading ?? this.isLoading,
      bottomIndex: bottomIndex ?? this.bottomIndex,
      settingsPageIndex: settingsPageIndex ?? this.settingsPageIndex,
      configurationPageIndex:
          configurationPageIndex ?? this.configurationPageIndex,
    );
  }
}

final boolProvider = StateNotifierProvider<BoolNotifier, BoolState>((ref) {
  return BoolNotifier();
});
