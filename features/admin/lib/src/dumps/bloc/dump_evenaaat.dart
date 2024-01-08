part of 'dump_blocaaaa.dart';

abstract class DumpEventaaaa {}

class LoadData implements DumpEventaaaa {}

class ReloadPage implements DumpEventaaaa {}

class UpdateDump implements DumpEventaaaa {
  final String id;
  final String name;
  final String moreInformation;
  final String workingHours;
  final String phone;
  final String isVisible;
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
