import 'package:equatable/equatable.dart';

class LoginParamRequest extends Equatable {
  final String username;
  final String password;

  LoginParamRequest(this.username, this.password);

  @override
  List<Object> get props => [username, password];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}