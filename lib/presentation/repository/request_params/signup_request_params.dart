
class SignupRequestParams {
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? contactNumber;
  String? dob;
  String? loadPointId;
  String? password;

  SignupRequestParams();

  factory SignupRequestParams.fromJson(Map<String, dynamic> json) =>
      SignupRequestParams()
        ..firstName = json['first_name'] as String?
        ..middleName = json['middle_name'] as String?
        ..lastName = json['last_name'] as String?
        ..email = json['email'] as String?
        ..contactNumber = json['contact_number'] as String?
        ..dob = json['dob'] as String?
        ..email = json['loadpoint_id'] as String?
        ..password = json['password'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'first_name': firstName,
        'middle_name': '',
        'last_name': lastName,
        'email': email,
        'contact_number': contactNumber,
        'dob': dob,
        'loadpoint_id': loadPointId,
        'password': password,
      };
}
