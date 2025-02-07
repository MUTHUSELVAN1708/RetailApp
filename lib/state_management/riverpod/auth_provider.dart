import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/data/repositories/auth_repository.dart';
import 'package:retail_mobile/state_management/state/auth_state.dart';

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState());

  final AuthRepository _authRepository = AuthRepository();

  Future<void> login(String email, String password) async {
    final result = _authRepository.login(email, password);
  }

  Future<void> register(String email, String password) async {
    final result = _authRepository.register(email, password);
  }
}
