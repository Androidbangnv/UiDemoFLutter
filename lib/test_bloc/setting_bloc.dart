import 'dart:async';
import 'package:bloc/bloc.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<DataEvent, DataState> {
  int count = 0;
  SettingBloc() : super(initState());

  @override
  Stream<DataState> mapEventToState(DataEvent event) async*{
    if (event is Increment) {
        yield  Loading();
        await Future.delayed(Duration(seconds: 1));
        count++;
        yield Success(count);

    }
    

  }
}
