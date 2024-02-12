part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadData implements HomeEvent {}

class LoadTrashData implements HomeEvent {}

class LoadForestData implements HomeEvent {}

class ReloadPage implements HomeEvent {}
