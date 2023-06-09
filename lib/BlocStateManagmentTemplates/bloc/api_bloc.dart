import '../bloc/api_event.dart';
import '../bloc/api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../data/Todo.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(InitialState()) {
    on<ToDoEventGet>(_toDoEventGet);
  }

  void _toDoEventGet(ToDoEventGet event, Emitter<ApiState> emitter) async {
    try {
      emitter(Loading());
      List<ToDo> toDos = await getToDo();
      emitter(SuccessToDo(toDos));
    } catch (e) {
      print(e);
      emitter(Failure());
    }
  }

  Future<List<ToDo>> getToDo() async {
    List<ToDo> toDoList = [];
    Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      body.forEach((json) {
        print(json);
        toDoList.add(ToDo.fromJson(json));
      });
      return toDoList;
    }
    return [];
  }
}
