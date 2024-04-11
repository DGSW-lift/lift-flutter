class SignUpRequest {
  SignupRequest? signupRequest;
  String? profile;

  SignUpRequest({this.signupRequest, this.profile});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    signupRequest = json['signupRequest'] != null
        ? SignupRequest.fromJson(json['signupRequest'])
        : null;
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (signupRequest != null) {
      data['signupRequest'] = signupRequest!.toJson();
    }
    data['profile'] = profile;
    return data;
  }
}

class SignupRequest {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  List<String>? field;

  SignupRequest(
      {this.email, this.password, this.firstName, this.lastName, this.field});

  SignupRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    field = json['field'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['field'] = field;
    return data;
  }
}
