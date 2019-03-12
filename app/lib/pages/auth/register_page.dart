import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
    final _formKey = GlobalKey<FormState>();
    // Build a Form widget using the _formKey we created above
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 25, 10),
                    child: TextFormField(
                      style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle, size: 35),
                        hintText: "Nome",
                        contentPadding: new EdgeInsets.fromLTRB(15, 15, 5, 5),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(width: 4),
                            borderRadius: new BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 25, 10),
                    child: TextFormField(
                      style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone, size: 35),
                        hintText: "Telefone",
                        contentPadding: new EdgeInsets.fromLTRB(15, 15, 5, 5),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(width: 4),
                            borderRadius: new BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 25, 10),
                    child: TextFormField(
                      style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.date_range, size: 35),
                        hintText: "Data de nascimento",
                        contentPadding: new EdgeInsets.fromLTRB(15, 15, 5, 5),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(width: 4),
                            borderRadius: new BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 25, 10),
                    child: TextFormField(
                      style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock, size: 35),
                        hintText: "Senha",
                        contentPadding: new EdgeInsets.fromLTRB(15, 15, 5, 5),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(width: 4),
                            borderRadius: new BorderRadius.circular(20.0)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(45, 10, 45, 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(45, 13, 45, 13),
                        elevation: 0,
                        color: Colors.white,
                        splashColor: Colors.blueGrey,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, we want to show a Snackbar
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: const Text('Acesso'),
                      ),
                    ),
                  ),

                  /* // gamb para deixar texto mais para baixo
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                    ),
                  ),*/

                  /*TextField(
                    decoration: InputDecoration(
                      labelText: "Telefone",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                    ),
                  ),*/

                  /*TextField(
                    decoration: InputDecoration(
                      labelText: "Data de Nascimento",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                    ),
                  ),*/

                  /* TextField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                    ),
                    obscureText: true,
                  ),*/

                  /*TextField(
                    decoration: InputDecoration(
                      labelText: "Confirme sua senha",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                    ),
                    obscureText: true,
                  ),*/

                  RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      child: new Text("Cadastrar")),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    textColor: Colors.white,
                    child: new Text("Voltar para login"),
                    color: Colors.blueAccent,
                  )
                ],
              ),
            )));
  }
}
