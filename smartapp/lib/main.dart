import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartapp/blocs/auth/authentication.dart';
import 'package:smartapp/blocs/login/login.dart';
import 'package:smartapp/blocs/register/register.dart';
import 'package:smartapp/data/user_repository.dart';
import 'package:smartapp/ui/home_page.dart';
import 'package:smartapp/ui/login_page.dart';
import 'package:smartapp/ui/register_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    debugPrint(transition.toString());
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final _userRepository = UserRepository();
  FirebaseAuth.instance.setLanguageCode('pt-BR');
  runApp(
    App(
      userRepository: _userRepository,
    ),
  );
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        title: 'Smart Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(),
          '/register': (BuildContext context) => BlocProvider<RegisterBloc>(
                bloc: RegisterBloc(
                  userRepository: _userRepository,
                ),
                child: RegisterPage(),
              ),
        },
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (context, state) {
            if (state is AuthenticationUninitialized) {
              return SplashScreen();
            }
            if (state is AuthenticationLoading) {
              return LoadingScreen();
            }
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            }
            if (state is AuthenticationUnauthenticated) {
              return BlocProvider<LoginBloc>(
                bloc: LoginBloc(
                  authenticationBloc: _authenticationBloc,
                  userRepository: _userRepository,
                ),
                child: LoginPage(),
              );
            }
          },
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt', 'BR'),
          const Locale('en', 'US'),
        ],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(fontSize: 50.0),
            ),
          ),
        ],
      ),
    );
  }
}
