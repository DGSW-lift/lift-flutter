
import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {

  @JsonKey(name: "email", required: true)
  String email;

  @JsonKey(name: "password", required: true)
  String password;

  @JsonKey(name: "firstName", required: true)
  String firstName;

  @JsonKey(name: "lastName", required: true)
  String lastName;

  @JsonKey(name: "field", defaultValue: [])
  List<String> field;

  SignupRequest({required this.email, required this.password, required this.firstName, required this.lastName, required this.field});

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}