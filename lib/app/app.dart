import 'package:completion_repository/completion_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkme/home/bloc/home_bloc/home_bloc.dart';
import 'package:talkme/home/view/home_view.dart';

class App extends StatelessWidget {
  const App({super.key, required CompletionRepository completionRepository})
      : _completionRepository = completionRepository;

  final CompletionRepository _completionRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider.value(value: _completionRepository)],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                  lazy: false,
                  create: (context) =>
                      HomeBloc(completionRepository: _completionRepository)
                        ..add(const HomeEventStarted()))
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              title: 'Talkme',
              home: DashboardView(),
            )));
  }
}
