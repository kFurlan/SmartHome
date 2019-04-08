import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super(props);
}

class RegisterInitial extends RegisterState {
  @override
  String toString() => 'RegisterInitial';
}

class RegisterSuccess extends RegisterState {
  @override
  String toString() => 'RegisterSuccess';
}

class RegisterLoading extends RegisterState {
  @override
  String toString() => 'RegisterInitial';
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'RegisterFailure { error: $error }';
}
