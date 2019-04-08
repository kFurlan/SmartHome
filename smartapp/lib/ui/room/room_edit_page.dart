import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/room/room_bloc.dart';
import 'package:smartapp/blocs/room/room_event.dart';
import 'package:smartapp/data/room/room.dart';

class RoomEditPage extends StatefulWidget {
  final Room model;

  const RoomEditPage({@required this.model});

  @override
  RoomEditPageState createState() => RoomEditPageState();
}

class RoomEditPageState extends State<RoomEditPage> {
  RoomBloc _roomBloc;
  String _roomType;
  String _roomName;
  final _roomCreateKey = GlobalKey<FormState>();

  @override
  void initState() {
    this._roomBloc = BlocProvider.of<RoomBloc>(context);
    this._roomName = widget.model.name;
    this._roomType = widget.model.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cômodo'),
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
                  initialValue: _roomName,
                  maxLength: 60,
                  validator: (String value) {
                    if (value == null || value.isEmpty)
                      return "O nome do cômodo não pode estar vazio";
                  },
                  onSaved: (String value) {
                    this._roomName = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome do Cômodo',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: _roomType,
                  validator: (String value) {
                    if (value == null || value.isEmpty)
                      return "Selecione um tipo de cômodo";
                  },
                  hint: Text('Tipo de cômodo'),
                  onChanged: (String value) {
                    setState(() {
                      this._roomType = value;
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
                      child: Text('SALVAR'),
                      onPressed: () {
                        if (_roomCreateKey.currentState.validate()) {
                          _roomCreateKey.currentState.save();
                          final _model = Room((b) => b
                            ..id = widget.model.id
                            ..name = _roomName
                            ..type = _roomType);
                          _roomBloc.dispatch(
                            EditRoom(model: _model),
                          );
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('EXCLUIR'),
                      onPressed: () {
                        _roomBloc.dispatch(
                          DeleteRoom(id: widget.model.id),
                        );
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
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
