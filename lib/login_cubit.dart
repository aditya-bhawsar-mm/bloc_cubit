import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/repo.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final usernameContorller = TextEditingController(text: "mm@gmail.com");
  final passwordContorller = TextEditingController(text: "mutualmobile");

  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const Idle());

  Future<void> login() async {
    emit(const Loading());
    final result = await _loginRepo.fetchLoginStatus("user", "pass");
    if (result) {
      emit(const Success());
    }
    else {
      emit(const Failed());
    }
  }
}