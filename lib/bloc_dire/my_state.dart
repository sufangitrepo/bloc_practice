part of 'my_bloc.dart';

abstract class MyState {}

class InitialState extends MyState {
  final String text;
  InitialState(this.text);
}

class FirstState extends MyState {
  String url;
  FirstState(this.url);
}

class SecondState extends MyState {
  double radius;
  double width;
  double height;
  SecondState(this.height, this.width, this.radius);
}

class ThirdState extends MyState {
  int id;
  String text;

  ThirdState(this.text, this.id);
}
