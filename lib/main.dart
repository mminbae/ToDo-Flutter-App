import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/blocs/bloc_exports.dart';
import 'package:todo/screens/tabs_screen.dart';
import 'package:todo/sevices/app_router.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationDocumentsDirectory(),
  // );
  // //Bloc.observer = MyBlocObserver();
  // //HydratedBlocOverrides.runZoned(runApp(const My App()), storage: storage);
  // HydratedBloc.storage = storage;

  // runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme: state.switchValue ? ThemeData.dark() : ThemeData.light(),
            home: const TabsScreen(),
            onGenerateRoute: appRouter.onGerateRoute,
          );
        },
      ),
    );
  }
}
