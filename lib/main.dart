import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/InfiniteList/bloc/post_bloc.dart';
import 'package:todo_list/InfiniteList/bloc/post_event.dart';
import 'package:todo_list/InfiniteList/widgets/post_list.dart';
import 'package:todo_list/basic/transaction.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      home: Scaffold(
          appBar: AppBar(title: const Text('Posts')),
          body: BlocProvider(
            create: (_) =>
                PostBloc(httpClient: http.Client())..add(PostFetched()),
            child: PostsList(),
          )),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
