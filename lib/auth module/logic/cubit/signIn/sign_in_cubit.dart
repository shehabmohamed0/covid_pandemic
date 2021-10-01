import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_pandemic/auth%20module/data/models/email.dart';
import 'package:covid_pandemic/auth%20module/data/models/password.dart';
import 'package:covid_pandemic/auth%20module/data/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:provider/src/provider.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository _authenticationRepository;

  SignInCubit(this._authenticationRepository)
      : super(SignInState(
            email: const Email.pure(''),
            password: const Password.pure(''),
            hidePassword: true,
            status: FormzStatus.invalid));

  void emailChanged(String newEmail) {
    final email = Email.dirty(newEmail);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String newPassword) {
    final password = Password.dirty(newPassword);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  void togglePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> signOut() async {
    emit(
      SignInState(
          email: const Email.pure(''),
          password: const Password.pure(''),
          hidePassword: true,
          status: FormzStatus.invalid),
    );
    await _authenticationRepository.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authenticationRepository.sendPasswordResetEmail(email);
  }
}
