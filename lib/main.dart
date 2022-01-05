import 'package:dating/src/core/utils/resources/app_routes.dart';
import 'package:dating/src/core/utils/router.dart';
import 'package:dating/src/core/theme/app_theme.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating/src/injector.dart' as di; //Dependency injector


Future<void> main() async {
  await di.initializeDependencies();
  AppThemeData.lightDarkIconStatusBar();
  BlocOverrides.runZoned(
        () => runApp(MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Social Site',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.appThemeData(),
        initialRoute: '/',
        onGenerateRoute: RouterApp.generateRoute);
  }
}
