import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartapp/blocs/register/register.dart';
import 'package:smartapp/data/user_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({
    @required this.userRepository,
  }) : assert(userRepository != null);

  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterState currentState,
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      try {
        await userRepository.createUser(
          email: event.email,
          password: event.password,
        );
        yield RegisterSuccess();
      } catch (error) {
        yield RegisterFailure(error: error.message);
      }
    }
  }
}
