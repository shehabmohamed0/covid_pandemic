part of 'auth_cubit.dart';

@immutable
class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class SignInSuccess extends AuthState {}

class Error extends AuthState {
  late String error;
  Error({required this.error});
}

class OTPSentSuccessfully extends AuthState {}

class SignOut extends AuthState {}
