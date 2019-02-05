
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeData(
    //   primaryColor: Colors.blue
    // );
    return Form(
        child: Column(
          
    children: <Widget>[
      SizedBox(
        height: 30.0,
      ), // gamb para deixar texto mais para baixo
      TextField(
        decoration: InputDecoration(
          labelText: "Nome" ,
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Telefone",
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Data de Nascimento",
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Senha",
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
        ),
        obscureText: true,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Confirme sua senha",
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
        ),
        obscureText: true,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
      ),
      RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: new Text("Cadastrar")),
      FlatButton(
        onPressed: () {},
        textColor: Colors.white,
        child: new Text("Voltar para login"),
        color: Colors.blueAccent,
      )
    ],
        ),
      );
  }
}
