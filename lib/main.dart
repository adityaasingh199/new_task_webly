import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_task_webly/api_helper/api_helper.dart';
import 'package:new_task_webly/bloc/task_bloc.dart';
import 'package:new_task_webly/screen/home_page.dart';

void main() {
  runApp( BlocProvider(create: (context) => TaskBloc(apiHelper: ApiHelper()),child: MyApp(),),);
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
