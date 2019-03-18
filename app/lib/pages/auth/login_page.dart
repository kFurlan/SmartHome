import 'package:flutter/material.dart';
import 'register_page.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _loginFormKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[400],
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SmartHomeLogo(),
              ),
              Form(
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: "Usuário",
                          prefixIcon: Icon(Icons.account_circle, size: 35),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'O nome do usuário é obrigatório';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, size: 35),
                          hintText: "Senha",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'A senha é obrigatória';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: SizedBox(
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
                            if (_loginFormKey.currentState.validate()) {}
                          },
                          child: const Text(
                            'Acesso',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.transparent,
                      splashColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmartHomeLogo extends StatelessWidget {
  const SmartHomeLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Smart',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        Text(
          'Home',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
