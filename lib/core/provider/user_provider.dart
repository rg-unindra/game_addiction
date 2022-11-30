import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_addiction/core/models/user.dart';

final userProvider =
    StateNotifierProvider<UserProvider, User>((ref) => UserProvider());

class UserProvider extends StateNotifier<User> {
  UserProvider([User? user]) : super(user ?? User.initial());

  void addName(String name) => state = state.copyWith(name: name);

  void addAge(int age) => state = state.copyWith(age: age);

  void addUser(User user) => state = user;
}
