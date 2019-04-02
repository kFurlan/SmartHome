import 'package:flutter/material.dart';

class DeviceAddPage extends StatefulWidget {
  @override
  _DeviceAddPageState createState() => _DeviceAddPageState();
}

class _DeviceAddPageState extends State<DeviceAddPage> {
  String _dropDownValue;
  String _textFormValue;


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
