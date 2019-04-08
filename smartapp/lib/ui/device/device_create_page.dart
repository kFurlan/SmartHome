import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/device/device_bloc.dart';
import 'package:smartapp/blocs/device/device_event.dart';

class DeviceCreatePage extends StatefulWidget {
  @override
  _DeviceCreatePageState createState() => _DeviceCreatePageState();
}

class _DeviceCreatePageState extends State<DeviceCreatePage> {

  DeviceBloc _deviceBloc;
  String _dropDownValue;
  String _textFormValue;
  final _deviceCreateKey = GlobalKey<FormState>();

  @override
  void initState() {
    _deviceBloc = BlocProvider.of<DeviceBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Dispositivo'),
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
            key: _deviceCreateKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  maxLength: 60,
                  validator: (String value) {
                    if (value == null || value.isEmpty)
                      return 'Este campo não pode ficar vazio';
                  },
                  onSaved: (String value) {
                    this._textFormValue = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome do Dispositivo',
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
                        if (_deviceCreateKey.currentState.validate()) {
                          _deviceCreateKey.currentState.save();
                          _deviceBloc.dispatch(
                            InsertDevice(
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
