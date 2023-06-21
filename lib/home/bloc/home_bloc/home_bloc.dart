import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:completion_repository/completion_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEventStarted, HomeState> {
  HomeBloc({required CompletionRepository completionRepository})
      : _completionRepository = completionRepository,
        super(const HomeState()) {
    on<HomeEventStarted>(mapEventToState);
  }

  final CompletionRepository _completionRepository;

  Future<void> mapEventToState(
      HomeEventStarted event, Emitter<HomeState> emit) async {
    /// default role is [user] you can change with other role
    try {
      final fetchCompletion = await _completionRepository.fetchDataCompletion(
          role: 'user', value: event.messageValue);

      emit(state.copyWith(
          completionModels: fetchCompletion, status: GlobalStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(message: e.toString(), status: GlobalStatus.failure));
    }
  }
}
