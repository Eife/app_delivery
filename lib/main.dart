
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/register_bloc/register_bloc.dart';
import 'package:hmelnaya_lavka_app/bloc/turn_food_bloc/bloc/turn_food_bloc.dart';
import 'package:hmelnaya_lavka_app/firebase_options.dart';
import 'package:hmelnaya_lavka_app/screens/register_screen_phone.dart';
import 'package:hmelnaya_lavka_app/screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = MyBlocObserver();
  
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()), 
      BlocProvider<TurnFoodBloc>(
      create: (context) => TurnFoodBloc(), 
  )],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: "/",
      routes: {
        '/':(context) => RegisterPhoneScreen(),
        '/start_screen':(context) => StartScreen(),
      },

      
      
    );
  }
}
class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }
}


