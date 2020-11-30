import 'package:flutter/material.dart';
import 'package:unclechat_v1/bloc/auth/bloc.dart';
import 'package:unclechat_v1/bloc/auth/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unclechat_v1/form/info.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ProfileScreen());
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              if (context.locale == Locale('en')) {
                context.locale = Locale('vi');
              } else {
                context.locale = Locale('en');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InfoForm(),
            ],
          ),
        ),
      ),
    );
  }
}
