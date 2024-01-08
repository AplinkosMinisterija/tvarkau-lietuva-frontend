part of 'dump_bloc.dart';

abstract class DumpEvent {}

class LoadData implements DumpEvent {
  final String refId;

  LoadData({
    required this.refId,
  });
}

class ReloadPage implements DumpEvent {}

class UpdateDump implements DumpEvent {
  final String id;
  final String name;
  final String moreInformation;
  final String workingHours;
  final String phone;
  final bool isVisible;
  final double longitude;
  final double latitude;
  final String address;

  UpdateDump({
    required this.id,
    required this.name,
    required this.moreInformation,
    required this.workingHours,
    required this.phone,
    required this.isVisible,
    required this.longitude,
    required this.latitude,
    required this.address,
  });
}
