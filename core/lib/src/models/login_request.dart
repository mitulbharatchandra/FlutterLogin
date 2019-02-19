import 'package:json_annotation/json_annotation.dart';

part "login_request.g.dart";

@JsonSerializable()
class LoginRequest {
  LoginRequest(this.mobileNumber, this.password);

  @JsonKey(name: 'mobileNumber')
  String mobileNumber;

  @JsonKey(name: 'password')
  String password;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson` constructor.
  /// The constructor is named after the source class, in this case User.
  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}