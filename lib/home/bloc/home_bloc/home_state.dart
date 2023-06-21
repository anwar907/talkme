part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.status = GlobalStatus.initial,
      this.completionModels,
      this.message = 'Something Error'});
  final GlobalStatus status;
  final CompletionModels? completionModels;
  final String? message;

  HomeState copyWith(
      {CompletionModels? completionModels,
      GlobalStatus? status,
      String? message}) {
    return HomeState(
        completionModels: completionModels ?? this.completionModels,
        status: status ?? this.status,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [completionModels, status, message];
}
