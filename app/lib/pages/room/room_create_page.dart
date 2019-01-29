import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/state/room_bloc.dart';
import 'package:smarthome/state/room_event.dart';

class RoomCreatePage extends StatefulWidget {
  @override
  _RoomCreatePageState createState() => _RoomCreatePageState();
}

class _RoomCreatePageState extends State<RoomCreatePage> {
  RoomBloc _roomBloc;
  String dropDownValue;

  @override
  void initState() {
    _roomBloc = BlocProvider.of<RoomBloc>(context);
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome do Cômodo'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropDownValue,
                hint: Text('Tipo de cômodo'),
                onChanged: (String value) {
                  setState(() {
                    this.dropDownValue = value;
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
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(16),
                child: Text('CADASTRAR'),
                onPressed: () {
                  _roomBloc.dispatch(
                    InsertRoom(name: 'Quarto das crianças', type: 'Quarto'),
                  );
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
