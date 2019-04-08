import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smartapp/blocs/auth/authentication.dart';
import 'package:smartapp/blocs/login/login.dart';
import 'package:smartapp/data/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        await userRepository.signIn(
          email: event.email,
          password: event.password,
        );
        authenticationBloc.dispatch(LoggedIn());
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.message);
      }
    }
  }
}
