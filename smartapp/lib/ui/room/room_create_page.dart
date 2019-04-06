import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/room/room_bloc.dart';
import 'package:smartapp/blocs/room/room_event.dart';

class RoomCreatePage extends StatefulWidget {
  @override
  _RoomCreatePageState createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomCreatePage> {
  RoomBloc _roomBloc;
  String _dropDownValue;
  String _textFormValue;
  final _roomCreateKey = GlobalKey<FormState>();

  @override
  void initState() {
    this._roomBloc = BlocProvider.of<RoomBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Cômodo'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _roomCreateKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  maxLength: 60,
                  validator: (String value) {
                    if (value == null || value.isEmpty)
                      return "O nome do cômodo não pode estar vazio";
                  },
                  onSaved: (String value) {
                    this._textFormValue = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome do Cômodo',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: _dropDownValue,
                  validator: (String value) {
                    if (value == null || value.isEmpty)
                      return "Selecione um tipo de cômodo";
                  },
                  hint: Text('Tipo de cômodo'),
                  onChanged: (String value) {
                    setState(() {
                      this._dropDownValue = value;
                    });
                  },
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'quarto',
                      child: Text('Quarto'),
                    ),
                    DropdownMenuItem(
                      value: 'banheiro',
                      child: Text('Banheiro'),
                    ),
                    DropdownMenuItem(
                      value: 'garagem',
                      child: Text('Garagem'),
                    ),
                    DropdownMenuItem(
                      value: 'sala_de_estar',
                      child: Text('Sala de estar'),
                    ),
                    DropdownMenuItem(
                      value: 'cozinha',
                      child: Text('Cozinha'),
                    ),
                    DropdownMenuItem(
                      value: 'escritorio',
                      child: Text('Escritório'),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(16),
                      child: Text('CADASTRAR'),
                      onPressed: () {
                        if (_roomCreateKey.currentState.validate()) {
                          _roomCreateKey.currentState.save();
                          _roomBloc.dispatch(
                            InsertRoom(
                              name: this._textFormValue,
                              type: this._dropDownValue,
                            ),
                          );
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
