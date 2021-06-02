import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Account {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const Account(
      {required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.password,
      required this.passwordConfirmation});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation']);
}

Map<String, dynamic> _$AccountToJson(Account account) => <String, dynamic>{
      'name': account.name,
      'email': account.email,
      'address': account.address,
      'phone': account.phone,
      'password': account.password,
      'password_confirmation': account.passwordConfirmation,
      'avatar': ''
    };
