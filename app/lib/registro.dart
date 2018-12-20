import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ThemeData(
    //   primaryColor: Colors.blue
    // );
    return Form(
                  child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,), // gamb para deixar texto mais para baixo
              TextField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.yellow)
                  ),
                  hintText: "Nome",
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                   border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.yellow)
                  ),
                  hintText: "Telefone",
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                   border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.yellow)
                  ),
                  hintText: "Data de Nascimento",
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                   border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.yellow)
                  ),
                  hintText: "Senha",
                ),
                obscureText: true,
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                   border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.yellow)
                  ),
                  hintText: "Confirme sua senha",
                ),
                obscureText: true,
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                onPressed: null,
                textColor: Colors.white,
                color: Colors.blueAccent,
                child:new Text("Cadastrar")
                ),
                FlatButton(
                  onPressed: null,
                  child: new Text("Voltar para login"),
                  color: Colors.blue,
                )
            ],
      ),
    );
  }
}