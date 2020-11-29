import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclechat_v1/app.dart';
import 'package:unclechat_v1/bloc/auth/bloc.dart';
import 'package:unclechat_v1/repo/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final userRepo = UserRepo();
  runApp(
    EasyLocalization(
      path: 'lang',
      supportedLocales: [Locale('en'), Locale('vi')],
      fallbackLocale: Locale('en'),
      child: UncleChat(userRepo: userRepo),
    ),
  );
}

class UncleChat extends StatelessWidget {
  UncleChat({this.userRepo});

  final UserRepo userRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: userRepo)],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => AuthBloc(userRepo))],
        child: App(),
      ),
    );
  }
}
