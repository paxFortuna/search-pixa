// import 'dart:convert';
// import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';
// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable() 
class User with _$User {
  final String id;
  final String name;
  final String email;
  User({
    required this.id,
    required this.name,
    required this.email,
  });

// dart dart class + equatiable 연동
// class User extends Equatable {
//   final String id;
//   final String name;
//   final String email;
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//   });

  // User copyWith({
  //   String? id,
  //   String? name,
  //   String? email,
  // }) {
  //   return User(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};
  
  //   result.addAll({'id': id});
  //   result.addAll({'name': name});
  //   result.addAll({'email': email});
  
  //   return result;
  // }

  // factory User.fromMap(Map<String, dynamic> map) {
  //   return User(
  //     id: map['id'] ?? '',
  //     name: map['name'] ?? '',
  //     email: map['email'] ?? '',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) => User.fromMap(json.decode(source));

  // @override
  // String toString() => 'User(id: $id, name: $name, email: $email)';

  // equtable사용하기에 아래 두 코드는 필요없음.
  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  
  //   return other is User &&
  //     other.id == id &&
  //     other.name == name &&
  //     other.email == email;
  // }

  // @override
  // int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
  

  // @override
  // List<Object> get props => [id, name, email];
}
