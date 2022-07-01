part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final bool onBoardingDone;
  const AuthInitial(this.onBoardingDone);

  @override
  List<Object?> get props => [onBoardingDone, ...super.props];
}

class AuthLoading extends AuthState {
  final String userId;
  const AuthLoading(this.userId);

  @override
  List<Object?> get props => [userId, ...super.props];
}

class AuthFailed extends AuthState {
  final String errorMsg;
  const AuthFailed(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg, ...super.props];
}

class AuthSuccess extends AuthState {
  final String userId;
  const AuthSuccess(this.userId);

  @override
  List<Object?> get props => [userId, ...super.props];
}
