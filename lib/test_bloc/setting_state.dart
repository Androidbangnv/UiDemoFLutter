part of 'setting_bloc.dart';

class DataState {}

class initState extends DataState{

}

class Loading extends DataState {}

class Success extends DataState {
  int count = 0;

  Success(this.count);
}
