import 'package:flutter/material.dart';

class RoomEditPage extends StatefulWidget {
  @override
  RoomEditPageState createState() => RoomEditPageState();
}

class RoomEditPageState extends State<RoomEditPage> {
  String dropDownValue;
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
                    value: 'Quarto',
                    child: Text('Quarto'),
                  ),
                  DropdownMenuItem(
                    value: 'Banheiro',
                    child: Text('Banheiro'),
                  ),
                  DropdownMenuItem(
                    value: 'Garagem',
                    child: Text('Garagem'),
                  ),
                  DropdownMenuItem(
                    value: 'Sala de estar',
                    child: Text('Sala de estar'),
                  ),
                  DropdownMenuItem(
                    value: 'Cozinha',
                    child: Text('Cozinha'),
                  ),
                  DropdownMenuItem(
                    value: 'Escritório',
                    child: Text('Escritório'),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(16),
                  child: Text('SALVAR'),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
