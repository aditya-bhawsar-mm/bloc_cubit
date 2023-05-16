part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class Idle extends LoginState {
  const Idle();
}

class Success extends LoginState {
  const Success();
}

class Failed extends LoginState {
  const Failed();
}

class Loading extends LoginState {
  const Loading();
}