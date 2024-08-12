import 'package:amplify_flutter/amplify_flutter.dart';

class AuthService {
  Future<void> signUp(String email, String password) async {
    try {
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(userAttributes: {
          CognitoUserAttributeKey.email: email,
        }),
      );

      if (!result.isSignUpComplete) {
        // Do not throw an exception here, just return normally.
        return;
      }
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> verifyCode(String email, String code) async {
    try {
      await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: code,
      );
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> logout() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn;
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await Amplify.Auth.resetPassword(username: email);
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> confirmPassword(
      String email, String code, String newPassword) async {
    try {
      await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: newPassword,
        confirmationCode: code,
      );
    } on AuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
