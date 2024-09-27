import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationLoading extends NavigationState {}

class NavigationSuccess extends NavigationState {}

class NavigationError extends NavigationState {
  final String message;

  NavigationError(this.message);

  @override
  List<Object?> get props => [message];
}
