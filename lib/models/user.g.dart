// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  hair: Hair.fromJson(json['hair'] as Map<String, dynamic>),
  company: Company.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'hair': instance.hair,
      'company': instance.company,
    };

_$HairImpl _$$HairImplFromJson(Map<String, dynamic> json) =>
    _$HairImpl(color: json['color'] as String, type: json['type'] as String);

Map<String, dynamic> _$$HairImplToJson(_$HairImpl instance) =>
    <String, dynamic>{'color': instance.color, 'type': instance.type};

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      department: json['department'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'department': instance.department,
      'address': instance.address,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      address: json['address'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{'address': instance.address, 'city': instance.city};
