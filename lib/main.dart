import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/views/auth/login.dart';
import 'package:amplifyit/views/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'amplifyconfiguration.dart';

void main() async {
  await initializeDateFormatting();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PostService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;
  bool _isSignedIn = false;
  StreamSubscription subscription;
  AmplifyDataStore datastorePlugin;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    Amplify.addPlugins([AmplifyAuthCognito(), datastorePlugin, AmplifyAPI()]);

    // subscription = Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
    //   switch (hubEvent.eventName) {
    //     case 'SIGNED_IN':
    //       {
    //         setState(() {
    //           _isSignedIn = true;
    //         });
    //         print('HUB: USER IS SIGNED IN');
    //       }
    //       break;
    //     case 'SIGNED_OUT':
    //       {
    //         setState(() {
    //           _isSignedIn = false;
    //         });
    //         print('HUB: USER IS SIGNED OUT');
    //       }
    //       break;
    //     case 'SESSION_EXPIRED':
    //       {
    //         setState(() {
    //           _isSignedIn = false;
    //         });
    //         print('HUB: USER SESSION HAS EXPIRED');
    //       }
    //       break;
    //   }
    // });

    try {
      await Amplify.configure(amplifyconfig);
      print('Successfully configured Amplify 🎉');
    } on AmplifyAlreadyConfiguredException {
      print("Amplify was already configured. Was the app restarted?");
    }

    try {
      _isSignedIn = await isSignedIn();
      var res = await Amplify.Auth.getCurrentUser();
      print(res.username);
    } on AmplifyException catch (e) {
      print('User is not signed in: $e');
    }

    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isSignedIn() async {
    final session = await Amplify.Auth.fetchAuthSession();
    return session.isSignedIn;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmplifyIt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          )),
      home: _amplifyConfigured
          ? _isSignedIn
              ? Home()
              : LogIn()
          : Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
