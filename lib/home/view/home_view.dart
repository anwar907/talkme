import 'package:api_client/enum/enum.dart';
import 'package:completion_repository/completion_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talkme/home/bloc/home_bloc/home_bloc.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Talkme'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state.status == GlobalStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == GlobalStatus.success) {
          return Center(
            child:
                Text(state.completionModels?.choise?[0].message?.content ?? ''),
          );
        } else if (state.status == GlobalStatus.failure) {
          return Container(
            color: Colors.transparent,
            child: Center(
              child: Text(state.message ?? ''),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return AlertDialog(
                      title: const Text('Ask me question'),
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: controller,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    child: const Text("Submit"),
                                    onPressed: () {
                                      HomeBloc(
                                              completionRepository: context
                                                  .read<CompletionRepository>())
                                          .add(HomeEventStarted(
                                              messageValue: controller.text));
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
