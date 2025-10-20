import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userName;
  String? _userEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get userName => _userName;
  String? get userEmail => _userEmail;

  // Login con validaciones básicas
  Future<bool> login(String email, String password) async {
    try {
      // Validar campos vacíos
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Por favor, completa todos los campos.');
      }

      // Validar formato de correo
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(email)) {
        throw Exception('Formato de correo inválido.');
      }

      // Validar longitud de contraseña
      if (password.length < 6) {
        throw Exception('La contraseña debe tener al menos 6 caracteres.');
      }

      // Simular login exitoso
      await Future.delayed(const Duration(seconds: 1));
      _isAuthenticated = true;
      _userEmail = email;
      _userName = email.split('@')[0];
      notifyListeners();
      return true;
    } catch (e) {
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }

  // Registro simulado
  Future<bool> register(String name, String email, String password) async {
    try {
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        throw Exception('Todos los campos son obligatorios.');
      }

      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(email)) {
        throw Exception('Formato de correo inválido.');
      }

      if (password.length < 6) {
        throw Exception('La contraseña debe tener al menos 6 caracteres.');
      }

      await Future.delayed(const Duration(seconds: 1));
      _isAuthenticated = true;
      _userName = name;
      _userEmail = email;
      notifyListeners();
      return true;
    } catch (e) {
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userName = null;
    _userEmail = null;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _isAuthenticated = false;
    notifyListeners();
  }
}
