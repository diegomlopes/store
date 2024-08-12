import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({AuthService? authService})
      : _authService = authService ?? AuthService() {
    checkAuthentication();
  }

  final AuthService _authService;

  String? _errorMessage;
  bool _isLoading = false;
  bool _isAuthenticated = false;

  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.signUp(email, password);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyCode(String email, String code) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.verifyCode(email, code);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.login(email, password);
      _isAuthenticated = await _authService.isAuthenticated();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.logout();
      _isAuthenticated = await _authService.isAuthenticated();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkAuthentication() async {
    _isLoading = true;
    notifyListeners();

    try {
      _isAuthenticated = await _authService.isAuthenticated();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.resetPassword(email);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> confirmPassword(
      String email, String code, String newPassword) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.confirmPassword(email, code, newPassword);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
