import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial(false));

  void signup(String userId, String pwd) async {
    emit(AuthLoading(userId));
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(AuthSuccess(userId));
  }

  void login(String userId, String pwd) async {
    emit(AuthLoading(userId));
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(AuthSuccess(userId));
  }
}
