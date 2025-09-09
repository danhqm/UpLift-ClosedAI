import 'package:flutter/foundation.dart';
import 'package:uplift/model/usermodel.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Check if user is logged in
  bool get isLoggedIn => _currentUser != null;

  // Set the current user
  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  // Clear user (logout)
  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }

}