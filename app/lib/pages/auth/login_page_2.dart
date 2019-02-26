import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
    final _formKey = GlobalKey<FormState>();
    // Build a Form widget using the _formKey we created above
    return new Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Smart',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w100, color: Colors.white),
          ),
          Text(
            'Home',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextFormField(
              style: new TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                hintText: "Usuário",
                contentPadding: new EdgeInsets.fromLTRB(15, 15, 5, 5),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(width: 2),
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
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextFormField(
              style: new TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "Senha",
                contentPadding: new EdgeInsets.fromLTRB(15, 15, 5, 5),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(width: 2),
                    borderRadius: new BorderRadius.circular(20.0)),
              ),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: RaisedButton(
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
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: const Text('Acesso'),
            ),
          ),
        ],
      ),
    );
  }
}
