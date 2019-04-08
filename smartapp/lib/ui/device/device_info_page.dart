import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartapp/blocs/device/device_bloc.dart';
import 'package:smartapp/blocs/device/device_state.dart';
import 'package:smartapp/data/device/device.dart';
import 'package:smartapp/ui/device/device_create_page.dart';
import 'package:smartapp/ui/device/device_edit_page.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceCreatePageState createState() => _DeviceCreatePageState();
}

class _DeviceCreatePageState extends State<DeviceInfoPage> {
  DeviceBloc _deviceBloc;

  @override
  void initState() {
    _deviceBloc = BlocProvider.of<DeviceBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dispositivos'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<DeviceBloc>(
                        bloc: _deviceBloc,
                        child: DeviceCreatePage(),
                      ),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder(
        bloc: _deviceBloc,
        builder: (BuildContext context, DeviceState state) {
          if (state is DeviceEmpty) {
            return Center(
              child: Text(
                'Nenhum dispositivo cadastrado.',
              ),
            );
          } else if (state is DeviceLoaded) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: _deviceBloc.devices.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 2.0,
                    ),
                    child: _buildDeviceListItem(
                        _deviceBloc.devices[index], context),
                  );
                });
          } else {
            return Center(
              child: Text(
                'Erro ao carregar dispositivos',
                style: TextStyle(fontSize: 48.0),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDeviceListItem(Device model, BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 90.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  child: Placeholder(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${model.name}',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text('${model.type}'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ButtonTheme.bar(
                    child: OutlineButton(
                      child: Text(
                        'EDITAR',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<DeviceBloc>(
                                  bloc: _deviceBloc,
                                  child: DeviceEditPage(
                                    model: model,
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
