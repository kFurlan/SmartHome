
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
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
          hintText: "Nome",
        ),
      ),
      Padding(
        // height: 10.0,
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
          hintText: "Telefone",
        ),
      ),
      Padding(
        // height: 10.0,
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
          hintText: "Data de Nascimento",
        ),
      ),
      Padding(
        // height: 10.0,
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
          hintText: "Senha",
        ),
        obscureText: true,
      ),
      Padding(
        // height: 10.0,
        padding: const EdgeInsets.all(10.0),
      ),
      TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.yellow)),
          hintText: "Confirme sua senha",
        ),
        obscureText: true,
      ),
      Padding(
        // height: 10.0,
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
