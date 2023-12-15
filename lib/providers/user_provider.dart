import 'package:flutter/foundation.dart';
import 'package:skillworker/models/user.dart';
import 'package:skillworker/controllers/authcontroller.dart';

class UserProvider with ChangeNotifier {
  User? _user; // mark user as private feild, setter
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!; // get private user field, gettter

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
