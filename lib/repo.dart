import 'dart:math';

class LoginRepo {

  Future<bool> fetchLoginStatus(String user, String pass) {
    return Future.delayed(
      const Duration(seconds: 1),
          () {
        final random = Random();

        return random.nextBool();
      },
    );
  }

}