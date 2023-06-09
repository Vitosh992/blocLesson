import 'package:bloc_lesson/BlocStateManagmentTemplates/UI/UIScreen.dart';
import 'package:bloc_lesson/BlocStateManagmentTemplates/bloc/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_lesson/BlocStateManagmentTemplates/data/Todo.dart';

import 'BlocStateManagmentTemplates/bloc/api_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ApiBloc(),
        child: MyBlocPage(),
      ),
    );
  }
}

class MyBlocPage extends StatelessWidget {
  const MyBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: buildBloc(),
    );
  }

  Widget buildBloc() {
    return BlocBuilder<ApiBloc, ApiState>(builder: (context, state){
      if(state is InitialState) {
        return UIScreen().buildInitialView(context);
      }
      if (state is Loading){
        return Center(child: CircularProgressIndicator());
      }
      if (state is SuccessToDo) {
        return buildToDoList(state.todoList);
      }
      return Text('Error');
    });
  }

  Widget buildToDoList(List<ToDo> toDos) {
    return ListView.builder(
      itemCount: toDos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = toDos[index];
        return ListTile(
          leading: Icon(
            todo.completed ? Icons.check_circle : Icons.circle,
            color: todo.completed ? Colors.green : Colors.grey,
          ),
          title: Text(todo.title),
        );
      },
    );
  }
}







