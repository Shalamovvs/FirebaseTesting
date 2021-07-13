import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/bloc/MainBloc.dart';
import 'package:new_application/screens/auth/SignInScreen.dart';
import 'package:new_application/screens/auth/SignUpScreen.dart';
import 'package:new_application/widgets/buttons/AuthTextButton.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuthExampleApp());
}

class AuthExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(),
          ),
        ],
          child: MaterialApp(
          title: 'Firebase Example App',
          theme: ThemeData.dark(),
          home: Scaffold(
            body: AuthTypeSelector(),
          ),
        ),
      ),
    );
  }
}

class AuthTypeSelector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: AuthTextButton(title: 'Регистрация', page: SignUpScreen())
            ),
            Container(
              child: AuthTextButton(title: 'Авторизация', page: SignInScreen())
              
            ),
          ],
        ),
      ),
    );
  }
}
