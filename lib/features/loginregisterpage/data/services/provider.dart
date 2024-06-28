import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get getUser => _user;
  void setUser(final User? newUser) {
    _user = newUser;
    notifyListeners();
  }
}