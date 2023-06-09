

import '../data/Todo.dart';

abstract class ApiState {}

class InitialState extends ApiState {}

class Failure extends ApiState {}
class Loading extends ApiState {}
class SuccessToDo extends ApiState {

  List<ToDo> todoList;
  SuccessToDo(this.todoList);
}


