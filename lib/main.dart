import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/dashboard.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'amplifyconfiguration.dart';
import 'helpers/constants.dart';
import 'helpers/route_page.dart';

Future<void> main() async {
  await initializeDateFormatting();
  runApp(MultiProvider(
    providers: <ChangeNotifierProvider<dynamic>>[
      ChangeNotifierProvider<PostService>(create: (_) => PostService()),
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

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    if (!mounted) return;

    await Amplify.addPlugins(<AmplifyPluginInterface>[
      AmplifyAuthCognito(),
      AmplifyDataStore(modelProvider: ModelProvider.instance),
      AmplifyAPI()
    ]);

    try {
      await Amplify.configure(amplifyconfig);
      // ignore: avoid_print
      print('Successfully configured Amplify 🎉');
    } on PlatformException {
      // ignore: avoid_print
      print('AmplifyAlreadyConfiguredException exception');
    } on AmplifyAlreadyConfiguredException {
      // ignore: avoid_print
      print('Amplify was already configured. Was the app restarted?');
    }

    try {
      _isSignedIn = await isSignedIn();
      setState(() {});
    } on AmplifyException catch (e) {
      // ignore: avoid_print
      print('User is not signed in: $e');
    }

    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<bool> isSignedIn() async {
    final AuthSession session = await Amplify.Auth.fetchAuthSession();
    return session.isSignedIn;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: MaterialApp(
        title: 'AmplifyIt',
        debugShowCheckedModeBanner: false,
        builder: (_, Widget child) =>
            ScrollConfiguration(behavior: MyBehavior(), child: child),
        theme: ThemeData(
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              textTheme:
                  GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
            )),
        home: _amplifyConfigured
            ? _isSignedIn
                ? Dashboard()
                : LogIn()
            : Scaffold(
                body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/loading.svg',
                    height: 300,
                  ),
                  const SizedBox(height: 20),
                  const Center(child: CircularProgressIndicator()),
                ],
              )),
        onGenerateRoute: RoutePage.generateRoute,
        initialRoute: RouteConstant.ROOT,
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
