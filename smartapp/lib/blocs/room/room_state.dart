import 'package:equatable/equatable.dart';

abstract class RoomState extends Equatable {}

class RoomEmpty extends RoomState {}

class RoomLoaded extends RoomState {}

class RoomLoading extends RoomState {}
