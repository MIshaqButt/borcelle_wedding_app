import 'package:borcelle_wedding_app/screens/create_account/cubit/create_account_cubit.dart';
import 'package:borcelle_wedding_app/screens/splash/splash_screen.dart';
import 'package:borcelle_wedding_app/utils/app_theme.dart';
import 'package:borcelle_wedding_app/utils/global_keys.dart';
import 'package:borcelle_wedding_app/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyPrefs.init();

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CreateAccountCubit())],
      child: const BorcelleWeddingApp(),
    ),
  );
}

class BorcelleWeddingApp extends StatelessWidget {
  const BorcelleWeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      theme: Themes().selectLightTheme(),
      home: const SplashScreen(),
    );
  }
}
