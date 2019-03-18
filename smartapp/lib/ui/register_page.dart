import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/register/register.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastre-se'),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
          elevation: 0,
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.1,
                  0.5,
                  0.7,
                  0.9
                ],
                colors: [
                  Colors.blue[800],
                  Colors.blue[700],
                  Colors.blue[600],
                  Colors.blue[400],
                ]),
          ),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  RegisterBloc _registerBloc;
  final _registerFormKey = GlobalKey<FormState>();

  String _name;
  String _email;
  String _password;

  @override
  void initState() {
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterEvent, RegisterState>(
        bloc: _registerBloc,
        builder: (context, state) {
          if (state is RegisterFailure) {
            _onWidgetDidBuild(() {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            });
          }
          if (state is RegisterSuccess) {
            _onWidgetDidBuild(() {
              Navigator.popAndPushNamed(context, '/home');
            });
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Form(
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.account_circle,
                        ),
                        hintText: 'Nome',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSaved: (value) {
                        _name = value;
                      },
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Esse campo é obrigatório';
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSaved: (value) {
                        _email = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Esse campo é obrigatório';
                        } else if (!EmailValidator.validate(value)) {
                          return 'O email é invalido';
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        hintText: 'Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSaved: (value) {
                        _password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Esse campo é obrigatório';
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        hintText: 'Confirme sua senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Esse campo é obrigatório';
                        } else if (value == _password) {
                          return 'A senhas não são iguais';
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.all(16.0),
                        elevation: 0,
                        color: Colors.white,
                        splashColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          if (_registerFormKey.currentState.validate()) {
                            _registerFormKey.currentState.save();
                            _registerBloc.dispatch(
                              RegisterButtonPressed(
                                email: _email,
                                password: _password,
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
