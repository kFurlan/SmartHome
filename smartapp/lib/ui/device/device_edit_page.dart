import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/device/device_bloc.dart';
import 'package:smartapp/blocs/device/device_event.dart';
import 'package:smartapp/data/device/device.dart';

class DeviceEditPage extends StatefulWidget {
  final Device model;

  const DeviceEditPage({@required this.model});

  @override
  DeviceEditPageState createState() => DeviceEditPageState();
}

class DeviceEditPageState extends State<DeviceEditPage> {
  DeviceBloc _deviceBloc;
  String _deviceId;
  String _deviceType;
  String _deviceName;
  final _deviceEditKey = GlobalKey<FormState>();

  @override
  void initState() {
    this._deviceBloc = BlocProvider.of<DeviceBloc>(context);
    this._deviceId = widget.model.id;
    this._deviceName = widget.model.name;
    this._deviceType = widget.model.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar dispositivo'),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            }),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _deviceEditKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _deviceName,
                  maxLength: 60,
                  validator: (String value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor! Digite o nome do dispositivo";
                    }
                  },
                  onSaved: (String value) {
                    this._deviceName = value;
                  },
                  decoration: InputDecoration(labelText: 'Nome do dispositivo'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(16),
                      child: Text('Salvar'),
                      onPressed: () {
                        if (_deviceEditKey.currentState.validate()) {
                          _deviceEditKey.currentState.save();
                          final _model = Device((b) =>
                          b
                            ..id = _deviceId
                            ..name = _deviceName
                            ..type = _deviceType);
                          _deviceBloc.dispatch(
                            EditDevice(model: _model),
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
                        _deviceBloc.dispatch(DeleteDevice(id: widget.model.id));
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
