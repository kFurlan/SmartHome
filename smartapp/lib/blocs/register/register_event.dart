import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super(props);
}

class RegisterButtonPressed extends RegisterEvent {
  final String email;
  final String password;

  RegisterButtonPressed({
    @required this.email,
    @required this.password,
  }) : super([email, password]);

  @override
  String toString() =>
      'RegisterButtonPressed { email: $email, password: $password }';
}