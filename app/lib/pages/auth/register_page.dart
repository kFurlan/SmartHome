import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.blue[800],
                  Colors.blue[700],
                  Colors.blue[600],
                  Colors.blue[400],
                ])),
            child: new Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  // gamb para deixar texto mais para baixo
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
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
            )));
  }
}
