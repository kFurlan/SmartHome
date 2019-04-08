import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'room.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Room,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
