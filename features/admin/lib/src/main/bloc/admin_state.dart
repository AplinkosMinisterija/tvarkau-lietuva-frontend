part of 'admin_bloc.dart';

abstract class AdminState {}

class LoadingState implements AdminState {}

class LogingState implements AdminState {}

class ContentState implements AdminState {
  final LogInDto userInfo;

  ContentState({required this.userInfo});
}

class ErrorState implements AdminState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
