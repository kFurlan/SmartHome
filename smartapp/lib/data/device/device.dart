import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device.g.dart';

abstract class Device implements Built<Device, DeviceBuilder> {
  String get id;

  String get name;

  String get type;

  Device._();

  factory Device([updates(DeviceBuilder b)]) = _$Device;

  static Serializer<Device> get serializer => _$deviceSerializer;
}
