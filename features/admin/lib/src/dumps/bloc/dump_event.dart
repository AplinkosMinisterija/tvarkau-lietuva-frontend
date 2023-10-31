part of 'dump_bloc.dart';

abstract class DumpEvent {}

class LoadData implements DumpEvent {}

class ReloadPage implements DumpEvent {}

class UpdateDump implements DumpEvent {
  final String id;
  final String name;
  final String moreInformation;
  final String workingHours;
  final String phone;
  final String isVisible;

  UpdateDump({
    required this.id,
    required this.name,
    required this.moreInformation,
    required this.workingHours,
    required this.phone,
    required this.isVisible,
  });
}
