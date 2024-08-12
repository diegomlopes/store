import '../models/user.dart';

class AuthService {
  Future<User?> login(String email, String password) async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulando uma chamada de rede
    if (email == 'test@example.com' && password == 'password') {
      return User(id: '1', email: email);
    }
    return null;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
