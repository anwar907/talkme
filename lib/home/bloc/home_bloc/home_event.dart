part of 'home_bloc.dart';

class HomeEventStarted extends Equatable {
  final String? messageValue;

  const HomeEventStarted({this.messageValue});

  @override
  // TODO: implement props
  List<Object?> get props => [messageValue];
}
