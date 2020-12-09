import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_demo_1/preferences/share_preference_key.dart';
import 'package:ui_demo_1/preferences/sharepreference_manager.dart';
import 'package:ui_demo_1/test_bloc/setting_bloc.dart';

void main() =>
    runApp(MaterialApp(
      home: TestBloc(),
    ));

class TestBloc extends StatefulWidget {
  @override
  _TestBlocState createState() => _TestBlocState();
}

class _TestBlocState extends State<TestBloc> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: BlocProvider<SettingBloc>(
        create: (context) {
          return SettingBloc();
        },
        child: Text('bangnv'),
      ),
    );
  }
}
