// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  factory User.initial() => const User(name: "", age: 0);

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  List<Object?> get props => [name, age];
}
