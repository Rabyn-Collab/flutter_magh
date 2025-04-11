import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required Hair hair,
    required Company company
}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


@freezed
class Hair with _$Hair {
  const factory Hair({
    required String color,
    required String type,
}) = _Hair;

  factory Hair.fromJson(Map<String, dynamic> json) => _$HairFromJson(json);
}


@freezed
class Company with _$Company {
  const factory Company({
    required String department,
    required Address address
}) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}


@freezed
class Address with _$Address {
  const factory Address({
    required String address,
    required String city,
}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}