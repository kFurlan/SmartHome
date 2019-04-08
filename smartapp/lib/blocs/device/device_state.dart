import 'package:equatable/equatable.dart';

abstract class DeviceState extends Equatable {}

class DeviceEmpty extends DeviceState {}

class DeviceLoaded extends DeviceState {}

class DeviceLoading extends DeviceState {}
