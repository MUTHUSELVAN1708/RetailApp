import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/state_management/riverpod/auth_provider.dart';

class AuthState {
  final bool isLoading;

  AuthState({
    this.isLoading = false,
  });

  AuthState copyWith({
    bool? isLoading,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final notificationProvider =
    StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});
