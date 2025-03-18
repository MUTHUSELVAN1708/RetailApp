import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class BoolNotifier extends StateNotifier<BoolState> {
  BoolNotifier() : super(BoolState());

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void changeIndex(int index) {
    state = state.copyWith(bottomIndex: index);
  }

  void pageIndex(int index) {
    state = state.copyWith(settingsPageIndex: index);
  }

  void configurationPageIndex(int index) {
    state = state.copyWith(configurationPageIndex: index);
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
