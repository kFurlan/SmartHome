import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceCreatePage extends StatefulWidget {
  @override
  _DeviceCreatePageState createState() => _DeviceCreatePageState();
}

class _DeviceCreatePageState extends State<DeviceCreatePage> {
  // DeviceBloc _deviceBloc;
  String _dropDownValue;
  String _textFormValue;
  final _deviceCreateKey = GlobalKey<FormState>();

  @override
  void initState() {
    // this._deviceBloc = BlocProvider.of<DeviceBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: AppBar(
        title: Text('Cadastro de dispositívos'),
        leading: Icon(Icons.close),
      ),
    );
  }
}
