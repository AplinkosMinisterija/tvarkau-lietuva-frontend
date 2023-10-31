part of 'admin_bloc.dart';

abstract class AdminEvent {}

class LoadData implements AdminEvent {}

class LogIn implements AdminEvent {}

class LogOut implements AdminEvent {}

class ReloadPage implements AdminEvent {}
